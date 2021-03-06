#' Location
#'
#' A Location is used to place an element on a slide. For now this will just be
#' a placeholder name, but eventually it could expand to be an arbitrary
#' location
setClass(
  "R2PptxLocation",
  slots = c(
    location = "character"
  )
)

R2PptxLocation <- function(location) {
  new("R2PptxLocation", location = location)
}

setGeneric("asR2PptxLocation", function(x) standardGeneric("asR2PptxLocation"))
setMethod(
  "asR2PptxLocation",
  "character",
  function(x) R2PptxLocation(x)
)
