#Function: rainer::rimprove in order to improve the script written

r_improve = function(error = FALSE) {

  #Getting the session of the student
  environment = list(
    if(error) {environment_info_error()
    } else {
      environment_info()}
  )

  #building the message
  body = list(
    messages = list(
      list(role = "system", content = "You are helping students in an R programming course for beginners."),
      list(role = "user", content = paste("You got the following information on the current state of my work in R: \n",
                                          jsonlite::toJSON(environment_info, auto_unbox = TRUE),
                                          "\n Give me suggestions how to improve and shorten my script."))),
    max_tokens = 200
  )

  #formatting the response
  response_json = call_azure_api(body = body) #function to send to GPT incl. response
  content_vector = response_json$choices$message.content #formatting the response

  #printing the response
  print(content_vector)

}

