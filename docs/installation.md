# Installation

## Recommended: renv

1. Install `renv` if needed.
2. Run `renv::restore()` in the project root.
3. Start the app with `shiny::runApp()`.

## Manual setup

Install required packages listed in README and run `shiny::runApp()`.

## Docker

Build:

```bash
docker build -t my-shiny-app .
```

Run:

```bash
docker run --rm -p 3838:3838 my-shiny-app
```
