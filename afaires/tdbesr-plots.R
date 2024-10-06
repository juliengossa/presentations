
rentrée <- 2021

# Style

k_style <- kpiesr_style(
  point_size = 16,
  line_size = 1,
  text_size = 4,
  yaxis_position = "left",
  evol_y_breaker = scale_100_breaker)

o_style <- kpiesr_style(
  point_size = 12,
  line_size = 0.7,
  text_size = 3,
  primaire_margin = 1.25,
  strip_labeller = lfc_dont_labeller,
  yaxis_position = "left",
  evol_y_breaker = scale_100_breaker)

lfc_pc_labeller_custom <- function(labels) {
  return(
    stringr::str_replace(lfc_pc_labeller(labels),"\\(","\n (")
  )
}

onorm_style <- kpiesr_style(
  point_size = 12,
  line_size = 0.7,
  text_size = 3,
  primaire_margin = 1.25,
  strip_labeller = lfc_pc_labeller_custom,
  label_wrap = 12,
  evol_y_breaker = scale_100_breaker
)


theme_set(ggcpesrthemes::theme_cpesr() + 
            theme(plot.title = element_text(hjust=1),
                  panel.spacing = unit(2,"lines"), 
                  plot.margin = margin(0,0,0,0),
                  strip.text = element_text(size=rel(0.7), 
                                            margin=margin(c(2,0,2,0)))))



axis_text_size_rel <- 0.8

rm_lt <- ggplot2::theme(legend.position = "none",
                        axis.title.x = element_blank(),
                        axis.title.y = element_blank(),
                        axis.ticks.x = element_blank())
rm_label <- ggplot2::theme(legend.position = "none",
                           axis.title.x = element_blank(),
                           axis.title.y = element_blank(),
                           strip.background = element_blank(),
                           strip.text.x = element_blank())
rm_xytext <- rm_lt + ggplot2::theme(axis.text.x = element_blank(), axis.ticks.x = element_blank(),
                                    axis.text.y = element_blank(), axis.ticks.y = element_blank())
rm_ytext <- rm_lt + ggplot2::theme(axis.text.y = element_blank(), axis.ticks.y = element_blank())
shrink_xtext <- ggplot2::theme(axis.text.x = element_text(margin = margin(0,0,0,0)))
rm_ymingrid <- ggplot2::theme(panel.grid.minor.y = element_blank())
rm_ygrid <- ggplot2::theme(panel.grid.major.y = element_blank(), panel.grid.minor.y = element_blank())
rm_xgrid <- ggplot2::theme(panel.grid.major.x = element_blank(), panel.grid.minor.x = element_blank())
sats <- ggplot2::theme(axis.text.x = element_text(size = rel(axis_text_size_rel)),
                       axis.text.y = element_text(size = rel(axis_text_size_rel)))
bottit <- ggplot2::theme(plot.caption = element_text(hjust = 0.5, size=rel(1.2)),
                         plot.title = element_text(hjust=0.5))
rl_margin <- ggplot2::theme(plot.margin = margin(l=10,r=10))
rle_margin <- ggplot2::theme(plot.margin = margin(l=3,r=10))
rL_margin <- ggplot2::theme(plot.margin = margin(l=10,r=35))
rm_facetmargins <- ggplot2::theme(panel.spacing = unit(0, "lines"))
small_facetmargins <- ggplot2::theme(panel.spacing = unit(10, "pt"))
rm_ytextmargin <- ggplot2::theme(axis.text.y=element_text(margin=margin(r=-5)))

# functions

separator <- function(texte, color="grey", espace=0.1, linesize = 1, textsize=12) {
  y <- 0.4
  ggdraw() +
    draw_line(x = c(0, 1), y = c(y, y), color = color, size = linesize, alpha=0.5) +
    draw_line(x = c(0.5-espace, 0.5+espace), y = c(y, y), color = "white", size = linesize+1) +
    draw_label(texte,x=0.5,y=y,vjust=0.5, size=textsize) +
    theme(rect = element_rect(fill = "transparent"))
}


#separator("test", color=kpiesr_lfc$ETU$colors[5])


combine_plots_kpi <- function(plots) {
  
  legend <- get_legend(plots$k.evol + 
                         ggplot2::theme(legend.direction = "horizontal", 
                                        legend.position = "bottom", 
                                        legend.title=element_blank(),
                                        rect = element_rect(fill = "transparent"))
                       )
  
  pg <-
    plot_grid(ncol=1, rel_heights = c(0.1,0.3,0.9,0.2,1,0.15),
              separator("Structure organisationnelle", color=kpiesr_lfc$K$colors[4], espace = 0.15),
              plots$legend.wd,
              plot_grid(nrow = 1, rel_widths = c(1,1,1), 
                        plots$filiation + labs(title="Filliation") + bottit,
                        plots$association + labs(title="Associations") + bottit,
                        plots$composition + labs(title="Composition") + bottit),
              separator("Indicateurs clés de performance", color=kpiesr_lfc$K$colors[3], espace = 0.15),
              plot_grid(ncol = 1, align="v", axis = "lr", rel_heights = c(3,2),
                        plots$k.norm + rm_lt + rl_margin + rm_ymingrid,
                        plots$k.evol + sats + shrink_xtext + rm_label  + rL_margin),
              legend
    )
  
  return(pg)
  
}

#combine_plots_kpi(plots)

