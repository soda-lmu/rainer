library(testthat)
library(withr)

test_that("r_activate correctly sets error handling when switch=TRUE", {
  # Save the original error option to restore it after the test
  original_error_option <- getOption("error")

  # Call r_activate with TRUE
  r_activate(TRUE)

  # Get the current error option
  current_error_option <- getOption("error")

  # Check that the error option is now a function
  expect_true(is.call(current_error_option))

  # Restore original error option
  options(error = original_error_option)
})

test_that("r_activate correctly removes error handling when switch=FALSE", {
  # First set an error option
  options(error = function() {})

  # Call r_activate with FALSE
  r_activate(FALSE)

  # Get the current error option
  current_error_option <- getOption("error")

  # Check that the error option is NULL
  expect_null(current_error_option)
})

test_that("r_activate returns message for invalid input", {
  # Test with a string
  expect_equal(r_activate("invalid"), "Please write 'TRUE' or 'FALSE' in the function.")

  # Test with a number
  expect_equal(r_activate(42), "Please write 'TRUE' or 'FALSE' in the function.")
})

test_that("r_activate works with explicit TRUE/FALSE values", {
  # Save the original error option
  with_options(
    list(error = NULL),
    {
      # Test with explicit TRUE
      r_activate(switch = TRUE)
      expect_true(is.call(getOption("error")))
    }
  )

  # Test with explicit FALSE
  with_options(
    list(error = function() {}),
    {
      r_activate(switch = FALSE)
      expect_null(getOption("error"))
    }
  )
})
