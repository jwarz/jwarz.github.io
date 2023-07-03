# 1. Use fonts for rendering (any newly opened graphics devices will use showtext to draw text)
# Setting in ggplot not necessary
sysfonts::font_add_google("Poppins", "poppinslight", regular.wt=200, bold.wt=500)
showtext::showtext_auto()

# 2. ggplot theme
theme_tie <- function(
    base_size = 11,
    base_family = "",
    base_line_size = base_size / 22,
    base_rect_size = base_size / 22
) {
  
  #-------------- BASE COLORS ---------------#
  color_value <- "#FFFFFF"
  grey <- "grey80" # used for grid
  
  #-------------- POSITIONING ---------------#
  half_line <- base_size / 2
  
  #--------------- BASE PLOT ----------------#
  ggplot2::`%+replace%`(ggplot2::theme_grey(base_size = base_size, base_family = base_family), 
                        
                        #--------------- REPLACEMENTS--------------#
                        ggplot2::theme(
                          line = ggplot2::element_line(
                            colour = color_value,
                            linewidth = base_line_size,
                            linetype = 1,
                            lineend = "butt"
                          ),
                          rect = ggplot2::element_rect(
                            fill = color_value,
                            colour = color_value,
                            linewidth = base_rect_size,
                            linetype = 1
                          ),
                          text = ggplot2::element_text(
                            family = base_family,
                            face = "plain",
                            colour = color_value,
                            size = base_size,
                            lineheight = 0.9,
                            hjust = 0.5,
                            vjust = 0.5,
                            angle = 0,
                            margin = ggplot2::margin(),
                            debug = FALSE
                          ),
                          title = NULL,
                          aspect.ratio = NULL,
                          
                          ##### Axis
                          axis.title = ggplot2::element_text(size  = ggplot2::rel(1)),
                          axis.title.x = ggplot2::element_text(margin = ggplot2::margin(t = half_line), vjust = 1),
                          axis.title.x.top = ggplot2::element_text(margin = ggplot2::margin(b = half_line), vjust = 0),
                          axis.title.x.bottom = NULL,
                          axis.title.y = ggplot2::element_text(angle = 90, margin = ggplot2::margin(r = half_line), vjust = 1),
                          axis.title.y.left = NULL,
                          axis.title.y.right = ggplot2::element_text(angle = -90, margin = ggplot2::margin(l = half_line), vjust = 0),
                          axis.text = ggplot2::element_text(size = ggplot2::rel(0.8), colour = grey),
                          axis.text.x = ggplot2::element_text(margin = ggplot2::margin(t = 0.8 * half_line / 2), vjust = 1),
                          axis.text.x.top = ggplot2::element_text(margin = ggplot2::margin(b = 0.8 * half_line / 2), vjust = 0),
                          axis.text.x.bottom = NULL,
                          axis.text.y = ggplot2::element_text(margin = ggplot2::margin(r = 0.8 * half_line / 2), hjust = 1),
                          axis.text.y.left = NULL,
                          axis.text.y.right = ggplot2::element_text(margin = ggplot2::margin(l = 0.8 * half_line / 2), hjust = 0),
                          axis.ticks = ggplot2::element_line(colour = grey, linewidth = ggplot2::rel(1/3)),
                          axis.ticks.x = NULL,
                          axis.ticks.x.top = NULL,
                          axis.ticks.x.bottom = NULL,
                          axis.ticks.y = NULL,
                          axis.ticks.y.left = NULL,
                          axis.ticks.y.right = NULL,
                          axis.ticks.length = ggplot2::unit(half_line / 2, "pt"),
                          axis.ticks.length.x = NULL,
                          axis.ticks.length.x.top = NULL,
                          axis.ticks.length.x.bottom = NULL,
                          axis.ticks.length.y = NULL,
                          axis.ticks.length.y.left = NULL,
                          axis.ticks.length.y.right = NULL,
                          axis.line = ggplot2::element_blank(),
                          axis.line.x = NULL,
                          axis.line.x.top = NULL,
                          axis.line.x.bottom = NULL,
                          axis.line.y = NULL,
                          axis.line.y.left = NULL,
                          axis.line.y.right = NULL,
                          
                          ##### Legend
                          legend.background = ggplot2::element_blank(),
                          legend.margin = ggplot2::margin(half_line, half_line, half_line, half_line),
                          legend.spacing = ggplot2::unit(2 * half_line, "pt"),
                          legend.spacing.x = NULL,
                          legend.spacing.y = ggplot2::unit(2, "pt"),
                          legend.key = ggplot2::element_blank(),
                          legend.key.size = ggplot2::unit(1.2, "lines"),
                          legend.key.height = NULL,
                          legend.key.width = NULL,
                          legend.text = ggplot2::element_text(size = ggplot2::rel(0.8)),
                          legend.text.align = NULL,
                          legend.title = ggplot2::element_text(hjust = 0),
                          legend.title.align = NULL,
                          legend.position = "bottom",
                          legend.direction = NULL,
                          legend.justification = "center",
                          legend.box = "vertical",
                          legend.box.just = "left",
                          legend.box.margin = ggplot2::margin(0, 0, 0, 0, "cm"),
                          legend.box.background = ggplot2::element_rect(color = color_value, linewidth = ggplot2::rel(1/3)),
                          legend.box.spacing = ggplot2::unit(2 * half_line, "pt"),
                          
                          ##### Panel
                          panel.background = ggplot2::element_rect(fill = "transparent", colour = NA),
                          panel.border = ggplot2::element_rect(fill = NA, colour = color_value, linewidth = ggplot2::rel(1/2), linetype = "solid"),
                          panel.spacing = ggplot2::unit(half_line, "pt"),
                          panel.spacing.x = NULL,
                          panel.spacing.y = NULL,
                          panel.grid = ggplot2::element_line(colour = grey),
                          panel.grid.major = ggplot2::element_line(colour = grey, linewidth = ggplot2::rel(1/3)),
                          panel.grid.minor = ggplot2::element_line(colour = grey, linewidth = ggplot2::rel(1/3)),
                          panel.grid.major.x = NULL,
                          panel.grid.major.y = NULL,
                          panel.grid.minor.x = ggplot2::element_blank(),
                          panel.grid.minor.y = NULL,
                          panel.ontop = FALSE,
                          
                          ##### Plot
                          plot.background = ggplot2::element_rect(fill = "transparent", colour = NA),
                          plot.title = ggplot2::element_text(
                            size = ggplot2::rel(1.25),
                            face = "bold",
                            hjust = 0,
                            vjust = 1,
                            margin = ggplot2::margin(b = half_line)
                          ),
                          plot.title.position = "plot",
                          plot.subtitle = ggplot2::element_text(
                            size = ggplot2::rel(1),
                            face = "italic",
                            hjust = 0,
                            vjust = 1,
                            margin = ggplot2::margin(b = half_line)
                          ),
                          plot.caption = ggplot2::element_text(
                            size = ggplot2::rel(0.75),
                            face = "italic",
                            hjust = 1,
                            vjust = 1,
                            margin = ggplot2::margin(t = half_line)
                          ),
                          plot.caption.position = "plot",
                          plot.tag = ggplot2::element_text(size = ggplot2::rel(1.25), hjust = 0.5, vjust = 0.5),
                          plot.tag.position = "topleft",
                          plot.margin = ggplot2::margin(half_line, half_line, half_line, half_line),
                          
                          ##### Strip (facets)
                          # strip.background = ggplot2::element_rect(fill = "transparent", colour = color_value),
                          strip.background = ggplot2::element_blank(),
                          strip.background.x = NULL,
                          strip.background.y = NULL,
                          strip.placement = "inside", #outside
                          strip.placement.x = NULL,
                          strip.placement.y = NULL,
                          strip.text = ggtext::element_textbox(
                            size = ggplot2::rel(0.8),
                            colour = color_value, 
                            fill = "transparent", 
                            face = "bold",
                            box.color = color_value,
                            halign = 0.5, linetype = 1, linewidth = 0.2,
                            r = ggplot2::unit(0, "pt"), width = ggplot2::rel(1), #unit(1, "npc"),
                            padding = ggplot2::margin(2, 0, 1, 0), margin = ggplot2::margin(3, 0, 3, 0)
                          ),
                          #   ggplot2::element_text(
                          #   colour = color_value,
                          #   face = "bold",
                          #   size = ggplot2::rel(0.8),
                          #   margin = ggplot2::margin(0.8 * half_line, 0.8 * half_line, 0.8 * half_line, 0.8 * half_line)
                          strip.text.x = NULL,
                          strip.text.y = ggplot2::element_text(angle = -90),
                          strip.switch.pad.grid = ggplot2::unit(half_line / 2, "pt"),
                          strip.switch.pad.wrap = ggplot2::unit(half_line / 2, "pt"),
                          
                          complete = TRUE
                        )
  )
}

