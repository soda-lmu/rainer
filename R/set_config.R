#' Configuration function
#'
#' This function creates and saves relevant variables necessary for using rainer
#' @param setting What variable to define, i.e. rainer_dataprot, rainer_logging, rainer_token or rainer_language
#' @param content How to define the variable, i.e. TRUE/FALSE, german/english or with the token
#'
#' @return Nothing
#'

.set_config <- function(setting, content){

  config_path <- file.path(tools::R_user_dir("rainer", which = "data"))

  file_path <- file.path(config_path, setting)

  dir.create(config_path, recursive = TRUE, showWarnings = FALSE)

  file.create(file_path)

  cat(paste0(content, "\n"), file = file_path)

  do.call(Sys.setenv, stats::setNames(list(content), setting))

}
