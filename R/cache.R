#' Work with the cache directory
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
#' cache_dir()
#'
#' tmp <- tempfile()
#' dir.create(tmp)
#'
#' cache_info(tmp)
#'
#' dir.exists(tmp)
#' cache_delete(tmp)
#' dir.exists(tmp)
#' @name cache
NULL

#' @rdname cache
#' @export
cache_dir <- function() {
  user_cache_dir("tiltWorkflows")
}

#' @rdname cache
#' @export
cache_info <- function(cache_dir = rappdirs::user_cache_dir("tiltWorkflows")) {
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
cache_delete <- function(cache_dir = rappdirs::user_cache_dir("tiltWorkflows"),
                         quiet = FALSE) {
  if (dir_exists(cache_dir)) {
    if (!quiet) warn(c("Deleting `cache_dir`: ", cache_dir))
    dir_delete(cache_dir)
  } else {
    if (!quiet) warn(c("`cache_dir` doesn't exist: ", cache_dir))
  }

  invisible(cache_dir)
}
