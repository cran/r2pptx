## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(r2pptx)

## -----------------------------------------------------------------------------
presentation <- new_presentation()
print(template_path(presentation))

## ---- results="hide"----------------------------------------------------------
# for the example, make a copy the default template and pretend it's a totally
# different template (since that's all we have on the testing server)
new_template_path <- tempfile(pattern = "new_template", fileext = ".pptx")
file.copy(
  system.file(package = "officer", "template/template.pptx"),
  new_template_path
)

## -----------------------------------------------------------------------------
template_path(presentation) <- new_template_path
print(template_path(presentation))

## -----------------------------------------------------------------------------
presentation <- new_presentation(new_template_path)
print(template_path(presentation))

## ---- error=TRUE--------------------------------------------------------------
new_presentation("some_fake_template_path.pptx")

## ---- error=TRUE--------------------------------------------------------------
template_path(presentation) <- "some_fake_template_path.pptx"

## -----------------------------------------------------------------------------
options("default_pptx_template" = new_template_path)
presentation <- new_presentation()
print(template_path(presentation))

## ---- include=FALSE-----------------------------------------------------------
# remove the copied template
unlink(new_template_path)

