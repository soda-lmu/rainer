#Function: rainer::rerror in order to help a student if an error message occurred

r_error = function(error = TRUE, language = NULL) {

  #Getting the session of the student
  environment = list(
    if(error) {environment_info_error()
  } else {
    environment_info()}
  )

  #defining the language of the prompt
  sys_language = Sys.getenv("LANG")

  if(!is.null(language)) {
    language = tolower(language)
  } else if (grepl("^de", sys_language)){
    language = "german"
  } else {
    language = "english"
  }

  #building the message
  body = list(
    messages = list(
      list(role = "system", content = "You are helping students in an R programming course for beginners and give feedback on why it is wrong, how to correct it and how to improve in the future."),

      list(role = "user", content = paste("You got the following information on the current state of my work in R:",
                                          jsonlite::toJSON(environment, auto_unbox = TRUE),
                                          "Analyze the information I provided step by step and afterwards give feedback on how to correct the issue in maximum three senctences.",
                                          "Answer me in ", language))),
    max_tokens = 200
  )

  #formatting the response
  response_json = call_azure_api(body = body) #function to send to GPT incl. response
  content_vector = response_json$choices$message.content #formatting the response

  #printing the response
  print(content_vector)

}

