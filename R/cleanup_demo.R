#' Cleanup artifacts of a demo workflow
#'
#' @return Called for its side effects of deleting files and folders.
#'
#' @examples
#' cleanup_io()
#' cleanup_profile_emissions()
#' @keywords internal
#' @name cleanup
NULL

#' @export
#' @rdname cleanup
cleanup_io <- function() {
  if (fs::dir_exists("input")) fs::dir_delete("input")
  if (fs::dir_exists("output")) fs::dir_delete("output")
}

#' @export
#' @rdname cleanup
cleanup_profile_emissions <- function() {
  if (fs::file_exists("profile_emissions.Rmd")) fs::file_delete("profile_emissions.Rmd")
  if (fs::file_exists("profile_emissions.md")) fs::file_delete("profile_emissions.md")
}
