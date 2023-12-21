show <- function(files) {
  writeLines(unlist(lapply(files, readLines)))
}

companies <- memoise::memoise(function() {
  read_csv(toy_emissions_profile_any_companies())
})

products <- memoise::memoise(function() {
  read_csv(toy_emissions_profile_products())
})
