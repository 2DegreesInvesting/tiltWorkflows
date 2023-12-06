test_that("defaults to tiltWorkflows.Rmd", {
  skip_if_R_CMD_check()

  create_local_project()
  suppressMessages(use_workflow())
  expect_true(file.exists("tiltWorkflows.Rmd"))
})

test_that("is sensitive to `save_as`", {
  skip_if_R_CMD_check()

  create_local_project()
  file <- "custom.Rmd"
  suppressMessages(use_workflow(save_as = file))
  expect_true(file.exists(file))
})
