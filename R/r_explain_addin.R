#' Addin for r_explain, allows for individual quetsions in a pop-up
#'
#' This function creates the addin in order to execute r_explain in the addins menu, used internally
#'
#' @return Nothing
#'

r_explain_addin <- function() {
  user_input <- rstudioapi::showPrompt(
    title = "What should be explained?",
    message = "Please enter your question for the assistant:",
    default = ""
  )

  if (is.null(user_input)) return(invisible(NULL))

  r_explain(question = user_input)
}
