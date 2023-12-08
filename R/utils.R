#' @noRd
#' @examples
#' reuse_template(
#'   "inst/templates/tilt-profiles.Rmd",
#'   "vignettes/articles/tiltWorkflows.Rmd"
#' )
reuse_template <- function(from, to) {
  header <- header(readLines(from))

  child_name <- fs::path_file(from)
  ops <- sprintf(
    "child = system.file(package = 'tiltWorkflows', 'templates', '%s')",
    child_name
  )
  chunk <- c(sprintf("```{r %s}", ops), "```")

  writeLines(
    c(
      header,
      "",
      "<!-- Don't edit by hand. This file is generated with `reuse_template()`. -->",
      "",
      chunk
    ),
    to
  )
}

header <- function(x) {
  range <- which(grepl("---", x))
  x[range[1]:range[2]]
}
