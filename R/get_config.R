#' Configuration function
#'
#' This function loads the configuration variables into system variables
#' @param setting What variable to define, i.e. rainer_dataprot, rainer_logging, rainer_token or rainer_language
#'
#' @return Nothing
#'

.get_config <- function(setting) {
  file_path <- file.path(tools::R_user_dir("rainer", which = "data"), setting)

  if (!file.exists(file_path)) {
    warning(sprintf("Configuration file '%s' does not exist.", setting))
    stop(sprintf("Missing configuration for setting '%s'", setting))
  }

  do.call(Sys.setenv, stats::setNames(list(readLines(file_path)), setting))

  if(setting == "rainer_token") {
    token <- Sys.getenv("rainer_token")

    if(github_token_validation(token)){
      cat("Your token is still valid. \n")
    } else {
      cat("Your token is not valid. Maybe, it has expired. Please provide a new token.")

      if (interactive()) {
        cat("Please provide a new token.\n")
        github_token()
      } else {
        warning("Invalid token, and session is non-interactive. Skipping token prompt.")
      }
    }
  }
}
