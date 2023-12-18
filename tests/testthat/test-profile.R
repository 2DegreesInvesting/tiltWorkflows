test_that("0 chunks yields an informative error", {
  invalid <- 0
  withr::local_options(list(
    readr.show_col_types = FALSE,
    tiltWorkflows.cache_dir = withr::local_tempdir(),
    tiltWorkflows.chunks = invalid
  ))

  companies <- read_csv(toy_emissions_profile_any_companies())
  products <- read_csv(toy_emissions_profile_products())

  expect_snapshot_error(profile_emissions(
    companies,
    products,
    # TODO: Move to tiltToyData
    europages_companies = tiltIndicatorAfter::ep_companies,
    ecoinvent_activities = tiltIndicatorAfter::ecoinvent_activities,
    ecoinvent_europages = tiltIndicatorAfter::matches_mapper |> head(100),
    isic_tilt = tiltIndicatorAfter::isic_tilt_mapper
  ))
})

test_that("outputs the same as tiltIndicatorAfter", {
  withr::local_options(list(
    readr.show_col_types = FALSE,
    tiltWorkflows.cache_dir = withr::local_tempdir(),
    tiltWorkflows.chunks = 1
  ))

  companies <- read_csv(toy_emissions_profile_any_companies())
  products <- read_csv(toy_emissions_profile_products())

  original <- profile_emissions(
    companies,
    products,
    # TODO: Move to tiltToyData
    europages_companies = tiltIndicatorAfter::ep_companies,
    ecoinvent_activities = tiltIndicatorAfter::ecoinvent_activities,
    ecoinvent_europages = tiltIndicatorAfter::matches_mapper |> head(100),
    isic_tilt = tiltIndicatorAfter::isic_tilt_mapper
  )

  withr::local_options(list(
    readr.show_col_types = FALSE,
    tiltWorkflows.cache_dir = withr::local_tempdir(),
    tiltWorkflows.chunks = 3
  ))
  masked <- profile_emissions(
    companies,
    products,
    # TODO: Move to tiltToyData
    europages_companies = tiltIndicatorAfter::ep_companies,
    ecoinvent_activities = tiltIndicatorAfter::ecoinvent_activities,
    ecoinvent_europages = tiltIndicatorAfter::matches_mapper |> head(100),
    isic_tilt = tiltIndicatorAfter::isic_tilt_mapper
  ) |>
    # FIXME: Suppressing
    # Attaching package: 'purrr'
    # The following object is masked from 'package:testthat':
    # is_null
    suppressMessages()

  expect_equal(masked, original)
})

test_that("without tiltWorkflows.chunks wanrs auto set chunks", {
  withr::local_options(list(
    readr.show_col_types = FALSE,
    tiltWorkflows.cache_dir = withr::local_tempdir()
  ))

  companies <- read_csv(toy_emissions_profile_any_companies())
  products <- read_csv(toy_emissions_profile_products())

  expect_warning(
    class = "auto_set_chunks",
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

test_that("get_chunks() returns the number passed via options", {
  expected <- 2
  withr::local_options(list(tiltWorkflows.chunks = expected))
  data <- tibble(x = 1)
  expect_equal(get_chunks(data), expected)
})

test_that("get_chunks() returns the default", {
  data <- tibble(x = 1)
  expect_equal(get_chunks(data, default = 999), 999)
})

test_that("if `tiltWorkflows.chunks` is set, it throws no warning", {
  withr::local_options(list(
    readr.show_col_types = FALSE,
    tiltWorkflows.chunks = 3
  ))

  companies <- read_csv(toy_emissions_profile_any_companies())
  products <- read_csv(toy_emissions_profile_products())

  expect_no_warning(
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

test_that("if `tiltWorkflows.order` is 'rev' the chunks work in reverse order", {
  tmp_cache <- withr::local_tempfile()
  withr::local_options(list(
    readr.show_col_types = FALSE,
    tiltWorkflows.chunks = 3,
    tiltWorkflows.cache_dir = tmp_cache,
    tiltWorkflows.order = "rev"
  ))

  companies <- read_csv(toy_emissions_profile_any_companies())
  products <- read_csv(toy_emissions_profile_products())

  profile_emissions(
    companies,
    products,
    # TODO: Move to tiltToyData
    europages_companies = tiltIndicatorAfter::ep_companies,
    ecoinvent_activities = tiltIndicatorAfter::ecoinvent_activities,
    ecoinvent_europages = tiltIndicatorAfter::matches_mapper |> head(100),
    isic_tilt = tiltIndicatorAfter::isic_tilt_mapper
  )

  actual <- fs::dir_ls(tmp_cache, recurse = TRUE, type = "file") |>
    fs::file_info() |>
    dplyr::arrange(modification_time) |>
    dplyr::pull(path) |>
    fs::path_file() |>
    fs::path_ext_remove()

  expect_equal(actual, rev(as.character(1:3)))
})

test_that("if `tiltWorkflows.order` is 'identity' the chunks work in order", {
  tmp_cache <- withr::local_tempfile()
  withr::local_options(list(
    readr.show_col_types = FALSE,
    tiltWorkflows.chunks = 3,
    tiltWorkflows.cache_dir = tmp_cache,
    tiltWorkflows.order = "identity"
  ))

  companies <- read_csv(toy_emissions_profile_any_companies())
  products <- read_csv(toy_emissions_profile_products())

  profile_emissions(
    companies,
    products,
    # TODO: Move to tiltToyData
    europages_companies = tiltIndicatorAfter::ep_companies,
    ecoinvent_activities = tiltIndicatorAfter::ecoinvent_activities,
    ecoinvent_europages = tiltIndicatorAfter::matches_mapper |> head(100),
    isic_tilt = tiltIndicatorAfter::isic_tilt_mapper
  )

  actual <- cache_info(tmp_cache) |>
    dplyr::pull(path) |>
    fs::path_file() |>
    fs::path_ext_remove()

  expect_equal(actual, as.character(1:3))
})

test_that("if `tiltWorkflows.order` is 'identity' the chunks work in order", {
  tmp_cache <- withr::local_tempfile()
  withr::local_options(list(
    readr.show_col_types = FALSE,
    tiltWorkflows.chunks = 3,
    tiltWorkflows.cache_dir = tmp_cache,
    tiltWorkflows.order = "rev"
  ))

  companies <- read_csv(toy_emissions_profile_any_companies())
  products <- read_csv(toy_emissions_profile_products())

  profile_emissions(
    companies,
    products,
    # TODO: Move to tiltToyData
    europages_companies = tiltIndicatorAfter::ep_companies,
    ecoinvent_activities = tiltIndicatorAfter::ecoinvent_activities,
    ecoinvent_europages = tiltIndicatorAfter::matches_mapper |> head(100),
    isic_tilt = tiltIndicatorAfter::isic_tilt_mapper
  )

  actual <- cache_info(tmp_cache) |>
    dplyr::pull(path) |>
    fs::path_file() |>
    fs::path_ext_remove()

  expect_equal(actual, rev(as.character(1:3)))
})
