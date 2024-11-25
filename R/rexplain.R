#Function: rainer::rexplain to help the student if no error message occurred, but the results are not as intended
rexplain = function(question = "The code does not result I intended. Please explain what the problem might be") { #default question

  #Getting the session of the student
  environment_info = list(
    objects = Environment_Objects(), #function to get the object names incl. classification
    data_header = header(), #function to get the data incl. first two rows to see the structure
    directory = getwd(), #working directory
    packages = list(loadedNamespaces()), #loaded packages, not all installed
    current_script = try(rstudioapi::getSourceEditorContext()$contents) #current script
  ) #error messages left out since GPT would otherwise just focus on that

  #building the message
  body = list(
    messages = list(
      list(role = "system", content = "You are helping students in an university level R programming course for beginners
                                      and give feedback based on the Hattie & Timperley (2007) feedback framework."),
      list(role = "user", content = paste("You got the following information on the current state of my work in R: \n",
                                          jsonlite::toJSON(environment_info, auto_unbox = TRUE), question))),
    max_tokens = 250
  )

  #formatting the response
  response_json = call_openai_api(body = body) #function to send to GPT incl. response
  content_vector = response_json$choices$message.content #formatting the response

  #printing the response
  print(content_vector)

}

