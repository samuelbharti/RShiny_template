# Load the app's helper code (utilities, modules, page UI) so that unit and
# server tests can reference it directly. `chdir = TRUE` runs global.R from the
# app root so its relative source() paths resolve.
source(test_path("..", "..", "global.R"), chdir = TRUE)

# global.R activates thematic when installed, but thematic's "auto" theming
# needs a real app session and breaks renderPlot under shiny::testServer.
# Deactivate it for tests; the shinytest2 smoke test still exercises it in a
# real app process.
if (requireNamespace("thematic", quietly = TRUE)) {
  thematic::thematic_off()
}
