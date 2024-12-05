#' Function to explain something based on a individual prompt
#'
#' This function sends the environment information to GPT and provides feedback on that error based on a prompt
#' which can be written individually.
#'
#' @param question The individual question/prompt which GPT is supposed to answer.
#' @param error Logical. If TRUE, adds the last error message to the output.
#' @param language Language the response is supposed to be in. Default is the system language.
#' @return Response
#' @import jsonlite
#' @export

r_explain <- function(question = "The code does not yield the result I intended. Please explain what the problem might be.", error = FALSE, language = NULL) { #default question

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
      list(role = "system", content = "You are helping students in an R programming course for beginners
                                      and give feedback on what is wrong, how to correct it and how to improve in the future."),
      list(role = "user", content = paste("You got the following information on the current state of my work in R: \n",
                                          jsonlite::toJSON(environment, auto_unbox = TRUE),
                                          "Answer my following question in maximum 3 sentences: \n",
                                          question, "Answer in ", language))),
    max_tokens = 200
  )

  # formatting the response
  response_json <- call_gpt_api(body = body)
  content_vector <- response_json$choices$message.content

  #printing the response
  print(content_vector)

}

