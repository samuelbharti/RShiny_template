# Project Structure

```txt
.
├── app.R
├── global.R
├── ui.R
├── server.R
├── R/
├── modules/
├── userInterface/
├── data/
├── dev/
├── docs/
└── www/
```

## Notes

- `app.R` is the app entry point for `shiny::runApp()`.
- `global.R` loads dependencies and sources components.
- `R/load_components.R` automatically sources modules and page UI files.
- `www/` stores static assets such as CSS, JavaScript, and images.
