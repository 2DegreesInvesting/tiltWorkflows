#' @examples
#' library(fs)
#'
#' input_path <- function(...) here::here("vignettes/articles/input", ...)
#'
#' rmd <- paste0("profile_", profiles(), ".Rmd")
#' rmd |> lapply(write_rmd_datasets_with, input_path)
#' rmd |>
#'   path_ext_set(".Rmd") |>
#'   file_delete()
#' rmd |>
#'   path_ext_set(".md") |>
#'   file_delete()
#' rmd |>
#'   path_ext_set(".html") |>
#'   file_delete()
#' @noRd
write_rmd_datasets_with <- function(rmd, .fun = input_path) {
  use_workflow(rmd, open = FALSE)

  dir_create(.fun())
  e <- new.env()
  rmarkdown::render(rmd, "github_document", envir = e, quiet = TRUE)
  .names <- ls(e)
  .names |> lapply(\(x) readr::write_csv(e[[x]], .fun(paste0(x, ".csv"))))
}

input_path <- function(...) {
  articles_path("input", ...)
}
