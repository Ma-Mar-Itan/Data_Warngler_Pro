test_that("module UI constructors return tags", {
  expect_s3_class(mod_uploader_ui("x"), "shiny.tag.list")
  expect_s3_class(mod_wrangler_ui("x"), "shiny.tag.list")
  expect_s3_class(mod_code_panel_ui("x"), "shiny.tag.list")
  expect_s3_class(mod_exporter_ui("x"), "shiny.tag.list")
})

test_that("wrangler module server returns reactive", {
  shiny::testServer(mod_wrangler_server, args = list(data_r = shiny::reactive(mtcars)), {
    session$setInputs(operation = "Keep numeric only")
    r <- session$returned()
    out <- r()
    expect_true(is.data.frame(out))
    expect_true(ncol(out) > 0)
  })
})
