#' Function for attaching the package
#'
#' This function firstly checks if the required information are available and if not, gathers them when attaching the package
#' @param libname Name of library
#' @param pkgname Name of package
#'
#' @return Nothing
#'

.onAttach <- function(libname, pkgname) {
  # Skip setup if running in pkgdown
  # Code for check from https://github.com/r-lib/pkgdown/blob/main/R/pkgdown.R
  if (
    !interactive() ||
      identical(Sys.getenv("IN_PKGDOWN"), "true")
  ) {
    return()
  }

  m1 <- "Loading RAINER and checking if all required variables are already existing ... \n"
  packageStartupMessage(m1)

  setting <- "rainer_dataprot"

  if (!file.exists(.file_path(setting))) {
    data_protection()
  } else {
    .get_config(setting)
  }

  setting <- "rainer_token"

  if (!file.exists(.file_path(setting))) {
    github_token()
  } else {
    .get_config(setting)
  }

  setting <- "rainer_language"

  if (!file.exists(.file_path(setting))) {
    language()
  } else {
    .get_config(setting)
  }

  setting <- "rainer_logging"

  if (!file.exists(.file_path(setting))) {
    logging()

    if (Sys.getenv("rainer_logging") == TRUE) {
      log_initialize()
    }
  } else {
    .get_config(setting)

    if (Sys.getenv("rainer_logging") == TRUE) {
      log_initialize()
    }
  }

  m2 <- "Rainer is ready to assist you!"
  packageStartupMessage(m2)
}
