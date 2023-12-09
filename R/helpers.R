#' Read a .csv but if it doesnt' exist fall back to another dataset
#'
#' @param path Character. Path to a .csv file.
#' @param data Data frame. An alternative dataset to fall back to if the `path`
#'   points to a file that doesn't exist.
#'
#' @return A data frame.
#' @export
#'
#' @examples
#' read_csv_falling_back_to("/inexistent/file.csv", head(cars))
read_csv_falling_back_to <- function(path, data) {
  if (file_exists(path)) {
    read_csv(path)
  } else {
    warning("Using ", deparse(substitute(data)), call. = FALSE)
    data
  }
}
