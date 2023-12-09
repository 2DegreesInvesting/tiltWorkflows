pmap_by_chunks <- function(data, .f, ..., .by, chunks) {
  job <- data |>
    nest_chunk(.by = .by, chunks = chunks) |>
    add_file(parent = cache_path(deparse(substitute(.f))))

  job |>
    job_pmap(\(data, file) .f(data, ...) |> write_rds(file))
}
partial_pmap_by_chunks <- purrr::partial(
  pmap_by_chunks,
  .by = "companies_id",
  chunks = getOption("tiltWorkflow.chunks", default = length(availableWorkers()))
)

cache_path <- function(..., parent = cache_dir()) {
  path(parent, ...)
}

cache_dir <- function() {
  user_cache_dir(appname = "tiltIndicator")
}

job_pmap <- function(job, .f) {
  job |>
    pick_undone() |>
    select(.data$data, .data$file) |>
    future_pwalk(.f, .progress = TRUE)

  map_df(job$file, read_rds)
}

nest_chunk <- function(data, .by, chunks) {
  data |>
    nest(.by = all_of(.by)) |>
    mutate(data, chunk = as.integer(cut(row_number(), chunks))) |>
    unnest(data) |>
    nest(.by = .data$chunk)
}

add_file <- function(data, parent = cache_path(), ext = ".rds") {
  dir_create(parent)
  mutate(data, file = path(parent, paste0(.data$chunk, ext)))
}

pick_undone <- function(data) {
  data |>
    add_done() |>
    filter(!.data$done)
}

add_done <- function(data, file) {
  mutate(data, done = file_exists(file))
}
