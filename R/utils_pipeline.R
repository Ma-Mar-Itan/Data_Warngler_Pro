#' Apply wrangling pipeline operation
#'
#' @param data Input data frame.
#' @param operation Operation label from UI.
#' @return Data frame.
#' @export
apply_pipeline <- function(data, operation = "None") {
  if (!is.data.frame(data)) {
    stop("`data` must be a data.frame.", call. = FALSE)
  }

  operation <- operation %||% "None"

  switch(
    operation,
    "None" = data,
    "Filter complete rows" = stats::na.omit(data),
    "Keep numeric only" = dplyr::select(data, dplyr::where(is.numeric)),
    stop("Unknown pipeline operation: ", operation, call. = FALSE)
  )
}

`%||%` <- function(x, y) {
  if (is.null(x)) y else x
}
