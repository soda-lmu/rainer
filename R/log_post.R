#' Posting the logged response
#'
#' This function posts the information to be logged
#'
#' @param name name of the function which is to be logged
#' @param error whether the error message is supposed to be included or not
#' @import promises
#' @return Nothing
#'

log_post <- function(name, error) {

  # defining the url
  url <- "https://demo.worldwidelab.org/v1/response"

  if (Sys.getenv("sessionId") == ""){
    log_initialize()
  }

  sessionId <- Sys.getenv("sessionId")

  environment_r <- environment_info(error)

  environment_log <- list(script = environment_r$script,
                          error_message = environment_r$error_message)

  # request to API
  httr2::request(url) |>
    httr2::req_body_json(list(sessionId = sessionId, name = name, payload = environment_log)) |>
    httr2::req_perform_promise()

}


