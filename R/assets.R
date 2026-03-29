#' Resolve an application file inside `inst/app`
#'
#' @param ... Relative file path parts.
#' @return Absolute file path.
#' @keywords internal
app_file <- function(...) {
  path <- system.file("app", ..., package = "mypackage")
  if (!nzchar(path)) {
    stop("Required app resource not found in installed package.", call. = FALSE)
  }
  path
}

#' Register package static resources for Shiny
#'
#' @keywords internal
register_app_resources <- function() {
  www <- app_file("www")
  shiny::addResourcePath("mypackage-www", www)
  invisible(www)
}
