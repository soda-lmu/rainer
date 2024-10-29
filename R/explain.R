#Function: rainer::explain in order to explain the last error message occured

explain = function() {
  environment_info = list(
    Environment_Objects = ls(envir = .GlobalEnv),
    packages = devtools::session_info(),
    current_script = try(rstudioapi::getActiveDocumentContext()$contents),
    errors = geterrmessage()
  )
  messages = list(
    list(role = "system", content = "You are helping students in an university level R programming course for beginners."),
    list(role = "user", content = paste("You got the following information on the current state of their work in R: \n", environment_info))
  )
  response = XXX(

  )

}

