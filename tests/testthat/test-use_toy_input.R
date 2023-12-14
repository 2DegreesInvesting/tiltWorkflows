test_that("outputs an input/ directory in the working directory", {
  withr::local_dir(withr::local_tempdir())
  use_toy_input(quiet = TRUE)
  expect_true(dir_exists("input"))
})

test_that("if input/ already exists in the working directory, it errors", {
  withr::local_dir(withr::local_tempdir())
  use_toy_input(quiet = TRUE)
  expect_snapshot_error(use_toy_input())
})

test_that("informs the user", {
  withr::local_dir(withr::local_tempdir())
  expect_message(use_toy_input(), "[Ww]riting")
})
