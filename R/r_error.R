#' Provides an explanation for an error message
#'
#' This function sends the environment information to GPT and provides feedback on that error
#'
#' @param error Logical. If TRUE, adds the last error message to the output.
#' @param language Language the response is supposed to be in
#' @return Response
#' @import jsonlite
#' @export

r_error <- function(error = TRUE, language = NULL) {

  # Getting the session of the student
  environment <- environment_info(error)

  # defining the language of the prompt if not
  if(!is.null(language)) {
    language <- tolower(language)
  } else {
    language <- get_language()
  }

  # building the message
  body <- list(
    messages = list(
      list(role = "system", content = "You are helping students in an R programming course for beginners and give feedback on why it is wrong, how to correct it and how to improve in the future."),

      list(role = "user", content = paste("You got the following information on the current state of my work in R:",
                                          jsonlite::toJSON(environment, auto_unbox = TRUE),
                                          "Analyze the information I provided step by step and afterwards give feedback on how to correct the issue in maximum three senctences.",
                                          "Answer me in ", language))),
    max_tokens = 200
  )

  # formatting the response
  response_json <- call_gpt_api(body = body)
  content_vector <- response_json$choices$message.content

  # printing the response
  print(content_vector)

}

