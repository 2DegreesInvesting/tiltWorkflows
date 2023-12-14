
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tiltWorkflows

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/2DegreesInvesting/tiltWorkflows/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/2DegreesInvesting/tiltWorkflows/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of tiltWorkflows is to make it easy to run tilt workflows.

## Installation

You can install the development version of tiltWorkflows like so:

``` r
# install.packages("pak")
pak::pak("2DegreesInvesting/tiltWorkflows")
```

## Example

``` r
library(tiltWorkflows)
```

- Run
  [`use_workflow()`](https://2degreesinvesting.github.io/tiltWorkflows/reference/use_workflow.html)
  to create a workflow file into your working directory.

``` r
# Trigger an error to see what's available
use_workflow()
#> Error in `use_workflow()`:
#> ! ✖ The workflow file must be provided.
#> ℹ Which one do you want?
#> * `use_workflow("profile_emissions_upstream.Rmd")`
#> * `use_workflow("profile_emissions.Rmd")`
#> * `use_workflow("profile_sector_upstream.Rmd")`
#> * `use_workflow("profile_sector.Rmd")`

use_workflow("profile_emissions.Rmd")
#> ✔ Setting active project to '/home/rstudio/git/tiltWorkflows'
#> ✔ Writing 'profile_emissions.Rmd'
```

- *Knit* the workflow (consider [using
  parameters](https://2degreesinvesting.github.io/tiltWorkflows/articles/tiltWorkflows.html)).

To share a link to the output .md file you may run
[`gh gist create profile_emissions.md`](https://cli.github.com/manual/gh_gist)
or paste its contents into a [new GitHub gist](https://gist.github.com).
