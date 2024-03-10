extract_options <- function(pattern) {
  out <- options()[grep(pattern, names(options()), value = TRUE)]
  if (rlang::is_empty(out)) {
    rlang::warn(c(
      glue::glue("The pattern '{pattern}' matched no option."),
      i = "Do you need to fix a typo?",
      v = "Returning the original `options()`."
    ))
    return(options())
  }
  out
}

tiltIndicatorAfter_options <- function() {
  extract_options("tiltIndicatorAfter")
}


