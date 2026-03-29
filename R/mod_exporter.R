#' Exporter module UI
#' @param id Module id.
#' @return UI elements.
#' @keywords internal
mod_exporter_ui <- function(id) {
  ns <- shiny::NS(id)
  shiny::tagList(
    shiny::downloadButton(ns("download_csv"), "Download CSV"),
    shiny::downloadButton(ns("download_parquet"), "Download Parquet")
  )
}

#' Exporter module server
#' @param id Module id.
#' @param data_r Reactive dataset.
#' @param cfg App config list.
#' @keywords internal
mod_exporter_server <- function(id, data_r, cfg) {
  shiny::moduleServer(id, function(input, output, session) {
    output$download_csv <- shiny::downloadHandler(
      filename = function() {
        paste0("data-wrangler-", Sys.Date(), ".csv")
      },
      content = function(file) {
        dat <- shiny::req(data_r())
        readr::write_csv(dat, file)
      }
    )

    output$download_parquet <- shiny::downloadHandler(
      filename = function() {
        paste0("data-wrangler-", Sys.Date(), ".parquet")
      },
      content = function(file) {
        dat <- shiny::req(data_r())
        write_parquet_optional(dat, file)
      }
    )
  })
}
