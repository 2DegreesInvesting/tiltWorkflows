test_that("creates output sensitive to .params", {
  workdir <- withr::local_tempdir()
  withr::local_dir(workdir)
  cache_dir <- fs::dir_create(withr::local_tempfile())
  workflow <- "profile_emissions.Rmd"
  path <- workflow_path(workflow)
  fs::file_copy(path, workflow)
  use_toy_input(quiet = TRUE)

  run_workflow(workflow, .params = list(chunks = 2, order = "rev", cache_dir = cache_dir))

  expect_true(fs::dir_exists("output"))

  fs::dir_ls(cache_dir, recurse = TRUE, type = "file")
  info <- cache_info(cache_dir = cache_dir)
  cache_files <- fs::path_ext_remove(fs::path_file(info$path))

  expected <- as.character(2:1)
  expect_equal(cache_files, expected)
})
