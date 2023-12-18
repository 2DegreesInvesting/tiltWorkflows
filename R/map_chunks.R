map_chunks <- function(data,
                       .f, ...,
                       .by,
                       chunks,
                       cache_dir,
                       order = "identity") {
  parent <- rm_namespace(deparse(substitute(.f)))
  job <- data |>
    nest_chunk(.by = .by, chunks = chunks) |>
    add_file(cache_path(parent, cache_dir = dir_create(cache_dir)))

  job |>
    pick_undone() |>
    dchunkr::order_rows(.fun = order) |>
    select("data", "file") |>
    future_pwalk(\(data, file) .f(data, ...) |> write_rds(file), .progress = TRUE)

  map_df(job$file, read_rds)
}

rm_namespace <- function(x) {
  gsub("^.*::(.*)$", "\\1", x)
}
