#Function: rainer::explain in order to explain the last error message occurred

explain = function() {
  #API-Key
  api_key = "API-KEY"

  #URL
  base_url = "https://api.openai.com/v1"

  #seed for reproducibility
  seed = 100

  #How does the student's working session look like?
  environment_info = list(
    Environment_Objects = ls(envir = .GlobalEnv),
    packages = devtools::session_info(),
    current_script = try(rstudioapi::getActiveDocumentContext()$contents),
    errors = geterrmessage()
  )

  #building the message itself
  body = list(
    #model to use
    model = "gpt-4o-mini",
    #What should the message contain?
    messages = list(
    list(role = "system", content = "You are helping students in an university level R programming course for beginners."),
    list(role = "user", content = paste("You got the following information on the current state of their work in R: \n", environment_info,
                                        "\n Identify the error and give a concise feedback of how to correct the issue.")))
  )

  #API-request itself
  req = httr::POST(
    url = paste0(base_url, "/chat/completions"),
    httr::add_headers(Authorization = paste("Bearer", api_key)),
    httr::content_type_json(),
    body = jsonlite::toJSON(body, auto_unbox = TRUE)
  )

  #response
  res = httr::content(req)

  #error with non-response
  if (!is.null(res$error)) {
    stop("Error from API: ", res$error$message)
  }

  #display the response
  answer = res$choices[[1]]$message$content
  cat("ChatGPT Antwort: \n", answer, "\n")

}

