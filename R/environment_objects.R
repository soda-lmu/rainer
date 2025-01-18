#' Labels Environment Information
#'
#' This function labels all loaded objects in the current R environment and is used internally.
#'
#' @return Nothing

environment_objects = function(){
  # getting the objects in the environment
  obj_names = ls(envir = .GlobalEnv)

  # function to label the objects
  obj_info = sapply(obj_names, function(name) {
    obj = get(name, envir = .GlobalEnv)

    if (is.function(obj)) {
      "function"
    } else if (is.data.frame(obj)) {
      "dataframe"
    } else {
      "variable"
    }
  })

  as.list(obj_info)
}
