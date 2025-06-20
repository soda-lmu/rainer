library(testthat)
library(withr)

test_that("environment_objects correctly identifies object types", {
  local_mocked_bindings(
    .GlobalEnv = new.env(parent = emptyenv()),
    .package = "base"
  )

  # Create different types of objects in global environment
  .GlobalEnv$test_df <- data.frame(a = 1:3, b = letters[1:3])
  .GlobalEnv$test_var <- 42
  .GlobalEnv$test_func <- function(x) x + 1

  # Test the function
  result <- environment_objects()

  # Check that object types are correctly identified
  expect_equal(result[["test_df"]], "dataframe")
  expect_equal(result[["test_var"]], "variable")
  expect_equal(result[["test_func"]], "function")

  # Check that result is a list
  expect_type(result, "list")
})

test_that("header returns correct structure for datasets", {
  local_mocked_bindings(
    .GlobalEnv = new.env(parent = emptyenv()),
    .package = "base"
  )

  .GlobalEnv$df1 <- data.frame(col1 = 1:3, col2 = letters[1:3])
  .GlobalEnv$df2 <- data.frame(name = c("John", "Jane"), age = c(25, 30))

  # Test the function
  result <- header()

  # Check that dataframe column names are correctly identified
  expect_equal(result[["df1"]], c("col1", "col2"))
  expect_equal(result[["df2"]], c("name", "age"))

  # Check format of the result
  expect_type(result, "list")
  expect_named(result, c("df1", "df2"))
})

test_that("header returns appropriate message when no datasets are loaded", {
  local_mocked_bindings(
    .GlobalEnv = new.env(parent = emptyenv()),
    .package = "base"
  )

  # Test the function
  result <- header()

  # Check that appropriate message is returned
  expect_equal(result, "No datasets loaded in the session")
})

test_that("current_script returns NULL when not in RStudio context", {
  # Mock rstudioapi to simulate non-RStudio environment
  local_mocked_bindings(
    getSourceEditorContext = function() {
      stop("Not in RStudio")
    },
    .package = "rstudioapi"
  )

  # Test the function
  result <- current_script()

  # Should return NULL when not in RStudio
  expect_null(result)
})

test_that("environment_info returns correctly structured information", {
  local_mocked_bindings(
    .GlobalEnv = new.env(parent = emptyenv()),
    .package = "base"
  )

  .GlobalEnv$test_df <- data.frame(x = 1:3)

  # Mock current_script to return a known value
  local_mocked_bindings(
    current_script = function() "Sample script content"
  )

  # Test with and without error message
  result_with_error <- environment_info(error = TRUE)
  result_without_error <- environment_info(error = FALSE)

  # Check the structure of the results
  expect_type(result_with_error, "list")
  expect_named(result_with_error, c("last_executed_code", "script", "objects", "datastructure", "packages", "error_message"))

  expect_type(result_without_error, "list")
  expect_named(result_without_error, c("last_executed_code", "script", "objects", "datastructure", "packages"))
  expect_false("error_message" %in% names(result_without_error))

  # Check specific values
  expect_equal(result_with_error$script, "Sample script content")
  expect_equal(result_with_error$objects$test_df, "dataframe")
  expect_equal(result_with_error$datastructure$test_df, "x")
})
