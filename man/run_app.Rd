\name{run_app}
\alias{run_app}
\title{Run the Data Wrangler Pro Shiny app}
\usage{
run_app(
  host = "127.0.0.1",
  port = getOption("shiny.port"),
  launch.browser = getOption("shiny.launch.browser", interactive()),
  display.mode = c("normal", "showcase"),
  ...
)
}
\arguments{
\item{host}{Host interface passed to \code{shiny::runApp()}.}
\item{port}{Port passed to \code{shiny::runApp()}.}
\item{launch.browser}{Whether to launch a browser automatically.}
\item{display.mode}{Display mode for Shiny.}
\item{...}{Additional arguments passed to \code{shiny::runApp()}.}
}
\value{Invisibly returns the value from \code{shiny::runApp()}.}
\description{Launches the packaged Shiny application.}
