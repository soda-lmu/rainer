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
      col_types <- sapply(df, function(col) class(col)[1])

      info <- list(
        columns = col_names,
        types = as.list(col_types),
        dimensions = list(rows = nrow(df), cols = ncol(df))
      )

      # numeric columns
      numeric_cols <- sapply(df, is.numeric)
      if (any(numeric_cols)) {
        info$numeric <- lapply(col_names[numeric_cols], function(col_name) {
          col_data <- df[[col_name]]
          result <- list(has_na = any(is.na(col_data)))
          if (!all(is.na(col_data))) {
            result$has_negative <- any(col_data < 0, na.rm = TRUE)
            result$has_zero <- any(col_data == 0, na.rm = TRUE)
            result$has_positive <- any(col_data > 0, na.rm = TRUE)
          }
          result
        })
        names(info$numeric) <- col_names[numeric_cols]
      }

      # factor columns
      factor_cols <- sapply(df, is.factor)
      if (any(factor_cols)) {
        info$factor <- lapply(col_names[factor_cols], function(col_name) {
          col_data <- df[[col_name]]
          list(
            n_levels = nlevels(col_data),
            has_na = any(is.na(col_data))
          )
        })
        names(info$factor) <- col_names[factor_cols]
      }

      # character columns
      char_cols <- sapply(df, is.character)
      if (any(char_cols)) {
        info$character <- lapply(col_names[char_cols], function(col_name) {
          col_data <- df[[col_name]]
          list(
            n_unique = length(unique(col_data)),
            has_na = any(is.na(col_data)),
            all_empty = all(is.na(col_data) | (!is.na(col_data) & col_data == ""))
          )
        })
        names(info$character) <- col_names[char_cols]
      }

      info
    })
    names(heads) <- dataframe_names

    as.list(heads)
  }
}
