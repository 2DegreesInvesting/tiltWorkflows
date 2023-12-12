test_that("with the expected options throws no error", {
  withr::local_options(list(
    readr.show_col_types = FALSE,
    tiltWorkflows.cache_dir = withr::local_tempdir(),
    tiltWorkflows.chunks = 3
  ))

  companies <- read_csv(toy_emissions_profile_any_companies())
  products <- read_csv(toy_emissions_profile_products())

  expect_no_error(
    profile_emissions(
      companies,
      products,
      # TODO: Move to tiltToyData
      europages_companies = tiltIndicatorAfter::ep_companies,
      ecoinvent_activities = tiltIndicatorAfter::ecoinvent_activities,
      ecoinvent_europages = tiltIndicatorAfter::matches_mapper |> head(100),
      isic_tilt = tiltIndicatorAfter::isic_tilt_mapper
    )
  )
})

test_that("without tiltWorkflows.chunks throws no error", {
  withr::local_options(list(
    readr.show_col_types = FALSE,
    tiltWorkflows.cache_dir = withr::local_tempdir()
  ))

  companies <- read_csv(toy_emissions_profile_any_companies())
  products <- read_csv(toy_emissions_profile_products())

  expect_no_error(
    profile_emissions(
      companies,
      products,
      # TODO: Move to tiltToyData
      europages_companies = tiltIndicatorAfter::ep_companies,
      ecoinvent_activities = tiltIndicatorAfter::ecoinvent_activities,
      ecoinvent_europages = tiltIndicatorAfter::matches_mapper |> head(100),
      isic_tilt = tiltIndicatorAfter::isic_tilt_mapper
    )
  )
})

test_that("without tiltWorkflows.cache_dir throws no error", {
  withr::local_options(list(
    readr.show_col_types = FALSE,
    tiltWorkflows.chunks = 3
  ))

  companies <- read_csv(toy_emissions_profile_any_companies())
  products <- read_csv(toy_emissions_profile_products())

  expect_no_error(
    profile_emissions(
      companies,
      products,
      # TODO: Move to tiltToyData
      europages_companies = tiltIndicatorAfter::ep_companies,
      ecoinvent_activities = tiltIndicatorAfter::ecoinvent_activities,
      ecoinvent_europages = tiltIndicatorAfter::matches_mapper |> head(100),
      isic_tilt = tiltIndicatorAfter::isic_tilt_mapper
    )
  )
})
