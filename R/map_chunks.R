map_chunks <- function(data,
                       .f, ...,
                       .by,
                       chunks,
                       cache_dir,
                       order = "identity",
                       options = NULL) {
  parent <- rm_namespace(deparse(substitute(.f)))
  job <- data |>
    nest_chunk(.by = .by, chunks = chunks) |>
    add_file(cache_path(parent, cache_dir = dir_create(cache_dir)))

  job |>
    pick_undone() |>
    dchunkr::order_rows(.fun = order) |>
    select("data", "file") |>
    future_pwalk(
      function(data, file) {
        # Pass options https://github.com/HenrikBengtsson/future/issues/134
        withr::local_options(options)
        .f(data, ...) |>
          write_rds(file)
      },
      .progress = TRUE,
      .options = furrr::furrr_options(seed = TRUE)
    )

  map_df(job$file, read_rds)
}

rm_namespace <- function(x) {
  gsub("^.*::(.*)$", "\\1", x)
}
