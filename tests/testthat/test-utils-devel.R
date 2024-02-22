test_that("yaml_path()", {
  skip_if_R_CMD_check()

  expect_snapshot(show(yaml_path("profile_emissions")))

  expect_snapshot(show(yaml_path("profile_emissions_upstream")))

  expect_snapshot(show(yaml_path("profile_sector")))

  expect_snapshot(show(yaml_path("profile_sector_upstream")))

  expect_snapshot(show(yaml_path("score_transition_risk")))
})
