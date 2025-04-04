#' Configuration function
#'
#' This function loads the configuration variables into system variables
#' @param setting What variable to define, i.e. rainer_dataprot, rainer_logging, rainer_token or rainer_language
#'
#' @return Nothing
#'

.get_config <- function(setting) {
  file_path <- file.path(tools::R_user_dir("rainer", which = "data"), setting)

  do.call(Sys.setenv, stats::setNames(list(readLines(file_path)), setting))
}
