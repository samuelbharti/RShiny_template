# Tests for the example plot/table modules mounted on the "Other" page.

test_that("example_table_server renders the head of the data reactive", {
  shiny::testServer(
    example_table_server,
    args = list(data_reactive = shiny::reactive(mtcars)),
    {
      expect_no_error(output$preview)
      expect_true(grepl(
        "mpg",
        paste(as.character(output$preview), collapse = ""),
        fixed = TRUE
      ))
    }
  )
})

test_that("example_plot_server renders a plot from the data reactive", {
  shiny::testServer(
    example_plot_server,
    args = list(data_reactive = shiny::reactive(mtcars)),
    {
      expect_no_error(output$plot)
      expect_true(!is.null(output$plot$src))
    }
  )
})
