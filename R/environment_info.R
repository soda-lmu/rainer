#' Collect Environment Information
#'
#' This function gathers information about the current R environment and is used internally.
#'
#' @param error Logical. If TRUE, adds the last error message to the output.
#' @return Nothing

environment_info <- function(error = TRUE) {
  info <- list(
    current_script = try(rstudioapi::getSourceEditorContext()$contents),
    objects = environment_objects(),
    data_header = header(),
    packages = list(loadedNamespaces())
  )

  if(error) {
    info[["error_message"]] <- geterrmessage()
  }

  return(info)
}
