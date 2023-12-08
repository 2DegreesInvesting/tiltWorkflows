#' @noRd
#' @examples
#' reuse_template(
#'   "inst/templates/tilt-profiles.Rmd",
#'   "vignettes/articles/tiltWorkflows.Rmd"
#' )
reuse_template <- function(from, to) {
  header <- header(readLines(from))

  comment <- sprintf(
    "<!-- Don't edit by hand. %s is generated with `reuse_template()`. -->",
    to
  )

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
      comment,
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
