#Function: rainer::rerror in order to help a student if an error message occured
rerror = function() {
  #Getting the session of the student
  environment_info = list(
    objects = Environment_Objects(),
    data_header = header(),
    directory = getwd(),
    packages = list(loadedNamespaces()),
    current_script = try(rstudioapi::getActiveDocumentContext()$contents),
    errors = geterrmessage()
  )

  #Azure OpenAI Client
  client = list(
    azure_endpoint = "https://soda-oai-easyaccess-prod-swedencentral.openai.azure.com",
    api_key = "39257ccf9f724bdc81add8c7ca1e155b",
    deployment_name = "gpt-35-turbo",
    api_version = "2024-08-01-preview"
  )

  #building the message
  body = list(
    messages = list(
      list(role = "system", content = "You are helping students in an university level R programming course for beginners
                                      and give feedback based on the Hattie & Timperley (2007) feedback framework."),

      list(role = "user", content = paste("You got the following information on the current state of my work in R: \n",
                                          jsonlite::toJSON(environment_info, auto_unbox = TRUE),
                                          "\n Identify the errors (there might be multiple) and give me feedback of how to correct the issue as consise as possible.
                                          Check especially whether the data, the variables, functions and packages in the code are loaded."))),
    max_tokens = 250
  )

  #formatting the response
  response_json = call_openai_api(client = client, body = body)
  content_vector = response_json$choices$message.content

  #printing the response
  print(content_vector)

}

