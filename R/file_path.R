#' Function to get the file path
#'
#' This function creates and saves relevant variables necessary for using rainer
#' @param setting What variable to define, i.e. rainer_dataprot, rainer_logging, rainer_token or rainer_language
#'
#' @return Nothing
#'

.file_path <- function(setting){

  file_path <- file.path(tools::R_user_dir("rainer", which = "data"), setting)
}
