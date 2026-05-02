# Contributing Guidelines

## Branching

- Create feature branches from `dev`.
- Open pull requests into `dev` unless instructed otherwise.

## Local Setup

1. Restore dependencies with `renv::restore()`.
2. Run the app locally with `shiny::runApp()`.

## Code Style

- Keep page UI definitions in `userInterface/`.
- Keep reusable UI/server logic in `modules/`.
- Keep utility functions in `R/`.
- Run lint checks before opening a pull request.

## Pull Request Checklist

- [ ] App runs locally.
- [ ] New/changed code follows the project structure.
- [ ] README/docs updated if behavior changed.
- [ ] Lint checks pass.

