test_that("run_app delegates to shiny::runApp", {
  called <- FALSE

  testthat::local_mocked_bindings(
    runApp = function(appDir, ...) {
      called <<- TRUE
      expect_s3_class(appDir, "shiny.appobj")
      invisible(list(appDir = appDir, dots = list(...)))
    },
    .package = "shiny"
  )

  out <- run_app(launch.browser = FALSE, port = 1234)
  expect_true(called)
  expect_true(is.list(out))
})
