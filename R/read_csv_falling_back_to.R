#' Read a .csv file; if it doesn't exist, fall back to another dataset
#'
#' @param path Character. A path to a .csv file.
#' @param data Data frame. A dataset to fall back to if the .csv file doesn't
#'   exist.
#'
#' @return A data frame.
#' @export
#' @keywords internal
#'
#' @examples
#' read_csv_falling_back_to("/does/not/exist.csv", head(cars))
read_csv_falling_back_to <- function(path, data) {
  if (file_exists(path)) {
    read_csv(path)
  } else {
    warning("Using ", deparse(substitute(data)), call. = FALSE)
    data
  }
}
