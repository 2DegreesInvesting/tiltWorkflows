#' Explain stuff consistently everywhere
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
  "For this TILT indicator, compute results both at product and company level."
}

#' @export
#' @rdname explain
explain_results <- function() {
  "Overview and save results at each level."
}
