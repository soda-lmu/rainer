#' Ask a yes/no question
#'
#' Asks the user a yes/no question and returns TRUE or FALSE.
#' Accepts yes, no, y, n (case insensitive).
#'
#' @param msg The question to ask
#' @param default Default value if user just presses Enter (NULL for no default)
#'
#' @return TRUE or FALSE based on user response
#'

ask_yes_no <- function(msg, default = NULL) {
  # Add default indicator to prompt
  if (!is.null(default)) {
    default_text <- if (default) " (Y/n)" else " (y/N)"
    prompt <- paste0(msg, default_text, ": ")
  } else {
    prompt <- paste0(msg, " (y/n): ")
  }
  
  # Keep asking until we get valid input
  repeat {
    response <- tolower(trimws(readline(prompt)))
    
    # Empty response means use default
    if (response == "") {
      if (!is.null(default)) {
        return(default)
      } else {
        cat("Please enter yes or no.\n")
        next
      }
    }
    
    # Check if response is valid
    if (response %in% c("yes", "y")) {
      return(TRUE)
    } else if (response %in% c("no", "n")) {
      return(FALSE)
    } else {
      cat("Please enter yes (y) or no (n).\n")
    }
  }
}