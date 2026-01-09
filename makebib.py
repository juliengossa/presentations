"""Simple PDF metadata extractor.

Provides `get_pdf_info(pdf_filename)` -> (title, date, author) and a
small CLI using argparse.
"""

from __future__ import annotations

import argparse
import os
import re
from datetime import datetime
import sys
from typing import Optional, Tuple, List, Dict, Any


URL_PREFIX="https://github.com/juliengossa/presentations/blob/main/"


def _normalize_meta_value(value: object) -> Optional[str]:
	"""Normalize a PDF metadata value into a Python str or None.

	Handles bytes (often UTF-16 with BOM), str, and other objects.
	Returns None for falsy values.
	"""
	if not value:
		return None

	# If it's already a str, just clean it
	if isinstance(value, str):
		s = value
	else:
		# Some PyPDF2 versions return bytes for strings; try decoding
		if isinstance(value, (bytes, bytearray)):
			b = bytes(value)
			for enc in ("utf-16", "utf-16-be", "utf-8", "latin-1"):
				try:
					s = b.decode(enc)
					break
				except Exception:
					s = None
			if s is None:
				# Fallback to repr
				s = repr(b)
		else:
			# Generic fallback
			try:
				s = str(value)
			except Exception:
				return None

	# Remove embedded nulls and surrounding whitespace
	s = s.replace('\x00', '').strip()

	# Final cleaning pass to remove BOM and odd punctuation
	s = _clean_meta_str(s)

	# Some PDF strings are enclosed in parentheses; remove them
	if len(s) >= 2 and s[0] == '(' and s[-1] == ')':
		s = s[1:-1].strip()

	return s or None


def _clean_meta_str(s: str) -> str:
	"""Clean up decoded metadata strings.

	- Remove common BOM remnants
	- Remove control characters
	- Replace unwanted punctuation sequences (` % # & ~ _ ) with a single space
	- Collapse multiple spaces
	"""
	if not s:
		return s

	# Remove common BOM markers
	s = s.lstrip('\ufeff\ufffe')
	# Some decodings produce literal Latin1 chars for BOM (rare): strip their prefixes
	s = re.sub(r'^[\u00fe\u00ff]+', '', s)

	# Remove other C0 control chars
	s = re.sub(r'[\x00-\x1f\x7f]+', ' ', s)

	# Remove/back off unwanted punctuation groups
	s = re.sub(r"[`%#&~_]+", ' ', s)

	# Collapse multiple spaces
	s = re.sub(r'\s+', ' ', s).strip()

	return s


def _parse_pdf_date(datestr: Optional[str]) -> Optional[str]:
	"""Parse PDF date strings into ISO date (YYYY-MM-DD) when possible.

	Handles common PDF date formats like "D:YYYYMMDDHHmmSS" and simple
	ISO-like strings. Returns None if parsing fails or input is falsy.
	"""
	if not datestr:
		return None

	# Strip surrounding prefix if present (e.g., "D:")
	if datestr.startswith("D:"):
		datestr = datestr[2:]

	# Try a few common patterns
	candidates = [
		(r"^(\d{14})", "%Y%m%d%H%M%S"),
		(r"^(\d{8})", "%Y%m%d"),
		(r"^(\d{4}-\d{2}-\d{2})", "%Y-%m-%d"),
	]

	for pattern, fmt in candidates:
		m = re.match(pattern, datestr)
		if m:
			token = m.group(1)
			try:
				dt = datetime.strptime(token, fmt)
				return dt.date().isoformat()
			except Exception:
				continue

	# Last resort: extract leading 4-digit year and build a YYYY-MM-DD
	m = re.match(r"^(\d{4})", datestr)
	if m:
		year = m.group(1)
		return f"{year}-01-01"

	return None


def get_pdf_info(pdf_filename: str) -> Tuple[Optional[str], Optional[str], Optional[str], Optional[str]]:
	"""Return (title, date, author) extracted from a PDF file's metadata.

	- `title`, `subtitle` and `author` are strings if present, otherwise None.
	- `date` is returned in ISO `YYYY-MM-DD` when parseable, otherwise None.

	Raises FileNotFoundError if the path does not exist, and raises ImportError
	with a helpful message if `PyPDF2` is not installed.
	"""
	if not os.path.exists(pdf_filename):
		raise FileNotFoundError(f"File not found: {pdf_filename}")

	try:
		from PyPDF2 import PdfReader
	except Exception as exc:  # ImportError or similar
		raise ImportError("PyPDF2 is required. Install with: pip install PyPDF2") from exc

	reader = PdfReader(pdf_filename)

	# PdfReader.metadata is a dictionary-like object with keys like '/Title'
	metadata = getattr(reader, "metadata", None) or {}

	# Try several common keys, then normalize/ decode
	title = _normalize_meta_value(metadata.get('/Title') or metadata.get('Title'))
	subtitle = _normalize_meta_value(metadata.get('/Subtitle') or metadata.get('Subtitle'))
	author = _normalize_meta_value(metadata.get('/Author') or metadata.get('Author'))

	# CreationDate or ModDate are typical
	raw_date = (
		metadata.get('/CreationDate')
		or metadata.get('CreationDate')
		or metadata.get('/ModDate')
		or metadata.get('ModDate')
	)

	raw_date = _normalize_meta_value(raw_date)
	date = _parse_pdf_date(raw_date)

	return title, subtitle, date, author


