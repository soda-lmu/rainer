#' Function for attaching the package
#'
#' This function firstly checks if the required information are available and if not, gathers them when attaching the package
#'
#' @return Nothing
#'

.onLoad <- function(libname, pkgname) {

  cat("Loading RAINER and checking if all required variables are already existing ... \n")

  if(Sys.getenv("rainer_dataprot") == "") {

    data_protection()
  } else if(Sys.getenv("rainer_log") == "") {

    logging()
  } else if(Sys.getenv("rainer_token") == "") {

    github_token()
  } else if(Sys.getenv("rainer_language") == "") {

    language()
  }
    cat("RAINER is now ready for helping you!")
}










