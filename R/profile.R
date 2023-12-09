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
    partial_pmap_by_chunks(tiltIndicatorAfter::profile_emissions,
      co2 = co2,
      europages_companies = europages_companies,
      ecoinvent_activities = ecoinvent_activities,
      ecoinvent_europages = ecoinvent_europages,
      isic_tilt = isic_tilt,
      low_threshold = 1 / 3,
      high_threshold = 2 / 3
    )
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
                                       isic_tilt,
                                       low_threshold = 1 / 3,
                                       high_threshold = 2 / 3) {
  companies |>
    partial_pmap_by_chunks(tiltIndicatorAfter::profile_emissions_upstream,
      co2 = co2,
      europages_companies = europages_companies,
      ecoinvent_activities = ecoinvent_activities,
      ecoinvent_inputs = ecoinvent_inputs,
      ecoinvent_europages = ecoinvent_europages,
      isic_tilt = isic_tilt,
      low_threshold = 1 / 3,
      high_threshold = 2 / 3
    )
}

#' @export
#' @keywords internal
#' @inherit tiltIndicatorAfter::profile_sector
profile_sector <- function(companies,
                           scenarios,
                           europages_companies,
                           ecoinvent_activities,
                           ecoinvent_europages,
                           isic_tilt,
                           low_threshold = ifelse(scenarios$year == 2030, 1 / 9, 1 / 3),
                           high_threshold = ifelse(scenarios$year == 2030, 2 / 9, 2 / 3)) {
  companies |>
    partial_pmap_by_chunks(tiltIndicatorAfter::profile_sector,
      scenarios = scenarios,
      europages_companies = europages_companies,
      ecoinvent_activities = ecoinvent_activities,
      ecoinvent_europages = ecoinvent_europages,
      isic_tilt = isic_tilt,
      low_threshold = low_threshold,
      high_threshold = high_threshold
    )
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
                                    isic_tilt,
                                    low_threshold = ifelse(scenarios$year == 2030, 1 / 9, 1 / 3),
                                    high_threshold = ifelse(scenarios$year == 2030, 2 / 9, 2 / 3)) {
  companies |>
    partial_pmap_by_chunks(tiltIndicatorAfter::profile_sector_upstream,
      scenarios = scenarios,
      inputs = inputs,
      europages_companies = europages_companies,
      ecoinvent_activities = ecoinvent_activities,
      ecoinvent_inputs = ecoinvent_inputs,
      ecoinvent_europages = ecoinvent_europages,
      isic_tilt = isic_tilt,
      low_threshold = 1 / 3,
      high_threshold = 2 / 3
    )
}
