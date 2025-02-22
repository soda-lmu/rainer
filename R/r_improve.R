#' Function to get improvement suggestions
#'
#' Use that function to get improvement suggestions on your current script.
#'
#' @param error Logical. If TRUE, adds the last error message to the output. FALSE per default.
#' @return Response
#' @export

r_improve <- function(error = FALSE) {

  # Getting the session of the student
  environment <- environment_info(error)

  # building the message
  if(Sys.getenv("rainer_language") == "english"){

    body <- list(
      messages = list(
        list(role = "system", content = "You are helping students in an R programming course for beginners."),
        list(role = "user", content = paste("You got the following information on the current state of my work in R: \n",
                                            jsonlite::toJSON(environment, auto_unbox = TRUE),
                                            "\n Give me suggestions how to improve and shorten my script. Respond in ", language))),
      max_tokens = 200
    )
  } else if(Sys.getenv("rainer_language") == "german"){

    body <- list(
      messages = list(
        list(role = "system", content = "Du hilfst Studierenden in einem R Programmierkurs fuer Anfaenger."),
        list(role = "user", content = paste("Du hast die folgenden Informationen ueber meine aktuelle Arbeit in R \n",
                                            jsonlite::toJSON(environment, auto_unbox = TRUE),
                                            "\n Gib mir Empfehlungen, wie ich mein Skript verbessern kann."))),
      max_tokens = 200
    )
  } else {
    language()
    stop("Please start the function r_error() again since no language was saved previously.")
  }

  # formatting the response
  response_json <- call_github_api(body = body)
  content_vector <- response_json$choices[[1]][["message"]][["content"]]

  # printing the response
  cat(content_vector)

  if (Sys.getenv("rainer_logging") == TRUE) {
    log_post(name = "r_improve", error = error)
  }

}

