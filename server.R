# Shiny Server
function(input, output, session) {
  example_counter_server("home_counter")

  # Demo data for the example modules on the "Other" page. Replace with your
  # own data source, e.g. reactive(readRDS("data/app_data.rds")).
  demo_data <- reactive(mtcars)
  example_plot_server("other_plot", demo_data)
  example_table_server("other_table", demo_data)
}
