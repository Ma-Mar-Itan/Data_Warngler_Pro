#' Internal application configuration
#'
#' @keywords internal
app_config <- function() {
  list(
    app_name = "Data Wrangler Pro",
    max_upload_mb = 100,
    supported_input = c("csv", "tsv", "parquet"),
    default_storage = app_storage_dir()
  )
}

#' Package-safe storage directory
#'
#' @param create Whether to create directory when missing.
#' @return Character path to writable directory.
#' @keywords internal
app_storage_dir <- function(create = TRUE) {
  dir <- fs::path_expand("~/.mypackage")
  if (create) {
    ok <- tryCatch({
      fs::dir_create(dir)
      TRUE
    }, error = function(e) FALSE)

    if (!ok) {
      stop("Unable to create storage directory: ", dir, call. = FALSE)
    }
  }
  dir
}