# 3. color settings
palette_tie <- {
  
  palette <- list(
    categorical = list(
      c("#00C1D4"),
      c("#00C1D4", "#FF4F4F"),
      c("#00C1D4", "#FF4F4F", "#7200FE"),
      c("#00C1D4", "#FF4F4F", "#7200FE", "#5AFFC5"),
      c("#00C1D4", "#FF4F4F", "#7200FE", "#5AFFC5", "#FFDE36"),
      c("#00C1D4", "#FF4F4F", "#7200FE", "#5AFFC5", "#FFDE36", "#143BFF"),
      c("#00C1D4", "#FF4F4F", "#7200FE", "#5AFFC5", "#FFDE36", "#143BFF", "#FF7E15"),
      c("#00C1D4", "#FF4F4F", "#7200FE", "#5AFFC5", "#FFDE36", "#143BFF", "#FF7E15", "#FFAEA2")
    ),
    
    sequential = list(
      c("#00C1D4"),
      c("#143BFF", "#00C1D4"),
      c("#7200FE", "#143BFF", "#00C1D4"),
      c("#7200FE", "#143BFF", "#00C1D4", "#5AFFC5"),
      c("#7200FE", "#143BFF", "#00C1D4", "#5AFFC5", "#FFDE36"),
      c("#7200FE", "#143BFF", "#00C1D4", "#5AFFC5", "#FFDE36", "#FF7E15"),
      c("#7200FE", "#143BFF", "#00C1D4", "#5AFFC5", "#FFDE36", "#FF7E15", "#FFAEA2"),
      c("#7200FE", "#143BFF", "#00C1D4", "#5AFFC5", "#FFDE36", "#FF7E15", "#FFAEA2", "#FF4F4F")
    )
  )
  
  palette
}

