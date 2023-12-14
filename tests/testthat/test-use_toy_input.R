test_that("outputs an input/ directory in the working directory", {
  withr::local_dir(withr::local_tempdir())
  use_toy_input()
  expect_true(dir_exists("input"))
})

test_that("if input/ already exists in the working directory, it errors", {
  withr::local_dir(withr::local_tempdir())
  use_toy_input()
  expect_snapshot_error(use_toy_input())
})
