test_that("outputs the same as tiltIndicatorAfter", {
  withr::local_options(readr.show_col_types = FALSE)
  withr::local_options(list(
    readr.show_col_types = FALSE,
    tiltWorkflows.cache_dir = withr::local_tempdir(),
    tiltWorkflows.chunks = 1
  ))

  companies <- read_csv(toy_emissions_profile_any_companies())
  products <- read_csv(toy_emissions_profile_products_ecoinvent())
  europages_companies <- read_csv(toy_europages_companies())
  ecoinvent_activities <- read_csv(toy_ecoinvent_activities())
  ecoinvent_europages <- read_csv(toy_ecoinvent_europages())
  isic_name <- read_csv(toy_isic_name())

  original <- profile_emissions(
    companies,
    products,
    europages_companies = europages_companies,
    ecoinvent_activities = ecoinvent_activities,
    ecoinvent_europages = ecoinvent_europages,
    isic = isic_name
  )

  withr::local_options(list(
    readr.show_col_types = FALSE,
    tiltWorkflows.cache_dir = withr::local_tempdir(),
    tiltWorkflows.chunks = 3
  ))
  masked <- profile_emissions(
    companies,
    products,
    europages_companies = europages_companies,
    ecoinvent_activities = ecoinvent_activities,
    ecoinvent_europages = ecoinvent_europages,
    isic = isic_name
  ) |>
    # FIXME: Suppressing
    # Attaching package: 'purrr'
    # The following object is masked from 'package:testthat':
    # is_null
    suppressMessages()

  expect_equal(dplyr::arrange(masked, companies_id), dplyr::arrange(original, companies_id))
})

test_that("with `chunks = 0` throws an informative error", {
  withr::local_options(readr.show_col_types = FALSE)
  invalid <- 0
  withr::local_options(list(
    readr.show_col_types = FALSE,
    tiltWorkflows.cache_dir = withr::local_tempdir(),
    tiltWorkflows.chunks = invalid
  ))

  companies <- read_csv(toy_emissions_profile_any_companies())
  products <- read_csv(toy_emissions_profile_products_ecoinvent())
  europages_companies <- read_csv(toy_europages_companies())
  ecoinvent_activities <- read_csv(toy_ecoinvent_activities())
  ecoinvent_europages <- read_csv(toy_ecoinvent_europages())
  isic_name <- read_csv(toy_isic_name())

  expect_error(class = "zero_chunks", profile_emissions(
    companies,
    products,
    europages_companies = europages_companies,
    ecoinvent_activities = ecoinvent_activities,
    ecoinvent_europages = ecoinvent_europages,
    isic = isic_name
  ))
})

test_that("with `chunks` passed as a character throws no error", {
  withr::local_options(readr.show_col_types = FALSE)
  withr::local_options(list(
    readr.show_col_types = FALSE,
    tiltWorkflows.chunks = as.character(3),
    tiltWorkflows.cache_dir = withr::local_tempdir()
  ))

  companies <- read_csv(toy_emissions_profile_any_companies())
  products <- read_csv(toy_emissions_profile_products_ecoinvent())
  europages_companies <- read_csv(toy_europages_companies())
  ecoinvent_activities <- read_csv(toy_ecoinvent_activities())
  ecoinvent_europages <- read_csv(toy_ecoinvent_europages())
  isic_name <- read_csv(toy_isic_name())

  expect_no_error(
    profile_emissions(
      companies,
      products,
      europages_companies = europages_companies,
      ecoinvent_activities = ecoinvent_activities,
      ecoinvent_europages = ecoinvent_europages,
      isic = isic_name
    )
  )
})

test_that("with `chunks = NULL` warns auto set chunks", {
  withr::local_options(readr.show_col_types = FALSE)
  withr::local_options(list(
    readr.show_col_types = FALSE,
    tiltWorkflows.cache_dir = withr::local_tempdir()
  ))

  companies <- read_csv(toy_emissions_profile_any_companies())
  products <- read_csv(toy_emissions_profile_products_ecoinvent())
  europages_companies <- read_csv(toy_europages_companies())
  ecoinvent_activities <- read_csv(toy_ecoinvent_activities())
  ecoinvent_europages <- read_csv(toy_ecoinvent_europages())
  isic_name <- read_csv(toy_isic_name())

  expect_warning(
    class = "auto_set_chunks",
    profile_emissions(
      companies,
      products,
      europages_companies = europages_companies,
      ecoinvent_activities = ecoinvent_activities,
      ecoinvent_europages = ecoinvent_europages,
      isic = isic_name
    )
  )
})

test_that("with `chunks = ''` warns auto set chunks", {
  withr::local_options(readr.show_col_types = FALSE)
  withr::local_options(list(
    readr.show_col_types = FALSE,
    tiltWorkflows.chunks = "",
    tiltWorkflows.cache_dir = withr::local_tempdir()
  ))

  companies <- read_csv(toy_emissions_profile_any_companies())
  products <- read_csv(toy_emissions_profile_products_ecoinvent())
  europages_companies <- read_csv(toy_europages_companies())
  ecoinvent_activities <- read_csv(toy_ecoinvent_activities())
  ecoinvent_europages <- read_csv(toy_ecoinvent_europages())
  isic_name <- read_csv(toy_isic_name())

  expect_warning(
    class = "auto_set_chunks",
    profile_emissions(
      companies,
      products,
      europages_companies = europages_companies,
      ecoinvent_activities = ecoinvent_activities,
      ecoinvent_europages = ecoinvent_europages,
      isic = isic_name
    )
  )
})

