test_that("writes a workflow", {
  skip_if_R_CMD_check()

  create_local_project()
  suppressMessages(use_workflow("profile_emissions.Rmd"))
  expect_true(file.exists("profile_emissions.Rmd"))
})

test_that("is sensitive to `save_as`", {
  skip_if_R_CMD_check()

  create_local_project()
  file <- "custom.Rmd"
  suppressMessages(use_workflow("profile_emissions.Rmd", save_as = file))
  expect_true(file.exists(file))
})

test_that("without a workflow errors gracefully", {
  expect_snapshot_error(use_workflow())
})
