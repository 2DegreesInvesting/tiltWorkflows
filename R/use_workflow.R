#' Create a workflow file in the working directory
#'
#' * `use_workflow()` creates a workflow file from a template in the tiltWorkflows
#' package.
#'
#' @inheritParams usethis::use_template
#'
#' @return A logical vector indicating if file was modified.
#' @export
#'
#' @examples
#' # The error shows what's available
#' try(use_workflow())
#'
#' \dontrun{
#' # Note: Running this will write "profile_emissions.Rmd" to your working directory
#' use_workflow("profile_emissions.Rmd")
#' }
use_workflow <- function(template,
                         save_as = template,
                         open = rlang::is_interactive()) {
  if (missing(template)) {
    abort(c(
      x = "The workflow file must be provided.",
      i = "Which one do you want?",
      i = glue('* `use_workflow("{workflows()}")`')
    ))
  }

  usethis::use_template(
    template,
    save_as = save_as,
    open = open,
    package = "tiltWorkflows"
  )
}

workflows <- function() {
  list.files(system.file("templates", package = "tiltWorkflows"))
}
