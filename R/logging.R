#' Function for saving the acceptance or decline of logging.
#'
#' This function saves whether the person has accepted or declined logging as a system variable.
#'
#' @return Nothing


logging <- function() {
  cat("In order to evaluate the package and gain insights in what students struggle with when using R, we'd like to log the responses. That means that we would like to store the error message occured as well as the information of the currently loaded document (e.g., script, R-Markdown-Document, ...). The storage will be anonymously without the possibility for indentification. \n")
  cat("The consent to logging is completely voluntary. If you decline the logging, you do not have any disadvantage. You can use the package normally without any limitations. \n")
  cat("You can withdraw your consent at every time by using the code rainer:::logging(). Additionally, you can contact one of our project members via XXX@XXX.de. \n")
  cat("Please write 'y' if you consent to logging or 'n' if not in the console.")

  response_log <- readline()

  if(tolower(response_log) == "y") {

    logging_path <- file.path(R.home("etc"), "rainer_logging")

    file.create(logging_path)

    cat("TRUE \n", file = logging_path)

    Sys.setenv(rainer_logging = TRUE)

    invisible(TRUE)

    cat("Thank you for accepting the logging and making it possible to further develop RAINER. \n")
  } else if(tolower(response_log) == "n") {

    logging_path <- file.path(R.home("etc"), "rainer_logging")

    file.create(logging_path)

    cat("FALSE \n", file = logging_path)

    Sys.setenv(rainer_logging = FALSE)

    invisible(TRUE)

    cat("Your quieries will not be logged. \n")
  } else {
    cat("Please write either the letter y or the letter n in the console.")
    return(logging())
  }
}
