extract_options <- function(pattern) {
  options()[grep(pattern, names(options()), value = TRUE)]
}

tiltIndicatorAfter_options <- function() {
  extract_options("tiltIndicatorAfter")
}
