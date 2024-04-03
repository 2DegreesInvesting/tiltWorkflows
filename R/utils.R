extract_options <- function(pattern) {
  options()[grep(pattern, names(options()), value = TRUE)]
}

tiltIndicatorAfter_options <- function() {
  extract_options("tiltIndicatorAfter")
}

warn_thresholds <- function() {
  warn(c(
    "The default thresholds are generally the most useful.",
    i = "Do you really need to adjust them?"
  ))
}
