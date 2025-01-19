#' Function for attaching the package
#'
#' This function firstly checks if the required information are available and if not, gathers them when attaching the package
#'
#' @return Nothing
#'

.onLoad <- function(libname, pkgname) {

  cat("Loading RAINER and checking if all required variables are already existing ... \n")

  dataprot_path <- file.path(R.home("etc"), "rainer_dataprot")

  if (!file.exists(dataprot_path)) {

    data_protection()
  } else {

    Sys.setenv(rainer_dataprot = readLines(dataprot_path))
  }

  logging_path <- file.path(R.home("etc"), "rainer_logging")

  if (!file.exists(logging_path)) {

    logging()
  } else {

    Sys.setenv(rainer_logging = readLines(logging_path))
  }

  token_path <- file.path(R.home("etc"), "rainer_token")

  if (!file.exists(token_path)) {

    github_token()
  } else {

    Sys.setenv(rainer_token = readLines(token_path))
  }

  language_path <- file.path(R.home("etc"), "rainer_language")

  if (!file.exists(language_path)) {

    language()
  } else {

    Sys.setenv(rainer_language = readLines(language_path))
  }

    cat("RAINER is now ready for helping you!")
}










