#' @export
#' @keywords internal
#' @inherit tiltIndicatorAfter::profile_emissions
profile_emissions <- function(companies,
                              co2,
                              europages_companies,
                              ecoinvent_activities,
                              ecoinvent_europages,
                              isic,
                              isic_tilt = lifecycle::deprecated(),
                              low_threshold = 1 / 3,
                              high_threshold = 2 / 3) {
  if (lifecycle::is_present(isic_tilt)) {
    lifecycle::deprecate_warn(
      "0.0.0.9017", "profile_emissions(isic_tilt)",
      "profile_emissions(isic)"
    )
    isic <- isic_tilt
  }

  op <- enlist_options()
  chunks <- op$chunks
  cache_dir <- op$cache_dir
  order <- op$order

  if (identical(chunks, 1)) {
    tiltIndicatorAfter::profile_emissions(
      companies,
      co2 = co2,
      europages_companies = europages_companies,
      ecoinvent_activities = ecoinvent_activities,
      ecoinvent_europages = ecoinvent_europages,
      isic = isic,
      low_threshold = low_threshold,
      high_threshold = high_threshold
    )
  } else {
    map_chunks(
      companies,
      chunks = handle_chunks(companies),
      cache_dir = cache_dir,
      order = order,
      .by = "companies_id",
      .f = tiltIndicatorAfter::profile_emissions,
      co2 = co2,
      europages_companies = europages_companies,
      ecoinvent_activities = ecoinvent_activities,
      ecoinvent_europages = ecoinvent_europages,
      isic = isic,
      low_threshold = low_threshold,
      high_threshold = high_threshold
    )
  }
}

#' @export
#' @keywords internal
#' @inherit tiltIndicatorAfter::profile_emissions_upstream
profile_emissions_upstream <- function(companies,
                                       co2,
                                       europages_companies,
                                       ecoinvent_activities,
                                       ecoinvent_inputs,
                                       ecoinvent_europages,
                                       isic,
                                       isic_tilt = lifecycle::deprecated(),
                                       low_threshold = 1 / 3,
                                       high_threshold = 2 / 3) {
  if (lifecycle::is_present(isic_tilt)) {
    lifecycle::deprecate_warn(
      "0.0.0.9017", "profile_emissions_upstream(isic_tilt)",
      "profile_emissions_upstream(isic)"
    )
    isic <- isic_tilt
  }

  op <- enlist_options()
  chunks <- op$chunks
  cache_dir <- op$cache_dir
  order <- op$order

  if (identical(chunks, 1)) {
    tiltIndicatorAfter::profile_emissions_upstream(
      companies,
      co2 = co2,
      europages_companies = europages_companies,
      ecoinvent_activities = ecoinvent_activities,
      ecoinvent_inputs = ecoinvent_inputs,
      ecoinvent_europages = ecoinvent_europages,
      isic = isic,
      low_threshold = low_threshold,
      high_threshold = high_threshold
    )
  } else {
    map_chunks(
      companies,
      .by = "companies_id",
      chunks = handle_chunks(companies),
      cache_dir = cache_dir,
      order = order,
      .f = tiltIndicatorAfter::profile_emissions_upstream,
      co2 = co2,
      europages_companies = europages_companies,
      ecoinvent_activities = ecoinvent_activities,
      ecoinvent_inputs = ecoinvent_inputs,
      ecoinvent_europages = ecoinvent_europages,
      isic = isic,
      low_threshold = low_threshold,
      high_threshold = high_threshold
    )
  }
}

#' @export
#' @keywords internal
#' @inherit tiltIndicatorAfter::profile_sector
profile_sector <- function(companies,
                           scenarios,
                           europages_companies,
                           ecoinvent_activities,
                           ecoinvent_europages,
                           isic,
                           isic_tilt = lifecycle::deprecated(),
                           low_threshold = ifelse(scenarios$year == 2030, 1 / 9, 1 / 3),
                           high_threshold = ifelse(scenarios$year == 2030, 2 / 9, 2 / 3)) {
  if (lifecycle::is_present(isic_tilt)) {
    lifecycle::deprecate_warn(
      "0.0.0.9017", "profile_sector(isic_tilt)",
      "profile_sector(isic)"
    )
    isic <- isic_tilt
  }

  op <- enlist_options()
  chunks <- op$chunks
  cache_dir <- op$cache_dir
  order <- op$order

  if (identical(chunks, 1)) {
    tiltIndicatorAfter::profile_sector(
      companies,
      scenarios = scenarios,
      europages_companies = europages_companies,
      ecoinvent_activities = ecoinvent_activities,
      ecoinvent_europages = ecoinvent_europages,
      isic = isic,
      low_threshold = low_threshold,
      high_threshold = high_threshold
    )
  } else {
    map_chunks(
      companies,
      .by = "companies_id",
      chunks = handle_chunks(companies),
      cache_dir = cache_dir,
      order = order,
      .f = tiltIndicatorAfter::profile_sector,
      scenarios = scenarios,
      europages_companies = europages_companies,
      ecoinvent_activities = ecoinvent_activities,
      ecoinvent_europages = ecoinvent_europages,
      isic = isic,
      low_threshold = low_threshold,
      high_threshold = high_threshold
    )
  }
}

