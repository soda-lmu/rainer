#' Function for saving the acceptance or decline of logging.
#'
#' This function saves whether the person has accepted or declined logging as a system variable.
#'
#' @return Nothing


logging <- function() {
  cat("In order to evaluate the package and gain insights in what students struggle with when using R, we'd like to log the responses.
  That means that we would like to store the error message occured as well as the information of the currently loaded document
  (e.g., script, R-Markdown-Document, ...). \n
  The storage will be anonymously without the possibility for indentification.
  The consent to logging is completely voluntary. If you decline the logging, you do not have any disadvantage.
  You can use the package normally without any limitations. \n
  You can withdraw your consent at every time by using the code rainer:::logging(). Additionally, you can contact one of
  our project members via XXX@XXX.de. \n")

  response_log <- utils::askYesNo(msg = "Do you consent to logging a part of your query?", default = TRUE)

  if(response_log) {

    .set_config(setting = "rainer_logging", content = TRUE)

    cat("Thank you for accepting the logging and making it possible to further develop RAINER. \n")
  } else {

    .set_config(setting = "rainer_logging", content = FALSE)

    cat("Your quieries will not be logged. \n")
  }
}
