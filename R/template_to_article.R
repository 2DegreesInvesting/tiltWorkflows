template_to_article <- function(template = "profile.Rmd",
                                article = "tiltWorkflows.Rmd") {
  use_workflow(
    template = template,
    save_as = path("vignettes", "articles", article)
  )
}
