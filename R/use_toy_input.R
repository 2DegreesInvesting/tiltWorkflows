#' Write an input/ directory with toy datasets into the working directory
#'
#' @param quiet Logical. Throw a message?
#'
#' @return Call for it's side effect.
#' @export
#'
#' @examples
#' withr::with_dir(withr::local_tempdir(), {
#'   use_toy_input()
#'   # It won't overwrite
#'   try(use_toy_input())
#'
#'   fs::dir_tree("input")
#' })
#'
use_toy_input <- function(quiet = FALSE) {
  if (dir_exists("input")) {
    abort(c(
      "The input/ directory already exists in the working directory",
      x = "Aborting to avoid overwriting existing data.",
      i = "Do you need to move or remove your existing input/ directory?"
    ))
  }

  input <- system.file("extdata", "input.zip", package = "tiltWorkflows")

  if (!quiet) message("Writing input/ with toy datasets.")
  archive::archive_extract(input)
}
