test_that("reads csv", {
  withr::local_options(readr.show_col_types = FALSE)

  expected <- tibble(x = 1)
  csv <- withr::local_tempfile(fileext = ".csv")
  write_csv(expected, csv)

  expect_no_warning(out <- read_csv_falling_back_to(csv, head(cars)))
  expect_equal(out, expected)
})

test_that("falls back with a warning", {
  expect_snapshot_warning(
    out <- read_csv_falling_back_to("/does/not/exist.csv", head(cars))
  )
  expect_equal(out, head(cars))
})
