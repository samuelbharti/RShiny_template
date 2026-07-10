other_page <- fluidPage(
  titlePanel("Other"),
  hr(),
  fluidRow(
    column(
      width = 12,
      p(
        "Use this page for secondary features, documentation, or data downloads."
      ),
      p(
        "The modules below show the pattern for passing a data reactive",
        "into a module (see server.R)."
      )
    )
  ),
  fluidRow(
    column(width = 6, example_plot_ui("other_plot")),
    column(width = 6, example_table_ui("other_table"))
  )
)