#' @export
#' @keywords internal
#' @inherit tiltIndicatorAfter::profile_sector_upstream
profile_sector_upstream <- function(companies,
                                    scenarios,
                                    inputs,
                                    europages_companies,
                                    ecoinvent_activities,
                                    ecoinvent_inputs,
                                    ecoinvent_europages,
                                    isic,
                                    isic_tilt = lifecycle::deprecated(),
                                    low_threshold = ifelse(scenarios$year == 2030, 1 / 9, 1 / 3),
                                    high_threshold = ifelse(scenarios$year == 2030, 2 / 9, 2 / 3)) {
  if (lifecycle::is_present(isic_tilt)) {
    lifecycle::deprecate_warn(
      "0.0.0.9017", "profile_sector_upstream(isic_tilt)",
      "profile_sector_upstream(isic)"
    )
    isic <- isic_tilt
  }

  op <- enlist_options()
  chunks <- op$chunks
  cache_dir <- op$cache_dir
  order <- op$order

  if (identical(chunks, 1)) {
    tiltIndicatorAfter::profile_sector_upstream(
      companies,
      scenarios = scenarios,
      inputs = inputs,
      europages_companies = europages_companies,
      ecoinvent_activities = ecoinvent_activities,
      ecoinvent_inputs = ecoinvent_inputs,
      ecoinvent_europages = ecoinvent_europages,
      isic = isic,
      low_threshold = low_threshold,
      high_threshold = high_threshold
    )
  } else {
    map_chunks(
      companies,
      .by = "companies_id",
      chunks = handle_chunks(companies),
      cache_dir = cache_dir,
      order = order,
      .f = tiltIndicatorAfter::profile_sector_upstream,
      scenarios = scenarios,
      inputs = inputs,
      europages_companies = europages_companies,
      ecoinvent_activities = ecoinvent_activities,
      ecoinvent_inputs = ecoinvent_inputs,
      ecoinvent_europages = ecoinvent_europages,
      isic = isic,
      low_threshold = low_threshold,
      high_threshold = high_threshold
    )
  }
}

abort_zero_chunks <- function(x) {
  if (!nzchar(x) || is.null(x) || x > 0) {
    return(invisible(x))
  }

  abort(c(
    "The number of chunks must be greater than 0:",
    "`0` is invalid.",
    "`1` uses the entire `*companies` dataset.",
    "`2` or more splits the `*companies` dataset in that number of pieces.",
    "`NULL` and `''` distributes companies evently across available cores."
  ), class = "zero_chunks")
}

handle_chunks <- function(data) {
  chunks <- get_chunks(data)
  out <- if_1_return_2(chunks)

  if (is.null(empty_to_null(getOption("tiltWorkflows.chunks")))) {
    warn(
      glue("Splitting `{deparse(substitute(data))}` into {out} chunks."),
      class = "auto_set_chunks"
    )
  }

  as.numeric(out)
}

get_chunks <- function(data, default = default_chunks(data)) {
  empty_to_null(getOption("tiltWorkflows.chunks")) %||% default
}

default_chunks <- function(data) {
  unname(future::availableCores())
}

if_1_return_2 <- function(x) {
  stopifnot(x > 0)
  if (x == 1) {
    return(2)
  } else {
    x
  }
}

empty_to_null <- function(x) {
  if (is.null(x)) {
    return(x)
  }
  if (!nzchar(x)) {
    return(NULL)
  }
  x
}

enlist_options <- function() {
  list(
    chunks = abort_zero_chunks(empty_to_null(getOption("tiltWorkflows.chunks"))),
    cache_dir = empty_to_null(getOption("tiltWorkflows.cache_dir")) %||%
      user_cache_dir("tiltWorkflows"),
    order = getOption("tiltWorkflows.order", "identity")
  )
}
