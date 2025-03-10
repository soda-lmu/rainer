#' Function for validating the GitHub token
#'
#' This function checks whether the provided GitHub token is valid for accessing the LLMs and therefore for using rainer.
#'
#' @return Nothing
#'

github_token_validation <- function(response_token){

  url <- "https://api.github.com/user"

  response <- tryCatch({
    httr2::request(url) |>
      httr2::req_headers(Authorization = paste("token", response_token)) |>
      httr2::req_perform()
  }, error = function(e) {
    return(NULL)
  })

  if (!is.null(response) && httr2::resp_status(response) == 200) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}
