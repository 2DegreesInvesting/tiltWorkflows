show <- function(files) {
  writeLines(unlist(lapply(files, readLines)))
}
