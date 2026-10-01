# renv setup

This directory is intentionally lightweight in the template. Run:

~~~r
renv::init()
renv::snapshot()
~~~

Commit the generated `renv.lock`, `.Rprofile`, `renv/activate.R`, and `renv/settings.json`. Do not commit the local package library. For Bioconductor projects, install the required Bioconductor release before snapshotting.
