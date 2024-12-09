#' Collect Environment Information
#'
#' This function gathers information about the current R environment.
#'
#' @param error Logical. If TRUE, adds the last error message to the output.
#' @return A list containing environment details.
#' @export

environment_info <- function(error = TRUE) {
  info <- list(
    objects = environment_objects(),
    data_header = header(),
    directory = getwd(),
    packages = list(loadedNamespaces()),
    current_script = try(rstudioapi::getSourceEditorContext()$contents)
  )

  if(error) {
    info[["error_message"]] <- geterrmessage()
  }

  return(info)
}
