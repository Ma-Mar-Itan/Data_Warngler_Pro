#' Uploader module UI
#'
#' @param id Module id.
#' @return UI elements.
#' @keywords internal
mod_uploader_ui <- function(id) {
  ns <- shiny::NS(id)
  shiny::tagList(
    shiny::fileInput(ns("file"), "Upload dataset", accept = c(".csv", ".tsv", ".parquet")),
    shiny::checkboxInput(ns("header"), "Header", value = TRUE),
    shiny::helpText("Parquet support is optional and requires the arrow package.")
  )
}

#' Uploader module server
#'
#' @param id Module id.
#' @param cfg App config list.
#' @return Reactive dataset.
#' @keywords internal
mod_uploader_server <- function(id, cfg) {
  shiny::moduleServer(id, function(input, output, session) {
    shiny::reactive({
      req <- shiny::req
      in_file <- req(input$file)
      ext <- tolower(tools::file_ext(in_file$name))

      if (!ext %in% cfg$supported_input) {
        shiny::validate(shiny::need(FALSE, paste("Unsupported file type:", ext)))
      }

      read_input_dataset(in_file$datapath, ext = ext, header = isTRUE(input$header))
    })
  })
}
