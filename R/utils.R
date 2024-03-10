extract_options <- function(pattern) {
  out <- options()[grep(pattern, names(options()), value = TRUE)]
  if (rlang::is_empty(out)) {
    return(options())
  }
  out
}

tiltIndicatorAfter_options <- function() {
  extract_options("tiltIndicatorAfter")
}


