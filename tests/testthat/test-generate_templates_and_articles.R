test_that("yaml emissions", {
  expect_snapshot(show(yaml_path("emissions")))
})

test_that("yaml emissions_upstream", {
  expect_snapshot(show(yaml_path("emissions_upstream")))
})

test_that("yaml sector", {
  expect_snapshot(show(yaml_path("sector")))
})

test_that("yaml sector_upstream", {
  expect_snapshot(show(yaml_path("sector_upstream")))
})
