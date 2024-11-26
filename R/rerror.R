#Function: rainer::rerror in order to help a student if an error message occurred

rerror = function() {

  #Getting the session of the student
  environment_info = list(
    objects = environment_objects(), #function to get the object names incl. classification
    data_header = header(), #function to get the data incl. first two rows to see the structure
    directory = getwd(), #working directory
    packages = list(loadedNamespaces()), #loaded packages, not all installed
    current_script = try(rstudioapi::getSourceEditorContext()$content), #current script
    errors = geterrmessage() #last error message
  )

  #building the message If necessary, check whether the data, the variables, functions and packages in the code are loaded
  body = list(
    messages = list(
      list(role = "system", content = "You are helping students in an R programming course for beginners
                                      and give feedback on why it is wrong, how to correct it and how to improve in the future."),

      list(role = "user", content = paste("You got the following information on the current state of my work in R: \n",
                                          jsonlite::toJSON(environment_info, auto_unbox = TRUE),
                                          "\n Identify the errors (there might be multiple) and give me feedback of how to correct the issue
                                          in maximum three senctences.
                                          ."))),
    max_tokens = 200
  )

  #formatting the response
  response_json = call_azure_api(body = body) #function to send to GPT incl. response
  content_vector = response_json$choices$message.content #formatting the response

  #printing the response
  print(content_vector)

}

