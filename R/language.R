#' Function for saving the preferred language
#'
#' This function saves the preferred language for the response as a system variable.
#'
#' @return Nothing
#'

language <- function() {
  cat("The responses can be in German or in English. You later can change the setting with the code rainer:::language. \n")
  cat("Would you like the response to be in German (1) or in English (2)? Please write 1 or 2 in the console")

  response_lan <- readline()

  if((response_lan) == 1) {

    language_path <- file.path(R.home("etc"), "rainer_language")

    file.create(language_path)

    cat("german \n", file = language_path)

    Sys.setenv(rainer_language = "german")

    cat("RAINER wird in Deutsch antworten. \n")

    invisible(TRUE)
  } else if((response_lan) == 2) {

    language_path <- file.path(R.home("etc"), "rainer_language")

    file.create(language_path)

    cat("english \n", file = language_path)

    Sys.setenv(rainer_language = "english")

    cat("RAINER will respond in english. \n")

    invisible(TRUE)
  } else {
    cat("Please write either 1 or 2 in the console. Please press Escape in order to stop loading RAINER.")
    invisible(FALSE)
    return(language())
  }
}
