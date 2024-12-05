#' Automatic activation of r_error
#'
#' This function enables r_error, the explanation of error message, automatically when an error message is
#' visible.
#'
#' @param switch Logical. If TRUE, r_error is triggered automatically when an error message occurs. Use FALSE to deactivate the function.
#' @return Response
#' @export

r_activate <- function(switch = TRUE) {
  if(switch == TRUE) {
    options(error = function() r_error())
  } else
    if(switch == FALSE) {
      options(error = NULL)
    } else {
        return("Please write 'TRUE' or 'FALSE' in the function.")
      }
}