tie_color_pal <- function(palette = "categorical") {
  palette_list <- palette_tie
  
  types <- palette_list[[palette]]
  
  function(n) {
    
    if (n > 8) {
      
      stop(
        paste(
          "Error: tie theme allows for a max of 8 colors. Your code asked for",
          n,
          "colors.",
          "If you need more than 8 colors for exploratory purposes, use",
          "ggplot2::scale_fill_discrete() or ggplot2::scale_color_discrete()."
        )
      )
      
    }
    
    types[[n]]
  }
}

# add base_family font to text and label geoms ---------------------------
library(ggrepel)
ggplot2::update_geom_defaults("text",        list(size = 1 / 0.352777778)) # family = base_family
ggplot2::update_geom_defaults("label",       list(size = 1 / 0.352777778)) # family = base_family
ggplot2::update_geom_defaults("text_repel",  list(size = 1 / 0.352777778)) # family = base_family
ggplot2::update_geom_defaults("label_repel", list(size = 1 / 0.352777778)) # family = base_family

# set defaults for geoms --------------------------------------------------
geom_colors <- tibble::tibble(
  geom      = c("bar",     "boxplot", "col",     "density", "errorbar", "hline",   "line",    "path",    "point",   "sf",      "smooth",  "step",    "quantile", "violin", "vline"),
  color     = c("#FFFFFF", NA,        "#FFFFFF", NA,        "#FFFFFF",  "#FFFFFF", "#00C1D4", "#00C1D4", "#00C1D4", NA,        "#005E73", "#00C1D4", "#005E73",  NA,       "#FFFFFF"),
  fill      = c("#00C1D4", "#00C1D4", "#00C1D4", "#00C1D4", NA,         NA,        NA,        NA,         NA,       "#00C1D4", "grey60",  NA,        NA,         "#00C1D4", NA),
  size      = c(NA,        NA,        NA,        NA,        NA,         NA,        NA,        NA,         3,        NA,        NA,        NA,        NA,         NA,        NA),
  linewidth = c(NA,        NA,        NA,        NA,        NA,         0.5,       0.5,       0.5,        NA,       NA,        1,         0.5,       0,          0,         0.5)
)
purrr::pwalk(geom_colors, ~ ggplot2::update_geom_defaults(..1, list(color = ..2, fill = ..3)))

