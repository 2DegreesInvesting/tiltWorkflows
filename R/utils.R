#' @noRd
#' @examples
#' reuse_template(
#'   "inst/templates/tilt-profiles.Rmd",
#'   "vignettes/articles/tiltWorkflows.Rmd"
#' )
reuse_template <- function(from, to) {
  child_name <- fs::path_file(from)
  ops <- sprintf("child = system.file(package = 'tiltWorkflows', 'templates', '%s')", child_name)
  chunk <- c(sprintf("```{r %s}", ops), "```")
  header <- header(readLines(from))
  writeLines(c(header, "", chunk), to)
}

header <- function(x) {
  range <- which(grepl("---", x))
  x[range[1]:range[2]]
}
