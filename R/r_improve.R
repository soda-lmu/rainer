#' Function to get improvement suggestions
#'
#' This function sends the environment information to GPT and provides suggestions on how to improve the script.
#'
#' @param error Logical. If TRUE, adds the last error message to the output.
#' @param language The language the response is supposed to be in. Default is the system language.
#' @return Response
#' @import jsonlite
#' @export

r_improve <- function(error = FALSE, language = NULL) {

  # Getting the session of the student
  environment <- environment_info(error)

  # defining the language of the prompt
  if(!is.null(language)) {
    language <- tolower(language)
  } else {
    language <- get_language()
  }

  # building the message
  body <- list(
    messages = list(
      list(role = "system", content = "You are helping students in an R programming course for beginners."),
      list(role = "user", content = paste("You got the following information on the current state of my work in R: \n",
                                          jsonlite::toJSON(environment, auto_unbox = TRUE),
                                          "\n Give me suggestions how to improve and shorten my script. Respond in ", language))),
    max_tokens = 200
  )

  # formatting the response
  response_json <- call_gpt_api(body = body)
  content_vector <- response_json$choices$message.content

  # printing the response
  cat(content_vector)

}