combine_plots_series_sub <- function(plot_abs, plot_evol, plot_norm) {
  plot_grid (nrow = 1, align = "hv", rel_widths = c(1,0.1,1),
             plot_grid(ncol = 1, rel_heights = c(3,2), # align="v", axis = "lr",
                       plot_abs + rm_xytext + rm_ymingrid + rm_xgrid + rm_facetmargins,
                       plot_evol + sats + rm_ygrid + rm_label + rle_margin + rm_ytextmargin + small_facetmargins + shrink_xtext), #
             "",
             plot_norm + rm_lt  + rm_ymingrid )
}

# combine_plots_series(plots)
# ggsave(
#   "test.pdf",
#   width= 12, height=9,
#   device = cairo_pdf)


combine_plots_series <- function(plots, etu=TRUE, ens=TRUE, bia=TRUE, fin=TRUE) {
  
  legend <- get_legend(plots$k.evol + 
                         ggplot2::theme(legend.direction = "horizontal", 
                                        legend.position = "bottom", 
                                        legend.title=element_blank(),
                                        rect = element_rect(fill = "transparent"))
                       )

  pl <- list()
  
  if(etu) pl <- c(pl, list(
      separator("Effectifs étudiants", color = kpiesr_lfc$ETU$colors[4]),
      combine_plots_series_sub(plots$etu.abs, plots$etu.evol, plots$etu.norm)))

  if(ens) pl <- c(pl, list(
      separator("Effectifs enseignants", color = kpiesr_lfc$ENS$colors[4]),
      combine_plots_series_sub(plots$ens.abs, plots$ens.evol, plots$ens.norm)))

  if(bia) pl <- c(pl, list(
    separator("Effectifs BIATSS", color = kpiesr_lfc$BIA$colors[4]),
    combine_plots_series_sub(plots$bia.abs, plots$bia.evol, plots$bia.norm)))
  
  if(fin) pl <- c(pl, list(
    separator("Indicateurs financiers", color = kpiesr_lfc$FIN$colors[4]),
    combine_plots_series_sub(plots$fin.abs, plots$fin.evol, plots$fin.norm)))
    
  pl <- c(pl,list(legend))
  
  rl <- c(0.15,1,
          rep(c(0.2,1),(etu+ens+bia+fin)-1),
          0.2)
  
  pg <-plot_grid(ncol = 1, rel_heights = rl, plotlist = pl)
  
  return(pg)
  
}



combine_plots_groupe <- function(plots) {
  
  legend <- get_legend(plots$k.evol + 
                         ggplot2::theme(legend.direction = "horizontal", 
                                        legend.position = "bottom", 
                                        legend.title=element_blank(),
                                        rect = element_rect(fill = "transparent"))
  )
  
  pg <-
      plot_grid(ncol = 1, align="v", axis = "lr", rel_heights = c(0.15,1,0.15,1,0.15),
                separator("Indicateurs clés de performance", color=kpiesr_lfc$K$colors[3], espace = 0.15),
                plots$k.norm + rm_lt + rL_margin,
                separator("", color=kpiesr_lfc$K$colors[4], espace = 0),
                plots$k.evol + rm_label + rL_margin,
                legend)

  
  return(pg)
  
}




combine_plots_regroupement <- function(plots) {
  
  legend <- get_legend(plots$k.evol + 
                         ggplot2::theme(legend.direction = "horizontal", 
                                        legend.position = "bottom", 
                                        legend.title=element_blank(),
                                        rect = element_rect(fill = "transparent"))
  )
  
  pl <- list(
    separator("Structure organisationnelle", color=kpiesr_lfc$K$colors[4], espace = 0.15),
    plots$legend.wd,
    plot_grid(nrow = 1, rel_widths = c(1,1,1), 
              plots$filiation + labs(title="Filliation") + bottit,
              plots$association + labs(title="Associations") + bottit,
              plots$composition + labs(title="Composition") + bottit),
    separator("Effectifs BIATSS", color = kpiesr_lfc$BIA$colors[4]),
    combine_plots_series_sub(plots$bia.abs, plots$bia.evol, plots$bia.norm)
  )
  rh <- c(0.1,0.3,2,0.2,1,0.15,1)
  
  if(length(plots$etu.abs$layers)!=1) {
    pl <- c(pl, list(
      separator("Effectifs étudiants", color = kpiesr_lfc$ETU$colors[4]),
      combine_plots_series_sub(plots$etu.abs, plots$etu.evol, plots$etu.norm)
    ))
    rh <- c(rh, 0.15,1)
  }

  if(length(plots$fin.abs$layers)!=1) { 
    pl <- c(pl, list(
      separator("Indicateurs financiers", color = kpiesr_lfc$FIN$colors[4]),
      combine_plots_series_sub(plots$fin.abs, plots$fin.evol, plots$fin.norm)
    ))
    rh <- c(rh, 0.15,1)
  }
  
  pl <- c(pl,list(legend))
  rh <- c(rh, 0.15)
  
  pg <-
    plot_grid(ncol=1, rel_heights = rh,
              plotlist = pl
    )
  
  return(pg)
  
}


# etab <- kpiESR::esr.etab %>% filter(pid == "4k25D")
# wdid <- substr(etab$url.wikidata,33,50)
# plots <- kpiesr_plot_all(rentrée, etab$pid, etab$Groupe, style.k=k_style, style.o=o_style, style.o.norm = onorm_style)
# plots <- c(plots, wdesr_plots(wdid))
# combine_plots_series(plots)


# etab <- kpiESR::esr.etab %>% filter(pid == "8A0mg")
# wdid <- substr(etab$url.wikidata,33,50)
# plots <- kpiesr_plot_all(rentrée, etab$pid, etab$Groupe, style.k=k_style, style.o=o_style, style.o.norm = onorm_style)
# plots <- c(plots, wdesr_plots(wdid))
# combine_plots_regroupement(plots)

