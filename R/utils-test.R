show <- function(files) {
  writeLines(unlist(lapply(files, readLines)))
}

companies <- memoise::memoise(function() {
  read_csv(toy_emissions_profile_any_companies())
})

products <- memoise::memoise(function() {
  read_csv(toy_emissions_profile_products())
})

verbose <- function() {
  # Inspired by https://ropensci.org/blog/2024/02/06/verbosity-control-packages/#how-to-implement-package-level-verbosity-control-in-your-package
  getOption("tiltWorkflows.verbose", default = TRUE)
}

read_test_csv <- function(file, ..., show_col_types = FALSE, n_max = 1) {
  read_csv(file, show_col_types = show_col_types, n_max = n_max)
}
