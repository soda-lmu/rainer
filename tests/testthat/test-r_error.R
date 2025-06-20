library(testthat)
library(withr)

test_that("r_error correctly processes English language requests", {
  # Setup mocks
  mock_env_info <- list(script = "test.R", objects = list(), datastructure = NULL, error_message = "Error: test error")
  mock_api_response <- list(
    choices = list(
      list(message = list(content = "This is a test response for English"))
    )
  )

  # Use local_envvar to set language
  local_envvar(rainer_language = "english")

  # Mock the required functions
  body_received <- NULL

  local_mocked_bindings(
    environment_info = function(error) mock_env_info,
    call_github_api = function(body) {
      body_received <<- body
      mock_api_response
    },
    log_post = function(name, content) NULL
  )

  # Capture the output to verify
  output <- capture_output(r_error())

  # Verify the output
  expect_match(output, "This is a test response for English")
  expect_true(grepl("You are helping students", body_received$messages[[1]]$content))
  expect_false(grepl("Du hilfst Studierenden", body_received$messages[[1]]$content))
})

test_that("r_error handles error=FALSE parameter correctly", {
  # Setup mocks
  mock_env_info <- list(script = "test.R", objects = list(), datastructure = NULL)
  mock_api_response <- list(
    choices = list(
      list(message = list(content = "Response without error message"))
    )
  )

  # Use local_envvar to set language
  local_envvar(rainer_language = "english")

  # Track the parameter passed to environment_info
  error_param_received <- NULL

  # Mock the required functions
  local_mocked_bindings(
    environment_info = function(error) {
      error_param_received <<- error
      mock_env_info
    },
    call_github_api = function(body) mock_api_response,
    log_post = function(name, content) NULL
  )

  # Run function with error=FALSE
  capture_output(r_error(error = FALSE))

  # Verify environment_info was called with error=FALSE
  expect_equal(error_param_received, FALSE)
})

test_that("r_error handles no language setting correctly", {
  # Setup mocks
  mock_env_info <- list(script = "test.R", objects = list(), datastructure = NULL)
  language_called <- FALSE

  # Use local_envvar to clear language
  local_envvar(rainer_language = NA)

  # Mock the required functions
  local_mocked_bindings(
    environment_info = function(error) mock_env_info,
    language = function() {
      language_called <<- TRUE
    },
    call_github_api = function(body) stop("Should not be called"),
    log_post = function(name, content) NULL
  )

  # Expect error and check if language function was called
  expect_error(r_error(), "Please start the function r_error\\(\\) again since no language was saved previously.")
  expect_true(language_called)
})

test_that("r_error correctly builds message body for English", {
  # Setup mocks
  mock_env_info <- list(script = "test.R", objects = list(), datastructure = NULL)

  # Use local_envvar to set language
  local_envvar(rainer_language = "english")

  # Create a version of call_github_api that captures the body
  body_captured <- NULL

  local_mocked_bindings(
    environment_info = function(error) mock_env_info,
    call_github_api = function(body) {
      body_captured <<- body
      list(choices = list(list(message = list(content = "Test"))))
    },
    log_post = function(name, content) NULL
  )

  # Run function
  capture_output(r_error())

  # Verify body structure
  expect_true(is.list(body_captured))
  expect_true("messages" %in% names(body_captured))
  expect_equal(length(body_captured$messages), 2)
  expect_equal(body_captured$messages[[1]]$role, "system")
  expect_match(body_captured$messages[[1]]$content, "You are helping students")
  expect_equal(body_captured$messages[[2]]$role, "user")
  expect_equal(body_captured$max_tokens, 200)
})

test_that("r_error message body matches snapshot for English", {
  # Setup mocks
  mock_env_info <- list(script = "test.R", objects = list(), datastructure = NULL)

  # Use local_envvar to set language
  local_envvar(rainer_language = "english")

  # Create a version of call_github_api that captures the body
  body_captured <- NULL

  local_mocked_bindings(
    environment_info = function(error) mock_env_info,
    call_github_api = function(body) {
      body_captured <<- body
      list(choices = list(list(message = list(content = "Test"))))
    },
    log_post = function(name, content) NULL
  )

  # Run function
  capture_output(r_error())

  # Verify body matches snapshot
  expect_snapshot_value(body_captured, style = "json2")
})

test_that("r_error message body matches snapshot for German", {
  # Setup mocks
  mock_env_info <- list(script = "test.R", objects = list(), datastructure = NULL)

  # Use local_envvar to set language
  local_envvar(rainer_language = "german")

  # Create a version of call_github_api that captures the body
  body_captured <- NULL

  local_mocked_bindings(
    environment_info = function(error) mock_env_info,
    call_github_api = function(body) {
      body_captured <<- body
      list(choices = list(list(message = list(content = "Test"))))
    },
    log_post = function(name, content) NULL
  )

  # Run function
  capture_output(r_error())

  # Verify body matches snapshot
  expect_snapshot_value(body_captured, style = "json2")
})
