run_workflow <- function(workflow,
                         .params = NULL,
                         cache_dir = default_cache_dir()){
  withr::local_options(list(tiltWorkflows.cache_dir = cache_dir))

  rmarkdown::render(workflow, params = .params, quiet = TRUE)
}
