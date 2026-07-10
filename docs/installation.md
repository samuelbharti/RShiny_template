# Installation

## Manual setup

Install the packages used by the app and start it:

```r
install.packages(c("shiny", "bslib", "brand.yml"))
shiny::runApp()
```

Optionally install `thematic` so plots follow the app theme (`global.R` picks it up automatically when present).

## renv (recommended for reproducibility)

The template ships without a lockfile. Initialize `renv` once for your project:

```sh
Rscript dev/init-renv.R
```

This installs the packages used by the app and writes `renv.lock`. Review the lockfile before committing. From then on, use `renv::restore()` to restore the project library.

## Docker

Build:

```bash
docker build -t my-shiny-app .
```

Run:

```bash
docker run --rm -p 3838:3838 my-shiny-app
```

The Dockerfile restores the project library from `renv.lock` when present. Create one with `Rscript dev/init-renv.R` before building so the image installs your app's packages; without a lockfile the image relies on the packages bundled with the base image.
