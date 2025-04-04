library(testthat)
library(withr)

test_that("r_improve correctly processes English language requests", {
  mock_env_info <- list(script = "test.R", objects = list(), datastructure = NULL)
  mock_api_response <- list(
    choices = list(
      list(message = list(content = "Here are improvement suggestions"))
    )
  )

  local_envvar(rainer_language = "english")

  body_received <- NULL

  local_mocked_bindings(
    environment_info = function(error) mock_env_info,
    call_github_api = function(body) {
      body_received <<- body
      mock_api_response
    },
    log_post = function(name, content) NULL
  )

  output <- capture_output(r_improve())
  expect_equal(output, "Here are improvement suggestions")
  expect_true(grepl("You are helping students", body_received$messages[[1]]$content))
  expect_false(grepl("Du hilfst Studierenden", body_received$messages[[1]]$content))
})

test_that("r_improve handles error parameter correctly", {
  mock_env_info <- list(script = "test.R", objects = list(), datastructure = NULL)
  error_param_received <- NULL

  local_envvar(rainer_language = "english")

  local_mocked_bindings(
    environment_info = function(error) {
      error_param_received <<- error
      mock_env_info
    },
    call_github_api = function(body) list(choices = list(list(message = list(content = "Test")))),
    log_post = function(name, content) NULL
  )

  capture_output(r_improve(error = TRUE))
  expect_true(error_param_received)
})

test_that("r_improve handles no language setting correctly", {
  mock_env_info <- list(script = "test.R", objects = list(), datastructure = NULL)
  language_called <- FALSE

  local_envvar(rainer_language = NA)

  local_mocked_bindings(
    environment_info = function(error) mock_env_info,
    language = function() {
      language_called <<- TRUE
    }
  )

  expect_error(r_improve(), "Please start the function r_error\\(\\) again since no language was saved previously.")
  expect_true(language_called)
})

test_that("r_improve correctly builds message body", {
  mock_env_info <- list(script = "test.R", objects = list(), datastructure = NULL)
  body_captured <- NULL

  local_envvar(rainer_language = "english")

  local_mocked_bindings(
    environment_info = function(error) mock_env_info,
    call_github_api = function(body) {
      body_captured <<- body
      list(choices = list(list(message = list(content = "Test"))))
    },
    log_post = function(name, content) NULL
  )

  capture_output(r_improve())

  expect_true(is.list(body_captured))
  expect_equal(length(body_captured$messages), 2)
  expect_equal(body_captured$messages[[1]]$role, "system")
  expect_match(body_captured$messages[[1]]$content, "helping students")
  expect_equal(body_captured$max_tokens, 200)
})
