profile <- function(companies, .f, ..., .by, chunks) {
  job <- companies |>
    nest_chunk(.by = .by, chunks = chunks) |>
    add_file(parent = cache_path(deparse(substitute(.f))))

  job |>
    job_pmap(\(data, file) .f(data, ...) |> write_rds(file))
}
#' Run a `profile*()` function by chunks
#'
#' @param companies Data frame.
#' @param .f A `profile*()` function from tiltIndicatorAfter.
#' @param ... Arguments passed to `.f`.
#' @param .by Character. Columns to chunk by.
#' @param chunks Integer. Number of chunks to split the data by.
#'
#' @return A nested data frame with results at product and company level.
#' @export
#' @keywords internal
#'
#' @examples
#' library(tiltToyData)
#' library(readr, warn.conflicts = FALSE)
#'
#' options(readr.show_col_types = FALSE)
#'
#' companies <- read_csv(toy_emissions_profile_any_companies())
#' products <- read_csv(toy_emissions_profile_products())
#'
#' result <- companies |>
#'   profile_with(profile_emissions,
#'     products,
#'     # TODO: Move to tiltToyData
#'     europages_companies = tiltIndicatorAfter::ep_companies,
#'     ecoinvent_activities = tiltIndicatorAfter::ecoinvent_activities,
#'     ecoinvent_europages = tiltIndicatorAfter::matches_mapper |> head(100),
#'     isic_tilt = tiltIndicatorAfter::isic_tilt_mapper
#'   )
#'
#' result |> unnest_product()
#'
#' result |> unnest_company()
profile_with <- purrr::partial(
  profile,
  .by = "companies_id",
  chunks = getOption("tiltWorkflow.chunks", default = length(availableWorkers()))
)

cache_path <- function(..., parent = cache_dir()) {
  path(parent, ...)
}

cache_dir <- function() {
  user_cache_dir(appname = "tiltIndicator")
}

job_pmap <- function(job, .f) {
  job |>
    pick_undone() |>
    select(.data$data, .data$file) |>
    future_pwalk(.f, .progress = TRUE)

  map_df(job$file, read_rds)
}

nest_chunk <- function(data, .by, chunks) {
  data |>
    nest(.by = all_of(.by)) |>
    mutate(data, chunk = as.integer(cut(row_number(), chunks))) |>
    unnest(data) |>
    nest(.by = .data$chunk)
}

add_file <- function(data, parent = cache_path(), ext = ".rds") {
  dir_create(parent)
  mutate(data, file = path(parent, paste0(.data$chunk, ext)))
}

pick_undone <- function(data) {
  data |>
    add_done() |>
    filter(!.data$done)
}

add_done <- function(data, file) {
  mutate(data, done = file_exists(file))
}

#' @export
#' @keywords internal
#' @inherit tiltIndicatorAfter::profile_emissions
profile_emissions <- function(companies,
                              co2,
                              europages_companies,
                              ecoinvent_activities,
                              ecoinvent_europages,
                              isic_tilt,
                              low_threshold = 1 / 3,
                              high_threshold = 2 / 3) {
  companies |>
    profile_with(tiltIndicatorAfter::profile_emissions,
      co2 = co2,
      europages_companies = europages_companies,
      ecoinvent_activities = ecoinvent_activities,
      ecoinvent_europages = ecoinvent_europages,
      isic = isic,
      low_threshold = 1 / 3,
      high_threshold = 2 / 3
    )
}
