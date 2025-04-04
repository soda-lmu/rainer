#' Function for saving the GitHub token
#'
#' This function saves the GitHub token as a system variable.
#'
#' @return Nothing
#'

github_token <- function() {
  cat("With using RAINER, some information and a prompt are sent to GPT. Free of charge access can be provided by a GitHub token.\n")
  cli::cli_text("You can get the token on Github directly {.url https://github.com/settings/tokens}")
  cat("In order to avoid asking you every time you load RAINER for a token, please provide your GitHub token by pasting it into the console without any symbols like '.")
  cat("You can always change the token you would like to use with the code rainer:::github_token(). \n")
  cat("Please now provide your token in the console:")

  valid_token <- FALSE

  while (!valid_token) {
    response_token <- readline()

    response_token <- sub("\\s+$", "", response_token)

    if (github_token_validation(response_token)) {
      .set_config(setting = "rainer_token", content = response_token)

      valid_token <- TRUE

      cat("Thank you for providing your token. \n")
    } else {
      cat("The token provided is not valid. Please provide a valid token. \n")
    }
  }
}
