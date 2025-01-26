#' Collect Environment Information
#'
#' This function gathers information about the current R environment and is used internally.
#'
#' @param error Logical. If TRUE, adds the last error message to the output.
#' @return Nothing

environment_info <- function(error = TRUE) {
  info <- list(
    script = current_script(),
    objects = environment_objects(),
    datastructure = header(),
    packages = list(loadedNamespaces())
  )

  if(error) {
    info[["error_message"]] <- geterrmessage()
  }

  return(info)
}
