#' Function for saving the acceptance or decline of logging.
#'
#' This function saves whether the person has accepted or declined logging as a system variable.
#'
#' @return Nothing


logging <- function() {
  cat("RAINER was developed to help students with little or no prior programming experience in R.
  To improve the package, we would like to save a portion of queries for academic analysis. \n

  The logged information contains the same information as the prompt sent to GPT.
  This information is saved anonymously without the possibility of tracing back who sent the query. \n

  Acceptance of logging is voluntary and the package does work without accepting it, too.
  The acceptance can be withdrawn at any time with the function `rainer:::logging()` and choosing no (as set per default). \n

  The stored queries will only be used in an academic context and will only be published anonymously.
  The data will be deleted as soon as they are not used anymore in an academic context.
  In case of any questions, please contact us (rainer@stat.uni-muenchen.de). Thank you very much!")

  response_log <- utils::askYesNo(msg = "Do you consent to logging your query?", default = FALSE)

  if (response_log) {
    .set_config(setting = "rainer_logging", content = TRUE)

    cat("Thank you for accepting the logging and making it possible to further develop RAINER. \n")
  } else {
    .set_config(setting = "rainer_logging", content = FALSE)

    cat("Your quieries will not be logged. \n")
  }
}
