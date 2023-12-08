#' Use a workflow file
#'
#' Creates a workflow file from a template in the tiltWorkflows package.
#'
#' @inheritParams usethis::use_template
#'
#' @return A logical vector indicating if file was modified.
#' @export
#'
#' @examples
#' \dontrun{
#' # Note: Running this will write `tiltWorkflows.Rmd` to your working directory
#' use_workflow()
#' # Same
#' use_workflow("tiltWorkflows.Rmd")
#' }
use_workflow <- function(template = "tiltWorkflows.Rmd",
                         save_as = template,
                         open = FALSE) {
  usethis::use_template(
    template,
    save_as = save_as,
    open = open,
    package = "tiltWorkflows"
  )
}