# set defaults for stats --------------------------------------------------
stat_colors <- tibble::tibble(
  stat = c("boxplot", "count", "density", "ydensity"),
  fill = c("#00C1D4", "#00C1D4", "#00C1D4", "#00C1D4")
)
purrr::pwalk(stat_colors, ~ ggplot2::update_stat_defaults(..1, list(fill = ..2)))

# Color scales
# Discrete color scale that aligns with the TIE style
# These function can only handle up to 8 categories/colors.
scale_color_discrete <- function(...) {
  ggplot2::discrete_scale(
    aesthetics = "colour",
    scale_name = "tie",
    palette = tie_color_pal("categorical"),
    ...
  )
}
scale_colour_discrete <- scale_color_discrete
scale_fill_discrete <- function(...) {
  ggplot2::discrete_scale(
    aesthetics = "fill",
    scale_name = "tie",
    palette = tie_color_pal("categorical"),
    ...
  )
}

# Continuous fill scale that aligns with the TIE style
scale_color_gradientn <- function(...,
                                  colours = palette_tie$sequential[[8]],
                                  colors = palette_tie$sequential[[8]],
                                  values = NULL,
                                  space = "Lab",
                                  na.value = "grey50",
                                  guide = "colourbar") {
  
  colours <- if (missing(colours)) colors else colours
  
  ggplot2::continuous_scale(
    aesthetics = "colour",
    scale_name = "gradientn",
    palette = scales::gradient_n_pal(colours, values, space),
    na.value = na.value,
    guide = guide,
    ...
  )
}
scale_colour_gradientn <- scale_color_gradientn

# Continuous fill scale that aligns with the TIE style
scale_fill_gradientn <- function(...,
                                 colours = palette_tie$sequential[[8]],
                                 colors = palette_tie$sequential[[8]],
                                 values = NULL,
                                 space = "Lab",
                                 na.value = "grey50",
                                 guide = "colourbar") {
  
  colours <- if (missing(colours)) colors else colours
  
  ggplot2::continuous_scale(
    aesthetics = "fill",
    scale_name = "gradientn",
    palette = scales::gradient_n_pal(colours, values, space),
    na.value = na.value,
    guide = guide,
    ...
  )
}

# Discrete fill scale for ordinal factors that aligns with the TIE style
scale_fill_ordinal <- function(...) {
  ggplot2::discrete_scale(
    aesthetics = "fill",
    scale_name = "tie",
    palette = tie_color_pal("sequential"),
    ...
  )
}

# Discrete color scale for ordinal factors that aligns with the TIE style
scale_color_ordinal <- function(...) {
  ggplot2::discrete_scale(
    aesthetics = "color",
    scale_name = "tie",
    palette = tie_color_pal("sequential"),
    ...
  )
}
scale_colour_ordinal <- scale_color_ordinal

# set default color scales ------------------------------------------------
options(
  ggplot2.continuous.colour = scale_color_gradientn,
  ggplot2.continuous.fill   = scale_fill_gradientn
  # ggplot2.discrete.colour
  # ggplot2.discrete.fill
  # ggplot2.binned.colour
  # ggplot2.binned.fill
)

knitr::opts_chunk$set(dev.args  = list(bg="transparent"),
                      fig.align = "center")

ggplot2::theme_set(theme_tie())