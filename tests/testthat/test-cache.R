test_that("cache_info, outputs the expected data frame", {
  tmp <- local_tempfile()
  dir_create(tmp)

  out <- cache_info(tmp)

  expect_s3_class(out, "data.frame")
  expect_equal(nrow(out), 0L)
  expect_named(select(out, 1, 2), c("modification_time", "path"))
})

test_that("cache_info, if `cache_dir` doesn't exist errors gracefully", {
  expect_error(cache_info(local_tempfile()), "doesn't exist")
})

test_that("cache_delete deletes the cache", {
  tmp <- dir_create(local_tempfile())
  expect_true(dir_exists(tmp))
  cache_delete(tmp, quiet = TRUE)
  expect_false(dir_exists(tmp))
})

test_that("cache_delete, if the cache doesn't exist throws a warning", {
  expect_snapshot_warning(cache_delete("inexistent"))
})

test_that("cache_delete, if the cache exists throws a warning", {
  expect_snapshot_warning(cache_delete("inexistent"))
})

test_that("cache_dir, points to the deault cache directory", {
  expect_equal(
    path_file(cache_dir()),
    path_file(user_cache_dir("tiltWorkflows"))
  )
})
