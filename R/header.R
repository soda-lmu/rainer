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
      df <- get(name, envir = .GlobalEnv)
      col_names <- names(df)

      info <- list(
        dimensions = list(rows = nrow(df), cols = ncol(df)),
        columns = setNames(lapply(col_names, function(col_name) {
          col_data <- df[[col_name]]
          col_type <- class(col_data)[1]

          col_info <- list(
            type   = col_type,
            has_na = any(is.na(col_data))
          )

          if (is.numeric(col_data)) {
            col_info$has_zero <- any(col_data == 0, na.rm = TRUE)
          } else if (is.factor(col_data)) {
            col_info$n_levels <- nlevels(col_data)
          } else if (is.character(col_data)) {
            col_info$n_unique  <- length(unique(col_data))
            col_info$all_empty <- all(is.na(col_data) | col_data == "")
          }

          col_info
        }), col_names)
      )

      info
    })
    names(heads) <- dataframe_names
    as.list(heads)
  }
}
