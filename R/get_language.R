#' Acquires system language
#'
#' This function acquires the system language as default for the response language and is used internally
#'
#' @return Nothing

get_language <- function() {
  # getting the system language
  sys_language_code <- Sys.getenv("LANG")

  sys_language <- if (grepl("^de", sys_language_code)) {
    language <- "german"
  } else {
    language <- "english"
  }

  return(sys_language)
}
