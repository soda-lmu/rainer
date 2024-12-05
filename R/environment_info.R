#' Collect Environment Information
#'
#' This function gathers information about the current R environment.
#'
#' @param error Logical. If TRUE, adds the last error message to the output.
#' @return A list containing environment details.
#' @export

environment_info <- function(error = TRUE) {
  info <- list(
    objects = environment_objects(), #function to get the object names incl. classification
    data_header = header(), #function to get the data incl. first two rows to see the structure
    directory = getwd(), #working directory
    packages = list(loadedNamespaces()), #loaded packages, not all installed
    current_script = try(rstudioapi::getSourceEditorContext()$contents) #current script
  )

  if(error) {
    info[["error_message"]] <- geterrmessage()
  }

  return(info)
}
