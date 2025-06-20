#' Collects last executed code
#'
#' This function gathers the last code snipped executed and is used internally.
#'
#' @return Nothing

last_code <- function(){
  fname <- tempfile()
  utils::savehistory(fname)
  code <- utils::tail(readLines(fname), n = 3)[1]
  return(code)
}
