## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(ggplot2)
library(r2pptx)

## -----------------------------------------------------------------------------
presentation <- new_presentation()
print(presentation)
print(template_path(presentation))

## -----------------------------------------------------------------------------
get_layouts(presentation)

## -----------------------------------------------------------------------------
layouts <- get_layouts(presentation)$layout
for (layout in layouts) {
  plot_layout(presentation, layout)
  title(main = layout)
}

## -----------------------------------------------------------------------------
title_slide <- new_slide(
  layout = "Title Slide",
  elements = list(
    new_element(key = "Title 1", value = "The title"),
    new_element(key = "Subtitle 2", value = "The subtitle")  
  )
)
print(title_slide)

## -----------------------------------------------------------------------------
presentation <- presentation + title_slide
print(presentation)

## -----------------------------------------------------------------------------
# create the slide object
plot_slide <- new_slide(layout = "Title and Content")
print(plot_slide)

# create an element for the title element
title_element <- new_element(key = "Title 1", value = "A plot")

# create a ggplot
cars_plot <- ggplot(mtcars, aes(x = mpg, y = cyl)) + 
  geom_point()
# create an element for the plot
plot_element <- new_element(key = "Content Placeholder 2", value = cars_plot)

plot_slide <- plot_slide +
  title_element +
  plot_element
print(plot_slide)

presentation <- presentation +
  plot_slide
print(presentation)

## -----------------------------------------------------------------------------
ppt_path <- tempfile(fileext = ".pptx")
write_pptx(presentation, ppt_path)
if (interactive()) system(paste("open", ppt_path))

