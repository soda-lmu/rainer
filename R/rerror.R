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
                                          "\n Question Give feedback on how to correct the issue in maximum three sentences.
                                          Thought 1 I first have to analyze the information provided and screen briefly the script, the loaded
                                          data including the structure, the loaded packages, and the variables and functions created.
                                          Action 1 Analyze information.
                                          Thought 2 An error message is mentioned. I should check the error message and identify, based on the
                                          prior analysis, the relevant parts of the information provided which are linked to the error message.
                                          Action 2 Check error message.
                                          Thought 3 After the analysis of the information and error message, I am now able to give feedback on
                                          how to correct the issue in maximum three senctences.
                                          Action 3 End [Explain]
                                          Question Give feedback on how to correct the issue in maximum three sentences
                                          ."))),
    max_tokens = 200
  )

  #formatting the response
  response_json = call_azure_api(body = body) #function to send to GPT incl. response
  content_vector = response_json$choices$message.content #formatting the response

  #printing the response
  print(content_vector)

}

