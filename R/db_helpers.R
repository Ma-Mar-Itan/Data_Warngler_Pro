#' Resolve SQLite path for app storage
#'
#' @param filename Database filename.
#' @return Fully qualified sqlite path.
#' @keywords internal
app_sqlite_path <- function(filename = "app.sqlite") {
  if (!nzchar(filename)) {
    stop("`filename` must be non-empty.", call. = FALSE)
  }
  fs::path(app_storage_dir(create = TRUE), filename)
}
