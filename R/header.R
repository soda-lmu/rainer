#' Function to gather the information of data sets
#'
#' This function gathers the structure of the loaded datasets and is used internally
#'
#' @return Nothing

header <- function() {
  # getting all objects
  obj_types <- environment_objects()

  # names for all dataframes
  dataframe_names <- names(obj_types)[obj_types == "dataframe"]

  # check if dataframe is loaded and return the structure if loaded and an error message if not
  if (length(dataframe_names) == 0 | is.null(dataframe_names)) {
    return("No datasets loaded in the session")
  } else {
    heads <- lapply(dataframe_names, function(name) {
      names(get(name, envir = .GlobalEnv))
    })
    names(heads) <- dataframe_names

    as.list(heads)
  }
}
