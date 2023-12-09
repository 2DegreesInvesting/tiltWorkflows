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
    profile_with(tiltIndicatorAfter::profile_emissions_upstream,
      co2 = co2,
      europages_companies = europages_companies,
      ecoinvent_activities = ecoinvent_activities,
      ecoinvent_inputs = ecoinvent_inputs,
      ecoinvent_europages = ecoinvent_europages,
      isic = isic,
      low_threshold = 1 / 3,
      high_threshold = 2 / 3
    )
}
