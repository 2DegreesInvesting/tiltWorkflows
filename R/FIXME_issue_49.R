#' See issue #49
#'
#' @param data A data frame.
#'
#' @return A data frame
#'
#' @keywords internal
#'
#' @examples
#' #
#' @name FIXME_issue_49
NULL

#' @rdname FIXME_issue_49
#' @export
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

#' @rdname FIXME_issue_49
#' @export
FIXME_issue_49_ecoinvent_inputs <- function(data) {
  data |>
    select(
      "input_activity_uuid_product_uuid",
      "exchange_name",
      "exchange_unit_name"
    ) |>
    distinct()
}
