library(testthat)
library(withr)

test_that(".set_config correctly sets environment variables and creates files", {
  # Use local_envvar to temporarily modify environment variables
  # making sure that dataprot and token are not set
  local_envvar(
    c(
      rainer_dataprot = NA,
      rainer_token = NA
    )
  )
  temp_dir <- local_tempdir()

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
  temp_dir <- file.path(local_tempdir(), "nested", "path")
  local_mocked_bindings(
    R_user_dir = function(...) temp_dir,
    .package = "tools"
  )

  # Should create nested directories without error
  expect_no_error(.set_config("test_setting", "test_content"))
  expect_true(dir.exists(temp_dir))
  expect_true(file.exists(file.path(temp_dir, "test_setting")))
})

test_that(".get_config correctly reads files and sets environment variables", {
  # Use local_envvar to temporarily modify environment variables
  local_envvar(
    c(
      rainer_dataprot = NA,
      rainer_token = NA
    )
  )
  temp_dir <- local_tempdir()

  # Mock R_user_dir to use our temporary directory
  local_mocked_bindings(
    R_user_dir = function(...) temp_dir,
    .package = "tools"
  )

  # Create configuration files
  dataprot_path <- file.path(temp_dir, "rainer_dataprot")
  token_path <- file.path(temp_dir, "rainer_token")

  dir.create(temp_dir, recursive = TRUE, showWarnings = FALSE)
  writeLines("TRUE", dataprot_path)
  writeLines("secret_token_123", token_path)

  # Test reading data protection setting
  .get_config("rainer_dataprot")
  expect_equal(Sys.getenv("rainer_dataprot"), "TRUE")

  # Test reading token
  .get_config("rainer_token")
  expect_equal(Sys.getenv("rainer_token"), "secret_token_123")
})

test_that(".get_config errors when file doesn't exist", {
  temp_dir <- local_tempdir()

  # Mock R_user_dir to use our temporary directory
  local_mocked_bindings(
    R_user_dir = function(...) temp_dir,
    .package = "tools"
  )

  # Try to get a non-existent config
  expect_warning(expect_error(.get_config("nonexistent_setting")))
})

test_that(".set_config and .get_config work together in sequence", {
  # Use local_envvar to temporarily modify environment variables
  local_envvar(
    c(
      rainer_test_setting = NA
    )
  )
  temp_dir <- local_tempdir()

  # Mock R_user_dir to use our temporary directory
  local_mocked_bindings(
    R_user_dir = function(...) temp_dir,
    .package = "tools"
  )

  # First set the config
  test_value <- "test_value_123"
  .set_config("rainer_test_setting", test_value)
  expect_equal(Sys.getenv("rainer_test_setting"), test_value)

  # Clear the environment variable to simulate a new R session
  local_envvar(c(rainer_test_setting = NA))
  expect_equal(Sys.getenv("rainer_test_setting"), "")

  # Now retrieve the config
  .get_config("rainer_test_setting")

  # Check that the environment variable was set from the file
  expect_equal(Sys.getenv("rainer_test_setting"), test_value)
})
