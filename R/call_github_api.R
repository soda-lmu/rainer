#' Function to send the information and prompt to GPT via github
#'
#' This function sends takes care of sending the information and the prompt and is used internally
#'
#' @param body The body of the message, containing both the information and the prompt
#' @return Nothing

call_github_api <- function(body) {
  # GitHub Client
  client <- list(
    endpoint = "https://models.inference.ai.azure.com",
    model_name = "gpt-4o"
  )

  # defining the url
  url <- paste0(client$endpoint, "/openai/deployments/", client$model_name, "/chat/completions?api-version=2024-08-01-preview")

  # Print URL for debugging, just activate it with removing the #
  # cat("URL:", url, "\n")

  if (Sys.getenv("rainer_token") == "") {
    github_token()

    token <- Sys.getenv("rainer_token")
  } else {
    token <- Sys.getenv("rainer_token")
  }

  # request to API
  req <- httr2::request(url) |>
    httr2::req_body_json(body) |>
    httr2::req_headers(
      `api-key` = token,
      `Content-Type` = "application/json",
      `x-ms-model-mesh-model-name` = client$model_name
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
