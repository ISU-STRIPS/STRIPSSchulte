context("Counts")

test_that("Observed abbrev matches a known abbrev", {
  expect_true(all(avian_common_count$abbrev %in% avian_abbrev$abbrev))
})

test_that("Counts are positive", {
  expect_true(all(avian_common_count$count>0))
})
