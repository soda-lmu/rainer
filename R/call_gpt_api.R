#' Function to send the information and prompt to GPT
#'
#' This function sends takes care of sending the information and the prompt and is used internally
#'
#' @param body The body of the message, containing both the information and the prompt
#' @return Nothing
#' @import jsonlite
#' @import httr

call_gpt_api <- function(body) {

  # Azure Client
  client <- list(
    azure_endpoint = "https://soda-oai-easyaccess-prod-swedencentral.openai.azure.com",
    api_key = "39257ccf9f724bdc81add8c7ca1e155b",
    deployment_name = "gpt-35-turbo",
    api_version = "2024-08-01-preview"
  )

  # defining the url
  url <- paste0(client$azure_endpoint, "/openai/deployments/", client$deployment_name, "/chat/completions?api-version=", client$api_version)

  # Print URL for debugging, just activate it with removing the #
  #cat("URL:", url, "\n")

  # POST request to API
  response <- httr::POST(
    url,
    httr::add_headers(
      `api-key` = client$api_key, #client and api_key defined in the functions rerror etc.
      `Content-Type` = "application/json"
    ),
    body = jsonlite::toJSON(body, auto_unbox = TRUE),
    encode = "json"
  )

  # Print response for debugging, just activate it with removing the #
  #cat("Response status:", status_code(response), "\n")
  #cat("Response content:", content(response, "text"), "\n")

  # Check if request was successful
  if (httr::status_code(response) == 200) {
    return(jsonlite::fromJSON(httr::content(response, "text", encoding = "UTF-8"), flatten = TRUE))
  } else {
    stop("API request failed with status: ", httr::status_code(response), "\n", httr::content(response, "text", encoding = "UTF-8"))
  }

}
