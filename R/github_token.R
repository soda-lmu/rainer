#' Function for saving the GitHub token
#'
#' This function saves the GitHub token as a system variable.
#'
#' @return Nothing
#'

github_token <- function(){
  cat("With using RAINER, some information and a prompt are sent to GPT. Free of charge access can be provided by a GitHub token, which can be acquired on https://github.com/settings/tokens \n")
  cat("In order to avoid asking you every time you load RAINER for a token, please provide your GitHub token by pasting it into the console without any symbols like '.")
  cat("You can always change the token you would like to use with the code rainer:::github_token(). \n")
  cat("Please not provide your token in the console:")

  response_token <- readline()

  token_path <- file.path(R.home("etc"), "rainer_token")

  file.create(token_path)

  cat(paste0(response_token, "\n"), file = token_path)

  Sys.setenv(rainer_token = response_token)

  invisible(TRUE)

  cat("Thank you for providing your token. \n")
}
