#' Wrangler module UI
#' @param id Module id.
#' @return UI elements.
#' @keywords internal
mod_wrangler_ui <- function(id) {
  ns <- shiny::NS(id)
  shiny::tagList(
    shiny::selectInput(ns("operation"), "Operation", choices = c("None", "Filter complete rows", "Keep numeric only")),
    DT::DTOutput(ns("preview"))
  )
}

#' Wrangler module server
#' @param id Module id.
#' @param data_r Reactive dataset.
#' @return Reactive transformed dataset.
#' @keywords internal
mod_wrangler_server <- function(id, data_r) {
  shiny::moduleServer(id, function(input, output, session) {
    transformed <- shiny::reactive({
      dat <- shiny::req(data_r())
      apply_pipeline(dat, input$operation)
    })

    output$preview <- DT::renderDT({
      dat <- shiny::req(transformed())
      DT::datatable(dat, options = list(pageLength = 10, scrollX = TRUE))
    })

    transformed
  })
}
