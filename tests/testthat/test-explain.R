test_that("explain", {
  expect_snapshot(explain_indicator())

  expect_snapshot(explain_results())
})
