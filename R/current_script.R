#' Collects the current script
#'
#' This function gathers the current document and formates it accordingly.
#'
#' @return Nothing

current_script <- function() {
  current_script <- tryCatch({
    script_content <- rstudioapi::getSourceEditorContext()$contents
    if (!is.null(script_content)) {
      # Add line numbers to the script content
      numbered_script <- paste("Line #", seq_along(script_content), script_content, sep = ": ")
      paste(numbered_script, collapse = "\n ")
    } else {
      NULL
    }
  }, error = function(e) {
    NULL
  })

  return(current_script)
}
