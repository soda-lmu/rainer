#' Function for saving the preferred language
#'
#' This function saves the preferred language for the response as a system variable.
#'
#' @return Nothing
#'

language <- function() {
  cat("The responses can be in German or in English. You later can change the setting with the code rainer:::language. \n")

  response_lan <- utils::askYesNo(msg = "Would you like the responses to be in English? If not, the responses will be in German", default = TRUE)

  if(response_lan) {

    .set_config(setting = "rainer_language", content = "english")

    cat("RAINER will respond in english. \n")

    invisible(TRUE)
  } else {

    .set_config(setting = "rainer_language", content = "german")

    cat("RAINER wird in Deutsch antworten. \n")

    invisible(TRUE)
  }
}
