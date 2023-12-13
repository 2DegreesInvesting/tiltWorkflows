#' Generate templates and articles from the pieces in inst/extdata
#'
#' @examples
#' generate_templates_and_articles()
#' # usethis::use_tidy_style()
#' @noRd
generate_templates_and_articles <- function() {
  extdata_to_template()
  template_to_article()
}

extdata_to_template <- function() {
  quiet <- lapply(profiles(), extdata_to_template_impl)
  invisible(profiles())
}

profiles <- function() {
  c("emissions", "emissions_upstream", "sector", "sector_upstream")
}

extdata_to_template_impl <- function(profile = profiles(), ext = ".Rmd") {
  profile <- match.arg(profile)

  sections <- c(
    yaml = extdata_path(paste0("yaml", "-profile_", profile, ext)),
    note = note_tempfile(),
    setup = extdata_path(paste0("setup", ext)),
    data = data_path(profile, ext),
    code = extdata_path(paste0("code", "-profile_", profile, ext)),
    results = extdata_path(paste0("results", ext)),
    cleanup = extdata_path(paste0("cleanup", ext))
  )

  file <- templates_path(paste0("profile_", profile, ext))
  sections |>
    lapply(readLines) |>
    unlist() |>
    unname() |>
    writeLines(file)
}

data_path <- function(profile, ext) {
  data <- extdata_path(paste0("data", ext))
  if (!grepl("upstream", profile)) {
    data
  } else {
    c(
      data,
      extdata_path(paste0("data-ecoinvent_inputs", ext))
    )
  }
}

extdata_path <- function(...) {
  here::here("inst", "extdata", ...)
}

note_tempfile <- function() {
  note <- "<!-- This file is generated from inst/extdata. Please edit that file -->"
  tmp <- tempfile()
  writeLines(c("", note, ""), tmp)
  invisible(tmp)
}

templates_path <- function(...) {
  here::here("inst", "templates", ...)
}

template_to_article <- function() {
  from <- fs::dir_ls(templates_path())
  fs::file_copy(
    from,
    articles_path(fs::path_file(from)),
    overwrite = TRUE
  )
}

articles_path <- function(...) {
  here::here("vignettes", "articles", ...)
}
