#' Addin with r_error, which provides an explanation for an error message
#'
#' This function creates the addin in order to execute r_error in the addins menu, used internally
#'
#' @return Nothing
#'

r_error_addin <- function() {
  rstudioapi::callFun("sendToConsole", "r_error()")
}
