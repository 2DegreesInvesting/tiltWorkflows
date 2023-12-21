#' Information about the cache directory
#'
#' @param cache_dir Character. A directory.
#' @param quiet Logical. Throw a warning?
#'
#' @return
#' * `cache_dir()` returns a path to the default cache directory.
#' * `cache_info()` returns a data frame with information about the cache directory.
#' * `cache_delete()` deletes the cache directory.
#'
#' @examples
#' library(withr)
#' library(fs)
#'
#' cache_dir()
#'
#' tmp <- dir_create(local_tempfile())
#' cache_info(tmp)
#'
#' dir_exists(tmp)
#' cache_delete(tmp)
#' dir_exists(tmp)
#' @name cache
NULL

#' @rdname cache
#' @export
cache_dir <- function() {
  user_cache_dir("tiltWorkflows")
}

#' @export
#' @rdname cache
cache_info <- function(cache_dir = cache_dir()) {
  if (!dir_exists(cache_dir)) {
    abort("`cache_dir` doesn't exist.")
  }

  dir_ls(cache_dir, recurse = TRUE, type = "file") |>
    fs::file_info() |>
    dplyr::arrange(.data$modification_time) |>
    dplyr::relocate("modification_time", path)
}

#' @rdname cache
#' @export
#'
#' @examples
#' # example code
#'
cache_delete <- function(cache_dir = cache_dir(), quiet = FALSE) {
  if (dir_exists(cache_dir)) {
    if (!quiet) warn(c("Deleting `cache_dir`: ", cache_dir))
    dir_delete(cache_dir)
  } else {
    if (!quiet) warn(c("`cache_dir` doesn't exist: ", cache_dir))
  }

  invisible(cache_dir)
}
