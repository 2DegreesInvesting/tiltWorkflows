# Adapted from
# https://github.com/r-lib/usethis/blob/main/tests/testthat/helper.R#L16

create_local_package <- function(dir = fs::file_temp(pattern = "testpkg"),
                                 env = parent.frame(),
                                 rstudio = FALSE) {
  create_local_thing(dir, env, rstudio, "package")
}

create_local_project <- function(dir = fs::file_temp(pattern = "testpjr"),
                                 env = parent.frame(),
                                 rstudio = FALSE) {
  create_local_thing(dir, env, rstudio, "project")
}

create_local_thing <- function(dir = fs::file_temp(pattern = pattern),
                               env = parent.frame(),
                               rstudio = FALSE,
                               thing = c("package", "project")) {
  thing <- match.arg(thing)

  old_project <- proj_get_() # this could be `NULL`, i.e. no active project
  old_wd <- getwd() # not necessarily same as `old_project`

  withr::defer(fs::dir_delete(dir), envir = env)

  usethis::ui_silence({
    switch(thing,
      package = create_package(
        dir,
        # This is for the sake of interactive development of snapshot tests.
        # When the active usethis project is a package created with this
        # function, testthat learns its edition from *that* package, not from
        # usethis. So, by default, opt in to testthat 3e in these ephemeral test
        # packages.
        fields = list("Config/testthat/edition" = "3"),
        rstudio = rstudio,
        open = FALSE,
        check_name = FALSE
      ),
      project = usethis::create_project(dir, rstudio = rstudio, open = FALSE)
    )
  })

  withr::defer(proj_set_(old_project, force = TRUE), envir = env)
  proj_set_(dir)

  withr::defer(setwd(old_wd), envir = env)
  setwd(proj_get_())

  invisible(proj_get_())
}

proj_get_ <- function() {
  suppressMessages(usethis::proj_get())
}
proj_set_ <- function(path, force = FALSE) {
  suppressMessages(usethis::proj_set(path, force))
}

skip_if_R_CMD_check <- function() {
  if (!nzchar(Sys.getenv("R_CMD"))) {
    return(invisible(TRUE))
  }

  testthat::skip("Not run in R CMD check")
}
