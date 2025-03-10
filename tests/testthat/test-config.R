library(testthat)
library(withr)

test_that(".set_config correctly sets environment variables and creates files", {
  # Use local_envvar to temporarily modify environment variables
  # making sure that dataprot and token are not set
  withr::local_envvar(
    c(
      rainer_dataprot = NA,
      rainer_token = NA
    )
  )
  temp_dir <- withr::local_tempdir()

  # Mock R_user_dir to use our temporary directory
  local_mocked_bindings(
    R_user_dir = function(...) temp_dir,
    .package = "tools"
  )

  # Test data protection setting
  .set_config("rainer_dataprot", "TRUE")
  expect_equal(Sys.getenv("rainer_dataprot"), "TRUE")
  expect_true(file.exists(file.path(temp_dir, "rainer_dataprot")))
  expect_equal(readLines(file.path(temp_dir, "rainer_dataprot")), "TRUE")

  # Test token setting with special characters
  token <- "abc123_special!@#"
  .set_config("rainer_token", token)
  expect_equal(Sys.getenv("rainer_token"), token)
  expect_true(file.exists(file.path(temp_dir, "rainer_token")))
  expect_equal(readLines(file.path(temp_dir, "rainer_token")), token)
})

test_that(".set_config handles directory creation properly", {
  temp_dir <- file.path(withr::local_tempdir(), "nested", "path")
  local_mocked_bindings(
    R_user_dir = function(...) temp_dir,
    .package = "tools"
  )

  # Should create nested directories without error
  expect_no_error(.set_config("test_setting", "test_content"))
  expect_true(dir.exists(temp_dir))
  expect_true(file.exists(file.path(temp_dir, "test_setting")))
})
