test_that("has identical interface to tiltIndicatorAfter", {
  expect_equal(
    formalArgs(profile_emissions),
    formalArgs(tiltIndicatorAfter::profile_emissions)
  )

  expect_equal(
    formalArgs(profile_emissions_upstream),
    formalArgs(tiltIndicatorAfter::profile_emissions_upstream)
  )

  expect_equal(
    formalArgs(profile_sector),
    formalArgs(tiltIndicatorAfter::profile_sector)
  )

  expect_equal(
    formalArgs(profile_sector_upstream),
    formalArgs(tiltIndicatorAfter::profile_sector_upstream)
  )
})

test_that("outputs the same as tiltIndicatorAfter", {
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

  remove_unimportant_differences <- function(data) {
    # The order of rows is unimportant
    arranged <- dplyr::arrange(data, companies_id)
    # The specific value of randomly-generated columns are unimportant
    generated_randomly <- "co2e"
    product <- select(unnest_product(arranged), -matches(generated_randomly))
    company <- select(unnest_company(arranged), -matches(generated_randomly))
    tiltIndicator::nest_levels(product, company)
  }

  expect_equal(
    remove_unimportant_differences(original),
    remove_unimportant_differences(masked)
  )
})

test_that("with `chunks = 0` throws an informative error", {
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
