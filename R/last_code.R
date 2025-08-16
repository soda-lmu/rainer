#' Collects last executed code
#'
#' This function gathers the last code snipped executed and is used internally.
#'
#' @return Nothing
last_code <- function() {
  if (!interactive()) return(NA_character_)

  fname <- tempfile()
  code <- tryCatch({
    utils::savehistory(fname)
    utils::tail(readLines(fname), n = 3)[1]
  }, error = function(e) {
    NA_character_
  })

  return(code)
}
