#' Provides an explanation for an error message
#'
#' Use that function to get an explanation for an error message as well as a suggestion how to correct the issue.
#'
#' @param error Logical. If FALSE, excludes the last error message in the query. TRUE per default.
#' @return Response
#' @export

r_error <- function(error = TRUE) {

  # Getting the session of the student
  environment <- environment_info(error)

  # building the message
  if(Sys.getenv("rainer_language") == "english") {

    body <- list(
    messages = list(
      list(role = "system", content = "You are helping students in an R programming course for beginners and give feedback on what is wrong, how to correct the mistake and how to improve in the future. Your response contains three sentences, one for the error identification, one for the explanation why it is wrong and one for the suggestion how to correct it."),

      list(role = "user", content = paste("You got the following information on the current state of my work in R:",
                                          jsonlite::toJSON(environment, auto_unbox = TRUE),
                                          "Analyze the information provided step by step and afterwards give feedback on how to correct the issue mentioned in the error message in maximum three sentences."))),
    max_tokens = 200
  )
  } else if(Sys.getenv("rainer_language") == "german"){

   body <- list(
    messages = list(
      list(role = "system", content = "Du hilfst studierenden in einem R Programmierkurs für Anfänger und gibst Feedback was falsch ist, wie es verbessert werden kann und wie sich in der Zukunft verbessert werden kann. Die Antwort besteht aus drei Sätzen, einer für die Identifikation des Fehlers, einer für die Erklärung wieso es falsch ist und einer für die Empfehlung für die Verbesserung."),

      list(role = "user", content = paste("Du hast die folgenden Informationen über mein R environment:",
                                          jsonlite::toJSON(environment, auto_unbox = TRUE),
                                          "Analysier the informationen eine nach der anderen und anschließend gib mir Feedback wie ich den Fehler beheben kann, der in der Fehlermeldung auftaucht in maximal drei Sätzen."))),
    max_tokens = 200
    )
  } else {
    language()

    return("Please start the function r_error() again since no language was saved previously.")
  }

  # formatting the response
  response_json <- call_azure_api(body = body)
  content_vector <- response_json$choices$message.content

  # printing the response
  cat(content_vector)

}

