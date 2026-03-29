#' Code panel UI
#' @param id Module id.
#' @return UI elements.
#' @keywords internal
mod_code_panel_ui <- function(id) {
  ns <- shiny::NS(id)
  shiny::tagList(
    shiny::verbatimTextOutput(ns("code"))
  )
}

#' Code panel server
#' @param id Module id.
#' @param data_r Reactive dataset.
#' @keywords internal
mod_code_panel_server <- function(id, data_r) {
  shiny::moduleServer(id, function(input, output, session) {
    output$code <- shiny::renderText({
      dat <- shiny::req(data_r())
      paste0(
        "# Pipeline summary\n",
        "rows <- ", nrow(dat), "\n",
        "cols <- ", ncol(dat), "\n"
      )
    })
  })
}
