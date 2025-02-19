#' Function for attaching the package
#'
#' This function firstly checks if the required information are available and if not, gathers them when attaching the package
#' @param libname Name of library
#' @param pkgname Name of package
#'
#' @return Nothing
#'

.onAttach <- function(libname, pkgname) {

  m1 <- "Loading RAINER and checking if all required variables are already existing ... \n"
  packageStartupMessage(m1)

  setting <- "rainer_dataprot"

  if (!file.exists(.file_path(setting))) {

    data_protection()
  } else {

    .get_config(setting)
  }

  setting <- "rainer_logging"

  if (!file.exists(.file_path(setting))) {

    logging()

    if(Sys.getenv("rainer_logging") == TRUE) {

      log_initialize()
    }
  } else {

    .get_config(setting)

    if(Sys.getenv("rainer_logging") == TRUE) {

      log_initialize()
    }
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

    m2 <- "RAINER is now ready for helping you!"
    packageStartupMessage(m2)
}










