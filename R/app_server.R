#' Main application server function
#'
#' @param input Shiny input.
#' @param output Shiny output.
#' @param session Shiny session.
#' @return Server-side reactive side effects.
#' @export
app_server <- function(input, output, session) {
  cfg <- app_config()

  data_r <- mod_uploader_server("uploader", cfg = cfg)
  transformed_r <- mod_wrangler_server("wrangler", data_r = data_r)
  mod_code_panel_server("code", data_r = transformed_r)
  mod_eda_panel_server("eda", data_r = transformed_r)
  mod_exporter_server("exporter", data_r = transformed_r, cfg = cfg)
}
