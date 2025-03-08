#' Posting the logged response
#'
#' This function posts the information to be logged
#'
#' @param name name of the function which is to be logged
#' @param content content to be logged
#' @import promises
#' @return Nothing
#'

log_post <- function(name, content) {

  if(Sys.getenv("rainer_logging") == TRUE) {

  # defining the url
  url <- "https://demo.worldwidelab.org/v1/response"

  if (Sys.getenv("sessionId") == ""){
    log_initialize()
    }

  sessionId <- Sys.getenv("rainer_wwl_sessionId")

  # request to API
  invisible(
    tryCatch(
      httr2::request(url) |>
        httr2::req_body_json(list(sessionId = sessionId, name = name, payload = content)) |>
        httr2::req_perform_promise()
    )
  )

  }

}