def _build_parser() -> argparse.ArgumentParser:
	p = argparse.ArgumentParser(description="Extract Title, Subtitle, Date and Author from one or more PDF files")
	p.add_argument("pdf", nargs='+', help="Path(s) to one or more PDF files")
	p.add_argument("--author", "-a", help="Override author for all generated entries")
	p.add_argument("--format", "-f", choices=["bibtex", "md"], default="bibtex",
				   help="Output format: 'bibtex' (default) or 'md' (markdown list)")
	return p


def _make_cite_key(author: Optional[str], date: Optional[str], title: Optional[str]) -> str:
	"""Build a simple cite key: Lastname + year + short-title-slug."""
	# author -> take first author token before comma, then last name
	last = "anon"
	if author:
		first_token = author.split(',')[0].strip()
		parts = first_token.split()
		if parts:
			last = re.sub(r"[^A-Za-z0-9]", '', parts[-1]) or 'anon'

	year = (date.split('-')[0] if date else '') or 'nd'

	# title slug: keep alnum words
	slug = ''
	if title:
		words = re.findall(r"[A-Za-z0-9]+", title)
		slug = ''.join(words[:3]).lower()
	if not slug:
		slug = 'item'

	return f"{last}{year}{slug}"


def print_pdf_info_bibtex(pdf_info) -> None:
	"""Print a BibTeX `@misc` entry for parsed PDF metadata.

	Assumes `pdf_info` is a dict with keys: `path`, `url`, `title`, `subtitle`,
	`date`, `author` (values may be None).
	"""
	path = pdf_info.get('path')
	url = pdf_info.get('url')
	title = pdf_info.get('title') or ''
	subtitle = pdf_info.get('subtitle')
	date = pdf_info.get('date')
	author = pdf_info.get('author')

	full_title = title
	if subtitle:
		if full_title:
			full_title = f"{full_title}: {subtitle}"
		else:
			full_title = subtitle

	key = _make_cite_key(author, date, title or subtitle)

	print(f"@misc{{{key},")
	if full_title:
		print(f"  title = {{{full_title}}},")
	if author:
		print(f"  author = {{{author}}},")
	if date:
		year = date.split('-')[0]
		print(f"  year = {{{year}}},")
		print(f"  timestamp = {{{date}}},")

	# include url if available
	if url:
		print(f"  url = {{{url}}},")
	if path:
		print(f"  note = {{Présentation}},")
	print("}")


def print_pdf_info_md(pdf_info) -> None:
	"""Print a single-line Markdown bullet for the parsed PDF metadata.

	Assumes `pdf_info` is a dict with keys: `path`, `url`, `title`, `subtitle`,
	`date`, `author`.
	"""
	title = pdf_info.get('title') or ''
	subtitle = pdf_info.get('subtitle')
	if subtitle:
		if title:
			title = f"{title}: {subtitle}"
		else:
			title = subtitle

	date = pdf_info.get('date')
	author = pdf_info.get('author') or 'N/A'
	url = pdf_info.get('url') or pdf_info.get('path') or ''

	print(f"- {date} — [{title}]({url})")


def get_all_pdf_infos(paths: List[str]) -> List[Dict[str, Any]]:
	"""Return a list of dicts with parsed metadata for each path.

	Each dict contains keys: `path`, `title`, `subtitle`, `date`, `author`.
	If a file failed to parse, the dict will contain an `error` key with
	the error message.
	"""
	results: List[Dict[str, Any]] = []
	for p in paths:
		try:
			title, subtitle, date, author = get_pdf_info(p)
			# build a repository URL for the file
			url = URL_PREFIX + p
			results.append({
				'path': p,
				'url': url,
				'title': title,
				'subtitle': subtitle,
				'date': date,
				'author': author,
			})
		except FileNotFoundError as e:
			results.append({'path': p, 'error': str(e)})
		except ImportError:
			# propagate import error (environment issue)
			raise
		except Exception as e:
			results.append({'path': p, 'error': str(e)})

	return results


def print_all_pdf_info(infos: List[Dict[str, Any]], *, sort_by_date: bool = True, reverse: bool = False, out_format: str = "bibtex") -> None:
	"""Print all infos as BibTeX entries.

	- Prints errors to stderr and skips them for BibTeX output.
	- When `sort_by_date` is True, entries with parseable `date` are sorted
	  first by date (None last). Use `reverse=True` for newest-first.
	"""
	# Separate errors
	errors = [i for i in infos if i.get('error')]
	entries = [i for i in infos if not i.get('error')]

	for e in errors:
		print(f"ERROR: {e.get('path')}: {e.get('error')}", file=sys.stderr)

	if sort_by_date:
		def sort_key(item: Dict[str, Any]):
			d = item.get('date')
			# None should sort after real dates
			return (d is None, d or '')
		entries.sort(key=sort_key, reverse=True)

	if out_format == "bibtex":
		for item in entries:
			print_pdf_info_bibtex(item)
			print()
	elif out_format == "md":
		print("# Liste des présentations\n")
		for item in entries:
			print_pdf_info_md(item)
    
	else:
		raise ValueError(f"Unknown output format: {out_format}")


def main() -> None:
	parser = _build_parser()
	args = parser.parse_args()

	infos = get_all_pdf_infos(args.pdf)

	# Apply author override if requested
	if getattr(args, 'author', None):
		for item in infos:
			if not item.get('error'):
				item['author'] = args.author

	print_all_pdf_info(infos, out_format=args.format)

	# exit non-zero if any parsing errors occurred
	if any(i.get('error') for i in infos):
		sys.exit(1)


if __name__ == "__main__":
	main()

