#' Explain stuff consistently everywhere.
#'
#' @return Character.
#' @keywords internal
#' @name explain
#'
#' @examples
#' explain_indicator()
#'
#' explain_results()
NULL

#' @export
#' @rdname explain
explain_indicator <- function() {
  "Compute the resutls for this specific indicator."
}

#' @export
#' @rdname explain
explain_results <- function() {
  "See and save the results at product and company level."
}
