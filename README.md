
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

- Inspect information about the cache of intermediate results.

``` r
cache_info()
#> # A tibble: 15 × 18
#>    modification_time   path                                                                type         size permissions user    group   device_id hard_links special_device_id    inode block_size blocks flags generation access_time         change_time         birth_time         
#>    <dttm>              <fs::path>                                                          <fct> <fs::bytes> <fs::perms> <chr>   <chr>       <dbl>      <dbl>             <dbl>    <dbl>      <dbl>  <dbl> <int>      <dbl> <dttm>              <dttm>              <dttm>             
#>  1 2023-12-21 15:00:21 /home/rstudio/.cache/tiltWorkflows/profile_emissions/1.rds          file       19.45K rw-r--r--   rstudio rstudio        47          1                 0 11692391       4096     40     0          0 2023-12-21 15:00:21 2023-12-21 15:00:21 2023-12-21 15:00:21
#>  2 2023-12-21 15:00:21 /home/rstudio/.cache/tiltWorkflows/profile_emissions/2.rds          file       14.85K rw-r--r--   rstudio rstudio        47          1                 0 11692392       4096     32     0          0 2023-12-21 15:00:21 2023-12-21 15:00:21 2023-12-21 15:00:21
#>  3 2023-12-21 15:00:22 /home/rstudio/.cache/tiltWorkflows/profile_emissions_upstream/1.rds file       77.48K rw-r--r--   rstudio rstudio        47          1                 0 11692394       4096    160     0          0 2023-12-21 15:00:22 2023-12-21 15:00:22 2023-12-21 15:00:22
#>  4 2023-12-21 15:00:22 /home/rstudio/.cache/tiltWorkflows/profile_emissions_upstream/2.rds file       47.01K rw-r--r--   rstudio rstudio        47          1                 0 11692395       4096     96     0          0 2023-12-21 15:00:22 2023-12-21 15:00:22 2023-12-21 15:00:22
#>  5 2023-12-21 15:00:23 /home/rstudio/.cache/tiltWorkflows/profile_sector/1.rds             file       73.77K rw-r--r--   rstudio rstudio        47          1                 0 11692398       4096    152     0          0 2023-12-21 15:00:23 2023-12-21 15:00:23 2023-12-21 15:00:23
#>  6 2023-12-21 15:00:23 /home/rstudio/.cache/tiltWorkflows/profile_sector/2.rds             file       75.52K rw-r--r--   rstudio rstudio        47          1                 0 11692399       4096    152     0          0 2023-12-21 15:00:23 2023-12-21 15:00:23 2023-12-21 15:00:23
#>  7 2023-12-21 15:00:24 /home/rstudio/.cache/tiltWorkflows/profile_sector_upstream/1.rds    file      158.83K rw-r--r--   rstudio rstudio        47          1                 0 11692401       4096    320     0          0 2023-12-21 15:00:24 2023-12-21 15:00:24 2023-12-21 15:00:24
#>  8 2023-12-21 15:00:24 /home/rstudio/.cache/tiltWorkflows/profile_sector_upstream/2.rds    file      167.79K rw-r--r--   rstudio rstudio        47          1                 0 11692402       4096    336     0          0 2023-12-21 15:00:24 2023-12-21 15:00:24 2023-12-21 15:00:24
#>  9 2023-12-21 15:00:30 /home/rstudio/.cache/tiltWorkflows/profile_emissions/3.rds          file       10.49K rw-r--r--   rstudio rstudio        47          1                 0 11692425       4096     24     0          0 2023-12-21 15:00:30 2023-12-21 15:00:30 2023-12-21 15:00:30
#> 10 2023-12-21 15:01:15 /home/rstudio/.cache/tiltWorkflows/profile_emissions/6.rds          file        4.63K rw-r--r--   rstudio rstudio        47          1                 0 11684571       4096     16     0          0 2023-12-21 15:01:23 2023-12-21 15:01:15 2023-12-21 15:01:15
#> 11 2023-12-21 15:01:16 /home/rstudio/.cache/tiltWorkflows/profile_emissions/12.rds         file        1.75K rw-r--r--   rstudio rstudio        47          1                 0 11684587       4096      8     0          0 2023-12-21 15:01:23 2023-12-21 15:01:16 2023-12-21 15:01:16
#> 12 2023-12-21 15:01:18 /home/rstudio/.cache/tiltWorkflows/profile_emissions/9.rds          file        4.53K rw-r--r--   rstudio rstudio        47          1                 0 11684590       4096     16     0          0 2023-12-21 15:01:23 2023-12-21 15:01:18 2023-12-21 15:01:18
#> 13 2023-12-21 15:01:20 /home/rstudio/.cache/tiltWorkflows/profile_emissions/7.rds          file         4.6K rw-r--r--   rstudio rstudio        47          1                 0 11684591       4096     16     0          0 2023-12-21 15:01:23 2023-12-21 15:01:20 2023-12-21 15:01:20
#> 14 2023-12-21 15:01:21 /home/rstudio/.cache/tiltWorkflows/profile_emissions/11.rds         file        4.53K rw-r--r--   rstudio rstudio        47          1                 0 11684593       4096     16     0          0 2023-12-21 15:01:23 2023-12-21 15:01:21 2023-12-21 15:01:21
#> 15 2023-12-21 15:01:23 /home/rstudio/.cache/tiltWorkflows/profile_emissions/4.rds          file        4.63K rw-r--r--   rstudio rstudio        47          1                 0 11684598       4096     16     0          0 2023-12-21 15:01:23 2023-12-21 15:01:23 2023-12-21 15:01:23
```

- Delete the cache to recompute rather than resume a previous run.

``` r
# DANGER
cache_delete()
#> Warning: Deleting `cache_dir`: 
#> • ~/.cache/tiltWorkflows
```

To learn more see [Get
started](https://2degreesinvesting.github.io/tiltWorkflows/articles/tiltWorkflows.html).
