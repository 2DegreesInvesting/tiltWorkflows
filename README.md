
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tiltWorkflows

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/2DegreesInvesting/tiltWorkflows/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/2DegreesInvesting/tiltWorkflows/actions/workflows/R-CMD-check.yaml)
[![tiltWorkflows status
badge](https://2degreesinvesting.r-universe.dev/badges/tiltWorkflows)](https://2degreesinvesting.r-universe.dev/tiltWorkflows)
<!-- badges: end -->

The goal of tiltWorkflows is to make it easy to run tilt workflows.

Main features:

- Easily access toy inputs to try any workflow.
- Easily access any workflow file.
- Use your own data without writing code.
- Easily share a reproducible report on GitHub.
- Run large datasets that normally saturate your computer’s memory.
- Run faster than normal by running multiple chunks of data in parallel.
- Resume after interruptions without recomputing completed chunks.

## Installation

You can install the development version from
[r-universe](https://r-universe.dev/):

``` r
options(repos = c("https://2degreesinvesting.r-universe.dev", getOption("repos")))
install.packages("tiltWorkflows")
```

Or from [GitHub](https://github.com/):

``` r
# install.packages("pak")
pak::pak("2DegreesInvesting/tiltWorkflows")
```

Having trouble? Try it on a fresh new project on <https://posit.cloud/>
(free).

## Example

``` r
library(tiltWorkflows)
```

- Create a workflow file into your working directory.

``` r
use_workflow("profile_emissions.Rmd")
#> ✔ Setting active project to '/home/rstudio/git/tiltWorkflows'
#> ✔ Writing 'profile_emissions.Rmd'
```

- Create an input/ directory with toy datasets.

``` r
use_toy_input()
#> Writing input/ with toy datasets.
```

- Render the workflow to create a report and output/ files with results.

``` r
# Or click "Knit" in RStudio
render("profile_emissions.Rmd", quiet = TRUE)

list.files("output")
#> [1] "emissions_profile_at_company_level.csv" "emissions_profile_at_product_level.csv"
```

To learn more see [Get
started](https://2degreesinvesting.github.io/tiltWorkflows/articles/tiltWorkflows.html).
