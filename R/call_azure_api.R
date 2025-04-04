#' Function to send the information and prompt to GPT via azure
#'
#' This function sends takes care of sending the information and the prompt and is used internally
#'
#' @param body The body of the message, containing both the information and the prompt
#' @return Nothing

call_azure_api <- function(body) {
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
  # cat("URL:", url, "\n")

  # Request to API
  req <- httr2::request(url) |>
    httr2::req_body_json(body) |>
    httr2::req_headers(
      `api-key` = client$api_key,
      `Content-Type` = "application/json"
    )

  response <- httr2::req_perform(req)

  # Print response for debugging, just activate it with removing the #
  # cat("Response status:", status_code(response), "\n")
  # cat("Response content:", content(response, "text"), "\n")

  # Check if request was successful
  if (httr2::resp_status(response) == 200) {
    return(httr2::resp_body_json(response))
  } else {
    stop("API request failed with status: ", httr2::resp_status(response), "\n", httr2::resp_body_string(response))
  }
}
