
rmarkdown::render("apddap.Rmd")

staplr::split_pdf(input_filepath = "programme.pdf", output_directory = ".", prefix = "programme_p")

staplr::select_pages(99:100, input_filepath = "tdbesr-rapport.pdf", output_filepath = "unistra.pdf")
staplr::rotate_pdf(page_rotation = 270, input_filepath = "unistra.pdf", output_filepath = "unistra.pdf")
staplr::select_pages(296:309, input_filepath = "tdbesr-rapport.pdf", output_filepath = "classement.pdf")
staplr::rotate_pdf(page_rotation = 270, input_filepath = "classement.pdf", output_filepath = "classement.pdf")

staplr::staple_pdf(input_files = c("programme_p0001.pdf", 
                                   "apddap.pdf", 
                                   "unistra.pdf",
                                   "classement.pdf",
                                   "programme_p0002.pdf"), 
                   output_filepath = "apddap-print.pdf")
