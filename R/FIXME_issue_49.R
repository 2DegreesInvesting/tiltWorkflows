#' See issue #49
#'
#' @param data A data frame.
#'
#' @return A data frame
#' @export
#'
#' @keywords internal
#'
#' @examples
#' tibble::tibble(
#'   TO_REMOVE = "a",
#'   company_name = "a",
#'   country = "a",
#'   company_city = "a",
#'   postcode = "a",
#'   address = "a",
#'   main_activity = "a",
#'   companies_id = "a"
#' ) |>
#'   FIXME_issue_49()
FIXME_issue_49 <- function(data) {
  data |>
    select(
      "company_name",
      "country",
      "company_city",
      "postcode",
      "address",
      "main_activity",
      "companies_id"
    )
}
