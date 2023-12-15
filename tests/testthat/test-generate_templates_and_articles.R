test_that("yaml_path()", {
  skip_if_R_CMD_check()

  expect_snapshot(show(yaml_path("emissions")))

  expect_snapshot(show(yaml_path("emissions_upstream")))

  expect_snapshot(show(yaml_path("sector")))

  expect_snapshot(show(yaml_path("sector_upstream")))
})
