# Tests for the template scaffolding engine (dev/use_template.R + template.yml).
#
# Guards against the manifest's literal `from:` anchors drifting out of sync
# with the files they target (e.g. after a version bump): a stale anchor makes
# use_template() warn, which fails this test.

test_that("use_template applies the manifest end-to-end", {
  skip_if_not_installed("yaml")

  root <- "../.."
  tmp <- tempfile("use-template-")
  dir.create(tmp)
  on.exit(unlink(tmp, recursive = TRUE), add = TRUE)

  files <- c(
    "template.yml",
    "README.md",
    "ui.R",
    "_brand.yml",
    "R/utils.R",
    "CITATION.cff",
    "CITATION.md",
    "CHANGELOG.md",
    "dev/use_template.R"
  )
  for (f in files) {
    dest <- file.path(tmp, f)
    dir.create(dirname(dest), recursive = TRUE, showWarnings = FALSE)
    file.copy(file.path(root, f), dest)
  }

  source(file.path(tmp, "dev", "use_template.R"), local = TRUE)

  expect_no_warning(
    suppressMessages(use_template(
      values = list(
        project_name = "Demo App",
        description = "A demo description.",
        author = "Jane Doe",
        version = "0.5.0"
      ),
      root = tmp,
      interactive = FALSE
    ))
  )

  readme <- readLines(file.path(tmp, "README.md"), warn = FALSE)
  expect_true(any(readme == "# Demo App"))
  expect_true(any(readme == "A demo description."))
  expect_true(any(readme == "Maintained by Jane Doe."))
  expect_true(any(readme == "Current app version: 0.5.0"))
  expect_false(any(grepl("template:strip", readme, fixed = TRUE)))

  utils_r <- readLines(file.path(tmp, "R", "utils.R"), warn = FALSE)
  expect_true(any(grepl('"0.5.0"', utils_r, fixed = TRUE)))

  ui_r <- readLines(file.path(tmp, "ui.R"), warn = FALSE)
  expect_true(any(grepl('title = "Demo App"', ui_r, fixed = TRUE)))

  brand <- readLines(file.path(tmp, "_brand.yml"), warn = FALSE)
  expect_true(any(grepl("name: Demo App", brand, fixed = TRUE)))

  expect_false(file.exists(file.path(tmp, "CITATION.cff")))
  expect_false(file.exists(file.path(tmp, "CITATION.md")))

  changelog <- readLines(file.path(tmp, "CHANGELOG.md"), warn = FALSE)
  expect_true(any(changelog == "- Initial project setup."))
  expect_false(any(grepl("2.2.0", changelog, fixed = TRUE)))

  expect_false(file.exists(file.path(tmp, "template.yml")))
  expect_false(file.exists(file.path(tmp, "dev", "use_template.R")))
})
