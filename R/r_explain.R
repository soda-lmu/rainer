#Function: rainer::rexplain to help the student if no error message occurred, but the results are not as intended

r_explain = function(question = "The code does not yield the result I intended. Please explain what the problem might be.", error = FALSE, language = NULL) { #default question

  #Getting the session of the student
  environment = list(
    if(error) {environment_info_error()
    } else {
      environment_info()}
  )

  #defining the language of the prompt
  sys_language = Sys.getenv("LANG")

  language = if(!is.null(language)) {
    tolower(language)
  } else if (grepl("^de", sys_language)){
    "german"
  } else {
    "english"
  }

  #building the message
  body = list(
    messages = list(
      list(role = "system", content = "You are helping students in an R programming course for beginners
                                      and give feedback on what is wrong, how to correct it and how to improve in the future."),
      list(role = "user", content = paste("You got the following information on the current state of my work in R: \n",
                                          jsonlite::toJSON(environment, auto_unbox = TRUE),
                                          "Answer my following question in maximum 3 sentences: \n",
                                          question, "Answer in ", language))),
    max_tokens = 200
  )

  #formatting the response
  response_json = call_azure_api(body = body) #function to send to GPT incl. response
  content_vector = response_json$choices$message.content #formatting the response

  #printing the response
  print(content_vector)

}

