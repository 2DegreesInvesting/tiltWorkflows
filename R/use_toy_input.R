#' Write an input/ directory with toy datasets into the working directory
#'
#' @return Call for it's side effect.
#' @export
#'
#' @examples
#' withr::with_dir(withr::local_tempdir(), {
#'   use_toy_input()
#'   fs::dir_tree("input")
#'
#'   # It won't overwrite
#'   try(use_toy_input())
#' })
#'
use_toy_input <- function() {
  if (dir_exists("input")) {
    abort(c(
      "The input/ directory already exists in the working directory",
      x = "Aborting to avoid overwriting existing data.",
      i = "Do you need to move or remove your existing input/ directory?"
    ))
  }

  input <- system.file("extdata", "input.zip", package = "tiltWorkflows")
  archive::archive_extract(input)
}
