#' Initializing logging settion
#'
#' This function initializes the logging session if consent to logging is given and saves the session-id
#'
#' @import promises
#' @return Nothing
#'

log_initialize <- function() {
  # defining the url
  rainer_wwl_endpoint <- "https://rainer-logging.soda-lab.org/"

  url <- paste0(rainer_wwl_endpoint, "/v1/session")

  # request to API
  response_promise <- httr2::request(url) |>
    httr2::req_body_json(list(studyId = "testing")) |>
    httr2::req_perform_promise()

  response_promise %...>%
    (\(resp) {
      json_data <- httr2::resp_body_json(resp)
      sessionId <- json_data$sessionId
      Sys.setenv("rainer_wwl_sessionId" = sessionId)
    })() %...!%
    (\(err) message("Error: ", err$message))
}
