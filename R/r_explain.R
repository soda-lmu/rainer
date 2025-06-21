#' Function to explain something based on a individual prompt
#'
#' Use that function to get an explanation in case the output is not what you expected without getting an error message.
#'
#' @param question The individual question/prompt which GPT is supposed to answer.
#' @param error Logical. If TRUE, adds the last error message to the output. FALSE per default.
#' @param interactive_prompt Logical. If TRUE, the popup-window is usable (necessary for the testing environment).
#' @return Response
#' @export

r_explain <- function(question = "The code does not yield the result I intended. Please explain what the problem might be.", # default question
                      error = FALSE,
                      interactive_prompt = TRUE) {

  if (interactive_prompt && interactive() && rstudioapi::isAvailable()) {
    user_input <- rstudioapi::showPrompt(
      title = "What should be explained?",
      message = "Please enter your question for the assistant:",
      default = NULL
    )

    # If user cancels (returns NULL), exit
    if (is.null(user_input)) return(invisible(NULL))

    question <- user_input
  }

  thinks <- paste("RAINER thinks about your question: \n", question)
  cat(thinks)

  # Getting the session of the student
  environment <- environment_info(error)

  # building the message

  if (Sys.getenv("rainer_language") == "english") {
    body <- list(
      messages = list(
        list(role = "system", content = "You are helping students in an R programming course for beginners
                                      and give feedback on what is wrong, how to correct it and how to improve in the future."),
        list(role = "user", content = paste(
          "You got the following information on the current state of my work in R: \n",
          jsonlite::toJSON(environment, auto_unbox = TRUE),
          "Answer my following question in maximum 3 sentences: \n",
          question
        ))
      ),
      max_tokens = 200
    )
  } else if (Sys.getenv("rainer_language") == "german") {
    body <- list(
      messages = list(
        list(role = "system", content = "Du hilfst Studierenden in einem R Programmierkurs fuer Anfaenger und gibst Feedback was falsch sein koennte und wie sie sich verbessern koennen."),
        list(role = "user", content = paste(
          "Du bekommst folgende Informationen ueber meine aktuelle Arbeit in R \n",
          jsonlite::toJSON(environment, auto_unbox = TRUE),
          "Beantworte meine folgende Frage in maximal drei Saetzen: \n",
          question
        ))
      ),
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
    log_post(name = "r_explain", content = body)
  }
}
