#' EDA panel UI
#' @param id Module id.
#' @return UI elements.
#' @keywords internal
mod_eda_panel_ui <- function(id) {
  ns <- shiny::NS(id)
  shiny::plotOutput(ns("hist"))
}

#' EDA panel server
#' @param id Module id.
#' @param data_r Reactive dataset.
#' @keywords internal
mod_eda_panel_server <- function(id, data_r) {
  shiny::moduleServer(id, function(input, output, session) {
    output$hist <- shiny::renderPlot({
      dat <- shiny::req(data_r())
      num_cols <- names(dat)[vapply(dat, is.numeric, logical(1))]
      shiny::validate(shiny::need(length(num_cols) > 0, "No numeric columns for histogram"))
      ggplot2::ggplot(dat, ggplot2::aes(x = rlang::.data[[num_cols[[1]]]])) +
        ggplot2::geom_histogram(fill = "#2c3e50", bins = 30)
    })
  })
}
