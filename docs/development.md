# Development Guide

## Structure

- Keep global setup in `global.R`.
- Keep tab/page layouts in `userInterface/`.
- Keep reusable module pairs in `modules/`.
- Keep utility helpers in `R/`.

## Workflow

1. Create a branch from `dev`.
2. Add UI or server changes in the appropriate folders.
3. Run the app locally.
4. Run linting before opening a PR.

## Linting

Run in R:

```r
lintr::lint_dir()
```
