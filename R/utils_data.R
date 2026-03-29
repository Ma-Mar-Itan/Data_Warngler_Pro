#' Read input dataset by extension
#'
#' @param path File path.
#' @param ext Extension without dot.
#' @param header Whether file has header for delimited files.
#' @return Data frame.
#' @keywords internal
read_input_dataset <- function(path, ext, header = TRUE) {
  ext <- tolower(ext)
  if (identical(ext, "csv")) {
    return(readr::read_csv(path, show_col_types = FALSE))
  }

  if (identical(ext, "tsv")) {
    return(readr::read_tsv(path, show_col_types = FALSE))
  }

  if (identical(ext, "parquet")) {
    if (!requireNamespace("arrow", quietly = TRUE)) {
      stop(
        "Parquet support requires the optional 'arrow' package. Install with install.packages('arrow').",
        call. = FALSE
      )
    }
    return(arrow::read_parquet(path))
  }

  stop("Unsupported file extension: ", ext, call. = FALSE)
}

#' Write parquet with optional dependency guard
#' @param data Data frame.
#' @param path Output path.
#' @keywords internal
write_parquet_optional <- function(data, path) {
  if (!requireNamespace("arrow", quietly = TRUE)) {
    stop(
      "Parquet export requires the optional 'arrow' package. Install with install.packages('arrow').",
      call. = FALSE
    )
  }
  arrow::write_parquet(data, path)
  invisible(path)
}
