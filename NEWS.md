<!-- NEWS.md is maintained by https://cynkra.github.io/fledge, do not edit -->

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
