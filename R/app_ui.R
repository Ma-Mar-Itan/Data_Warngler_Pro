#' Build application UI
#'
#' @return A Shiny UI object.
#' @export
app_ui <- function() {
  cfg <- app_config()

  shiny::fluidPage(
    theme = app_theme(),
    shiny::tags$head(
      shiny::tags$link(rel = "stylesheet", href = "mypackage-www/app.css"),
      shiny::tags$script(src = "mypackage-www/app.js")
    ),
    shiny::titlePanel(cfg$app_name),
    shiny::sidebarLayout(
      shiny::sidebarPanel(
        mod_uploader_ui("uploader"),
        shiny::hr(),
        mod_exporter_ui("exporter")
      ),
      shiny::mainPanel(
        shiny::tabsetPanel(
          shiny::tabPanel("Wrangler", mod_wrangler_ui("wrangler")),
          shiny::tabPanel("Code", mod_code_panel_ui("code")),
          shiny::tabPanel("EDA", mod_eda_panel_ui("eda"))
        )
      )
    )
  )
}
