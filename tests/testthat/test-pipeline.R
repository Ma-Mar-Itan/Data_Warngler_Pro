test_that("apply_pipeline validates input", {
  expect_error(apply_pipeline(1:3), "data.frame")
})

test_that("apply_pipeline operations work", {
  dat <- data.frame(a = c(1, 2, NA), b = c("x", "y", "z"), c = c(4, 5, 6))

  expect_equal(nrow(apply_pipeline(dat, "Filter complete rows")), 2)
  num <- apply_pipeline(dat, "Keep numeric only")
  expect_named(num, c("a", "c"))
  expect_equal(apply_pipeline(dat, "None"), dat)
})
