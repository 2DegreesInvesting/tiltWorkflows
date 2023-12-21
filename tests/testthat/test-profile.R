test_that("outputs the same as tiltIndicatorAfter", {
  withr::local_options(list(
    readr.show_col_types = FALSE,
    tiltWorkflows.cache_dir = withr::local_tempdir(),
    tiltWorkflows.chunks = 1
  ))

  companies <- companies()
  products <- products()

  original <- profile_emissions(
    companies,
    products,
    # TODO: Move to tiltToyData
    europages_companies = tiltIndicatorAfter::ep_companies,
    ecoinvent_activities = tiltIndicatorAfter::ecoinvent_activities,
    ecoinvent_europages = tiltIndicatorAfter::matches_mapper |> head(10),
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
    ecoinvent_europages = tiltIndicatorAfter::matches_mapper |> head(10),
    isic_tilt = tiltIndicatorAfter::isic_tilt_mapper
  ) |>
    # FIXME: Suppressing
    # Attaching package: 'purrr'
    # The following object is masked from 'package:testthat':
    # is_null
    suppressMessages()

  expect_equal(masked, original)
})

test_that("with `chunks = 0` throws an informative error", {
  invalid <- 0
  withr::local_options(list(
    readr.show_col_types = FALSE,
    tiltWorkflows.cache_dir = withr::local_tempdir(),
    tiltWorkflows.chunks = invalid
  ))

  companies <- companies()
  products <- products()

  expect_error(class = "zero_chunks", profile_emissions(
    companies,
    products,
    # TODO: Move to tiltToyData
    europages_companies = tiltIndicatorAfter::ep_companies,
    ecoinvent_activities = tiltIndicatorAfter::ecoinvent_activities,
    ecoinvent_europages = tiltIndicatorAfter::matches_mapper |> head(10),
    isic_tilt = tiltIndicatorAfter::isic_tilt_mapper
  ))
})

test_that("with `chunks` passed as a character throws no error", {
  withr::local_options(list(
    readr.show_col_types = FALSE,
    tiltWorkflows.chunks = as.character(3),
    tiltWorkflows.cache_dir = withr::local_tempdir()
  ))

  companies <- companies()
  products <- products()

  expect_no_error(
    profile_emissions(
      companies,
      products,
      # TODO: Move to tiltToyData
      europages_companies = tiltIndicatorAfter::ep_companies,
      ecoinvent_activities = tiltIndicatorAfter::ecoinvent_activities,
      ecoinvent_europages = tiltIndicatorAfter::matches_mapper |> head(10),
      isic_tilt = tiltIndicatorAfter::isic_tilt_mapper
    )
  )
})

test_that("with `chunks = NULL` warns auto set chunks", {
  withr::local_options(list(
    readr.show_col_types = FALSE,
    tiltWorkflows.cache_dir = withr::local_tempdir()
  ))

  companies <- companies()
  products <- products()

  expect_warning(
    class = "auto_set_chunks",
    profile_emissions(
      companies,
      products,
      # TODO: Move to tiltToyData
      europages_companies = tiltIndicatorAfter::ep_companies,
      ecoinvent_activities = tiltIndicatorAfter::ecoinvent_activities,
      ecoinvent_europages = tiltIndicatorAfter::matches_mapper |> head(10),
      isic_tilt = tiltIndicatorAfter::isic_tilt_mapper
    )
  )
})

test_that("with `chunks = ''` warns auto set chunks", {
  withr::local_options(list(
    readr.show_col_types = FALSE,
    tiltWorkflows.chunks = "",
    tiltWorkflows.cache_dir = withr::local_tempdir()
  ))

  companies <- companies()
  products <- products()

  expect_warning(
    class = "auto_set_chunks",
    profile_emissions(
      companies,
      products,
      # TODO: Move to tiltToyData
      europages_companies = tiltIndicatorAfter::ep_companies,
      ecoinvent_activities = tiltIndicatorAfter::ecoinvent_activities,
      ecoinvent_europages = tiltIndicatorAfter::matches_mapper |> head(10),
      isic_tilt = tiltIndicatorAfter::isic_tilt_mapper
    )
  )
})

test_that("with `cache_dir = NULL` throws no error", {
  withr::local_options(list(
    readr.show_col_types = FALSE,
    tiltWorkflows.chunks = 3
  ))

  companies <- companies()
  products <- products()

  expect_no_error(
    profile_emissions(
      companies,
      products,
      # TODO: Move to tiltToyData
      europages_companies = tiltIndicatorAfter::ep_companies,
      ecoinvent_activities = tiltIndicatorAfter::ecoinvent_activities,
      ecoinvent_europages = tiltIndicatorAfter::matches_mapper |> head(10),
      isic_tilt = tiltIndicatorAfter::isic_tilt_mapper
    )
  )
})

test_that("with `cache_dir = ''` throws no error", {
  withr::local_options(list(
    readr.show_col_types = FALSE,
    tiltWorkflows.cache_dir = "",
    tiltWorkflows.chunks = 3
  ))

  companies <- companies()
  products <- products()

  expect_no_error(
    profile_emissions(
      companies,
      products,
      # TODO: Move to tiltToyData
      europages_companies = tiltIndicatorAfter::ep_companies,
      ecoinvent_activities = tiltIndicatorAfter::ecoinvent_activities,
      ecoinvent_europages = tiltIndicatorAfter::matches_mapper |> head(10),
      isic_tilt = tiltIndicatorAfter::isic_tilt_mapper
    )
  )
})

test_that("with `order = 'rev'` the chunks work in reverse order", {
  tmp_cache <- local_tempfile()
  withr::local_options(list(
    readr.show_col_types = FALSE,
    tiltWorkflows.chunks = 3,
    tiltWorkflows.cache_dir = tmp_cache,
    tiltWorkflows.order = "rev"
  ))

  companies <- companies()
  products <- products()

  profile_emissions(
    companies,
    products,
    # TODO: Move to tiltToyData
    europages_companies = tiltIndicatorAfter::ep_companies,
    ecoinvent_activities = tiltIndicatorAfter::ecoinvent_activities,
    ecoinvent_europages = tiltIndicatorAfter::matches_mapper |> head(10),
    isic_tilt = tiltIndicatorAfter::isic_tilt_mapper
  )

  actual <- fs::dir_ls(tmp_cache, recurse = TRUE, type = "file") |>
    fs::file_info() |>
    dplyr::arrange(modification_time) |>
    dplyr::pull(path) |>
    path_file() |>
    fs::path_ext_remove()

  expect_equal(actual, rev(as.character(1:3)))
})