test_that("with `cache_dir = NULL` throws no error", {
  withr::local_options(readr.show_col_types = FALSE)
  withr::local_options(list(
    readr.show_col_types = FALSE,
    tiltWorkflows.chunks = 3
  ))

  companies <- read_csv(toy_emissions_profile_any_companies())
  products <- read_csv(toy_emissions_profile_products_ecoinvent())
  europages_companies <- read_csv(toy_europages_companies())
  ecoinvent_activities <- read_csv(toy_ecoinvent_activities())
  ecoinvent_europages <- read_csv(toy_ecoinvent_europages())
  isic_name <- read_csv(toy_isic_name())

  expect_no_error(
    profile_emissions(
      companies,
      products,
      europages_companies = europages_companies,
      ecoinvent_activities = ecoinvent_activities,
      ecoinvent_europages = ecoinvent_europages,
      isic = isic_name
    )
  )
})

test_that("with `cache_dir = ''` throws no error", {
  withr::local_options(readr.show_col_types = FALSE)
  withr::local_options(list(
    readr.show_col_types = FALSE,
    tiltWorkflows.cache_dir = "",
    tiltWorkflows.chunks = 3
  ))

  companies <- read_csv(toy_emissions_profile_any_companies())
  products <- read_csv(toy_emissions_profile_products_ecoinvent())
  europages_companies <- read_csv(toy_europages_companies())
  ecoinvent_activities <- read_csv(toy_ecoinvent_activities())
  ecoinvent_europages <- read_csv(toy_ecoinvent_europages())
  isic_name <- read_csv(toy_isic_name())

  expect_no_error(
    profile_emissions(
      companies,
      products,
      europages_companies = europages_companies,
      ecoinvent_activities = ecoinvent_activities,
      ecoinvent_europages = ecoinvent_europages,
      isic = isic_name
    )
  )
})

test_that("with `order = 'rev'` the chunks work in reverse order", {
  withr::local_options(readr.show_col_types = FALSE)
  tmp_cache <- local_tempfile()
  withr::local_options(list(
    readr.show_col_types = FALSE,
    tiltWorkflows.chunks = 3,
    tiltWorkflows.cache_dir = tmp_cache,
    tiltWorkflows.order = "rev"
  ))

  companies <- read_csv(toy_emissions_profile_any_companies())
  products <- read_csv(toy_emissions_profile_products_ecoinvent())
  europages_companies <- read_csv(toy_europages_companies())
  ecoinvent_activities <- read_csv(toy_ecoinvent_activities())
  ecoinvent_europages <- read_csv(toy_ecoinvent_europages())
  isic_name <- read_csv(toy_isic_name())

  profile_emissions(
    companies,
    products,
    europages_companies = europages_companies,
    ecoinvent_activities = ecoinvent_activities,
    ecoinvent_europages = ecoinvent_europages,
    isic = isic_name
  )

  actual <- fs::dir_ls(tmp_cache, recurse = TRUE, type = "file") |>
    fs::file_info() |>
    dplyr::arrange(modification_time) |>
    dplyr::pull(path) |>
    path_file() |>
    fs::path_ext_remove()

  expect_equal(actual, rev(as.character(1:3)))
})

# test_that("`score_transition_risk` outputs the same as tiltIndicatorAfter", {
#   withr::local_options(readr.show_col_types = FALSE)
#   withr::local_options(list(
#     readr.show_col_types = FALSE,
#     tiltWorkflows.cache_dir = withr::local_tempdir(),
#     tiltWorkflows.chunks = 1
#   ))
#
#   emissions_companies <- read_csv(toy_emissions_profile_any_companies())
#   products <- read_csv(toy_emissions_profile_products_ecoinvent())
#   europages_companies <- read_csv(toy_europages_companies())
#   ecoinvent_activities <- read_csv(toy_ecoinvent_activities())
#   ecoinvent_europages <- read_csv(toy_ecoinvent_europages())
#   isic_name <- read_csv(toy_isic_name())
#
#   emissions_profile_at_product_level <- profile_emissions(
#     companies = emissions_companies,
#     co2 = products,
#     europages_companies = europages_companies,
#     ecoinvent_activities = ecoinvent_activities,
#     ecoinvent_europages = ecoinvent_europages,
#     isic = isic_name
#   ) |> unnest_product()
#
#   sector_companies <- read_csv(toy_sector_profile_companies())
#   scenarios <- read_csv(toy_sector_profile_any_scenarios())
#
#   sector_profile_at_product_level <- profile_sector(
#     companies = sector_companies,
#     scenarios = scenarios,
#     europages_companies = europages_companies,
#     ecoinvent_activities = ecoinvent_activities,
#     ecoinvent_europages = ecoinvent_europages,
#     isic = isic_name
#   ) |> unnest_product()
#
#   original <- score_transition_risk(emissions_profile_at_product_level, sector_profile_at_product_level)
#
#   withr::local_options(list(
#     readr.show_col_types = FALSE,
#     tiltWorkflows.cache_dir = withr::local_tempdir(),
#     tiltWorkflows.chunks = 3
#   ))
#
#   masked <- score_transition_risk(emissions_profile_at_product_level, sector_profile_at_product_level) |>
#     suppressMessages()
#
#   expect_equal(dplyr::arrange(masked, companies_id), dplyr::arrange(original, companies_id))
# })
