#' Exports the environment information into a JSON file
#'
#' This function exports the gathered information about the environment.
#'
#' @param filename The name the file is supposed to have
#' @param error Logical. If TRUE, adds the last error message to the output.
#' @return nothing

r_export <- function(filename, error = TRUE) {
  environment <- environment_info(error)

  jsonlite::write_json(environment, path = filename, pretty = TRUE)
}
