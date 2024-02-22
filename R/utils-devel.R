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
  c("profile_emissions", "profile_emissions_upstream", "profile_sector", "profile_sector_upstream", "score_transition_risk")
}

extdata_to_template_impl <- function(profile = profiles()) {
  profile <- match.arg(profile)

  sections <- c(
    yaml = yaml_path(profile),
    note = note_tempfile(),
    setup = extdata_path("setup.Rmd"),
    data = data_path(profile),
    code = extdata_path(paste0("code-", profile, ".Rmd")),
    results = extdata_path("output.Rmd"),
    cleanup = extdata_path("cleanup.Rmd")
  )

  file <- templates_path(paste0(profile, ".Rmd"))
  out <- sections |>
    lapply(readLines) |>
    unlist() |>
    unname()

  gsub("{workflow}", path_file(file), out, fixed = TRUE) |>
    writeLines(file)
}

data_path <- function(profile) {
  data <- extdata_path("data.Rmd")
  if (grepl("score", profile)) {
    c(
      extdata_path("data-score_transition_risk.Rmd")
    )
  } else if (grepl("upstream", profile)) {
    c(
      data,
      extdata_path("data-ecoinvent_inputs.Rmd")
    )
  } else {
    data
  }
}

yaml_path <- function(profile) {
  if (grepl("score", profile)) {
    all <- dir_ls(extdata_path(), regexp = "yaml-01-all-score_tr[.]Rmd$")
  } else {
    all <- dir_ls(extdata_path(), regexp = "yaml-01-all[.]Rmd$")
  }
  this <- dir_ls(extdata_path(), regexp = glue("yaml-.*{profile}[.]Rmd"))
  maybe <- NULL
  if (grepl("upstream", profile)) {
    maybe <- dir_ls(extdata_path(), regexp = "yaml-.*all-upstream[.]Rmd")
  }
  end <- dir_ls(extdata_path(), regexp = "end[.]Rmd")

  unname(sort(c(all, this, maybe, end)))
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
  from <- dir_ls(templates_path())
  file_copy(
    from,
    articles_path(path_file(from)),
    overwrite = TRUE
  )
}

articles_path <- function(...) {
  here::here("vignettes", "articles", ...)
}

style_extdata <- function() {
  styler::style_dir(extdata_path())
}

use_workflow_index <- function(index = 1) {
  wf <- workflows()
  use_workflow(wf[[index]])
}
