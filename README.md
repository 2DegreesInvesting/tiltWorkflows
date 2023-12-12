---
output: github_document
---

<!-- README.md is generated from README.Rmd. Please edit that file -->



# tiltWorkflows

<!-- badges: start -->
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
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

Run
[`use_workflow()`](https://2degreesinvesting.github.io/tiltWorkflows/reference/use_workflow.html)
to create a workflow file into your working directory.


```r
library(tiltWorkflows)
#> Loading required package: tiltIndicatorAfter
#> Loading required package: tiltToyData
#> 
#> Attaching package: 'tiltWorkflows'
#> The following objects are masked from 'package:tiltIndicatorAfter':
#> 
#>     profile_emissions, profile_emissions_upstream, profile_sector,
#>     profile_sector_upstream

use_workflow()
#> Error: Could not find template 'profile.Rmd' in package 'tiltWorkflows'.
```

*Knit* the workflow file to render an example with toy data, or *Knit with
Parameters* to use your own data.

<img src=https://github.com/2DegreesInvesting/tiltWorkflows/assets/5856545/21464b5a-cd5d-4189-9f92-7978acc13c1a width=150>

Learn more about [using parameters](https://2degreesinvesting.github.io/tiltWorkflows/articles/using-parameters.html).



