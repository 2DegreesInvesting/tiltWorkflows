#' Use a workflow file
#'
#' Creates a workflow file from a template in the tiltWorkflows package.
#'
#' @inheritParams usethis::use_template
#'
#' @return A logical vector indicating if file was modified.
#' @export
#'
#' @examplesIf interactive()
#' \dontrun{
#' # Note: Running this will write "profile.Rmd" to your working directory
#' use_workflow()
#' }
use_workflow <- function(template = "profile.Rmd",
                         save_as = template,
                         open = FALSE) {
  usethis::use_template(
    template,
    save_as = save_as,
    open = open,
    package = "tiltWorkflows"
  )
}
