#function for the interaction with GPT
call_openai_api = function(client, body) {
  #defining the url
  url = paste0(client$azure_endpoint, "/openai/deployments/", client$deployment_name, "/chat/completions?api-version=", client$api_version)

  #Print URL for debugging
  #cat("URL:", url, "\n")

  #POST request to API
  response = httr::POST(
    url,
    httr::add_headers(
      `api-key` = client$api_key,
      `Content-Type` = "application/json"
    ),
    body = jsonlite::toJSON(body, auto_unbox = TRUE),
    encode = "json"
  )

  #Print response for debugging
  #cat("Response status:", status_code(response), "\n")
  #cat("Response content:", content(response, "text"), "\n")

  #Check if request was successful
  if (status_code(response) == 200) {
    return(jsonlite::fromJSON(content(response, "text", encoding = "UTF-8"), flatten = TRUE))
  } else {
    stop("API request failed with status: ", status_code(response), "\n", content(response, "text", encoding = "UTF-8"))
  }

}
