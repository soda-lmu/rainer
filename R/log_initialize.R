#' Initializing logging settion
#'
#' This function initializes the logging session if consent to logging is given and saves the session-id
#'
#' @import promises
#' @return Nothing
#'

log_initialize<- function() {

  # defining the url
  url <- "https://demo.worldwidelab.org/v1/session"

  # request to API
  req <- httr2::request(url) |>
    httr2::req_body_json(list(studyId = "example"))

  #response <- httr2::req_perform_promise(req)

  response <- httr2::req_perform_promise(req)

  #cat("Logging response status:", httr2::resp_status(response))

  sessionId <- httr2::resp_body_json(response)$sessionId

  Sys.setenv("sessionId" = sessionId)

}


# # defining the url
# url <- "https://demo.worldwidelab.org/v1/session"
#
# # request to API
# response_promise <- httr2::request(url) |>
#   httr2::req_body_json(list(studyId = "example")) |>
#   httr2::req_perform_promise()
#
# response_promise$then(function(response) {
#   response_json <- resp_body_json(response)
#   sessionId <<- response_json$sessionId
# })
