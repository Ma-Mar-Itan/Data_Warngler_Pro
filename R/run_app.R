#' Run the Data Wrangler Pro Shiny app
#'
#' Launches the packaged Shiny application using internal UI and server
#' functions. Static assets are resolved from the installed package.
#'
#' @param host Host interface passed to [shiny::runApp()].
#' @param port Port passed to [shiny::runApp()].
#' @param launch.browser Whether to launch a browser automatically.
#' @param display.mode Display mode for Shiny.
#' @param ... Additional arguments passed to [shiny::runApp()].
#'
#' @return Invisibly returns the value from [shiny::runApp()].
#' @export
run_app <- function(host = "127.0.0.1",
                    port = getOption("shiny.port"),
                    launch.browser = getOption("shiny.launch.browser", interactive()),
                    display.mode = c("normal", "showcase"),
                    ...) {
  display.mode <- match.arg(display.mode)
  app <- shiny::shinyApp(
    ui = app_ui(),
    server = app_server,
    onStart = function() {
      register_app_resources()
    }
  )

  shiny::runApp(
    appDir = app,
    host = host,
    port = port,
    launch.browser = launch.browser,
    display.mode = display.mode,
    ...
  )
}
