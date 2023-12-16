
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

- `use_toy_input()` to create an input/ folder with toy datasets in your
  working directory.

``` r
use_toy_input()
#> Writing input/ with toy datasets.

list.files("input")
#>  [1] "ecoinvent_activities.csv"               
#>  [2] "ecoinvent_europages.csv"                
#>  [3] "ecoinvent_inputs.csv"                   
#>  [4] "emissions_profile_any_companies.csv"    
#>  [5] "emissions_profile_products.csv"         
#>  [6] "emissions_profile_upstream_products.csv"
#>  [7] "emissions_profile_upstream.csv"         
#>  [8] "emissions_profile.csv"                  
#>  [9] "europages_companies.csv"                
#> [10] "isic.csv"                               
#> [11] "sector_profile_any_scenarios.csv"       
#> [12] "sector_profile_companies.csv"           
#> [13] "sector_profile_upstream_companies.csv"  
#> [14] "sector_profile_upstream_products.csv"   
#> [15] "sector_profile_upstream.csv"            
#> [16] "sector_profile.csv"

# It won't overwrite an existing input/ directory
use_toy_input()
#> Error in `use_toy_input()`:
#> ! The input/ directory already exists in the working directory
#> ✖ Aborting to avoid overwriting existing data.
#> ℹ Do you need to move or remove your existing input/ directory?
```

- `use_workflow()` to create a workflow file into your working
  directory.

``` r
# The error shows what's available
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

- To run the workflow and create a report with the results click on Knit
  or [Knit with
  Parameters](https://2degreesinvesting.github.io/tiltWorkflows/articles/tiltWorkflows.html).

To share a link to the output “.md” file you may run
[`gh gist create profile_emissions.md`](https://cli.github.com/manual/gh_gist)
or paste its contents into a [new GitHub gist](https://gist.github.com).
