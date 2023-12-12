#' List and use workflows
#'
#' * `workflows()` lists available workflows.
#' * `use_workflow()` creates a workflow file from a template in the tiltWorkflows
#' package.
#'
#' @inheritParams usethis::use_template
#'
#' @return A logical vector indicating if file was modified.
#' @export
#'
#' @examples
#' workflows()
#'
#' \dontrun{
#' # Note: Running this will write "profile_emissions.Rmd" to your working directory
#' use_workflow("profile_emissions.Rmd")
#' }
use_workflow <- function(template, save_as = template, open = FALSE) {
  usethis::use_template(
    template,
    save_as = save_as,
    open = open,
    package = "tiltWorkflows"
  )
}

#' @export
#' @rdname use_workflow
workflows <- function() {
  list.files(system.file("templates", package = "tiltWorkflows"))
}
