<!-- NEWS.md is maintained by https://cynkra.github.io/fledge, do not edit -->

# tiltWorkflows 0.0.0.9024 (2023-12-19)

* Polish README and extend Get started (#87).

# tiltWorkflows 0.0.0.9023 (2023-12-19)

* Reexport `rmarkdown::render()` (#88).

# tiltWorkflows 0.0.0.9022 (2023-12-18)

* `cache_dir` is now a parameter (#84). By default it's
`rappdirs::user_cache_dir("tiltWorkflows")`.

# tiltWorkflows 0.0.0.9021 (2023-12-18)

* Allow to run chunks in different order (#78).

# tiltWorkflows 0.0.0.9020 (2023-12-16)

* In all workflows the parameter `chunks` now defaults to `NULL`, which
automatically sets a reasonable number of chunks  (#74).

# tiltWorkflows 0.0.0.9019 (2023-12-15)

* Add installation instructions from
[r-universe](https://2degreesinvesting.r-universe.dev/) and point to
[posit.cloud])(https://posit.cloud/) (@AnneSchoenauer #67).

* Import packages that the user needs to render workflows (#68).

# tiltWorkflows 0.0.0.9018 (2023-12-15)

* In each workflow, each section now has some explanation.

# tiltWorkflows 0.0.0.9017 (2023-12-15)

* Explain indicator and results sections (@Tilmon #65).

# tiltWorkflows 0.0.0.9016 (2023-12-15)

* Document that knitting the workflow runs the code and creates the results
(@Tilmon #59).

# tiltWorkflows 0.0.0.9015 (2023-12-15)

* Show results where readers expect them: Under Results (@Tilmon #60).

# tiltWorkflows 0.0.0.9014 (2023-12-14)

* Remove `read_csv_falling_back_to()` without deprecation (#45). This function was
internal, and the package is still not exposed to users.

# tiltWorkflows 0.0.0.9013 (2023-12-14)

* Default to expecting input/ and output/ in the working directory (#41)

# tiltWorkflows 0.0.0.9012 (2023-12-14)

* New `use_toy_input()` helps users get toy input/ .csv files (#42).

# tiltWorkflows 0.0.0.9011 (2023-12-14)

* `use_workflow()` with no `template` now throws a helpful error message that
makes `workflows()` unnecessary (#39). Thus, `workflow()` becomes internal and
is retired from the public API without deprecation since this package is still
experimental and has no users.

# tiltWorkflows 0.0.0.9010 (2023-12-14)

* The workflow files now output a `github_document` (#30). This makes it easy for
the user to share the output on GitHub.

# tiltWorkflows 0.0.0.9009 (2023-12-13)

* `use_workflow()` now automatically opens the workflow file in interactive
sessions (#21).

# tiltWorkflows 0.0.0.9008 (2023-12-13)

* Workflows are now split by indicator, and run by chunks (#20). The split by
indicator allows the user more granular control over what they want to run. And
the computations by chunk run in parallel and caching intermediate results, so
the process completes faster, saves memory, and allows resuming after
interruptions.

# tiltWorkflows 0.0.0.9007 (2023-12-08)

* Parametrize the workflow tilt-profiles.Rmd (#14). This helps users pass their
own data via a graphical user interface, without changing the code.

# tiltWorkflows 0.0.0.9006 (2023-12-08)

* The workflow "tilt profiles" is now reproducible with toy data (#6).

# tiltWorkflows 0.0.0.9005 (2023-12-08)

* New article: Use parameters (#12).

# tiltWorkflows 0.0.0.9004 (2023-12-07)

* Depend on tiltToyData (#8). This makes toy datasets available to the user
automatically when they call `library(tiltWorkflows)`.

# tiltWorkflows 0.0.0.9003 (2023-12-07)

* Depend on tiltIndicatorAfter (#7). This makes tiltWorkflows more user friendly
since it's the only package that users need to install and use -- everything
else happens behind the hoods.

# tiltWorkflows 0.0.0.9002 (2023-12-07)

* New `use_workflow()` helps users create a workflow file from a template (#5).

# tiltWorkflows 0.0.0.9001 (2023-12-06)

* New article "Get started" (#4 @kalashsinghal).
