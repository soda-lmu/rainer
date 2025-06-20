#' Addin for r_explain, allows for individual quetsions in a pop-up
#'
#' This function creates the addin in order to execute r_explain in the addins menu, used internally
#'
#' @return Nothing
#'

r_explain_addin <- function() {
  rstudioapi::callFun("sendToConsole", "r_explain()")
}
