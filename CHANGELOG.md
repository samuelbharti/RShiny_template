# Changelog

All notable changes to this project should be documented in this file.

## [Unreleased]

## [2.3.1] - 2026-07-10

- Fixed the test suite when `thematic` is installed: its auto-theming needs a
  real app session and broke `renderPlot` under `shiny::testServer`, so tests
  now deactivate it (the shinytest2 smoke test still covers it in a real app).

## [2.3.0] - 2026-07-10

- Fixed template manifest version anchors that silently stopped matching after
  the v2.2 bump, and made `dev/use_template.R` warn when a substitution anchor
  has no match.
- Wired the `author` template variable into the README ("Maintained by ...").
- Mounted the example plot/table modules on the "Other" page with demo data,
  renamed `modules/test_mod.R` to `modules/example_counter_mod.R`, and added
  tests for the example modules and the scaffolding engine.
- Removed lintr (air is the single style tool) and dead config files
  (`.Rbuildignore`, `.markdownlintignore`); stopped tracking `.Renviron`.
- Fixed the air pre-commit hook: it pointed at the `posit-dev/air` repo (which
  has no pre-commit hooks) with a nonexistent `v0.9.0` tag; it now uses the
  official `posit-dev/air-pre-commit` mirror, pinned to air 0.10.0 in both
  pre-commit and CI.
- Trimmed declared dependencies to what the app actually uses (`shiny`,
  `bslib`, `brand.yml`, optional `thematic`) and reworked the install/renv
  documentation to match (no lockfile ships; `dev/init-renv.R` creates one).
- Reconciled version metadata (CITATION files, CHANGELOG order, LICENSE year).

## [2.2.0] - 2026-06-29

- Added GitHub Actions CI (lint, air format check, tests, markdownlint) and
  pre-commit hooks.
- Added air formatter and lintr configuration.
- Added a test suite (testthat unit tests, `testServer`, and a shinytest2
  smoke test).
- Added brand.yml theming applied through bslib, with optional `thematic`
  plot/table theming.
- Added a template manifest (`template.yml`) and `dev/use_template.R`
  scaffolding engine; published the repo as a GitHub template.
- Added issue and pull request templates and a Contributor Covenant code of
  conduct.
- Fixed the app entry point and ensured `R/` utilities are sourced at startup.

## [2.0.0] - 2026-05-02

- Bumped template version to v2.0 and updated metadata (CITATION, README).

## [0.1.0] - 2026-05-01

- Created base Shiny template structure.
