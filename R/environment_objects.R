#function for getting the environment objects

environment_objects = function(){
  obj_names = ls(envir = .GlobalEnv) #getting the objects in the environment
  obj_info = sapply(obj_names, function(name) { #function to label the objects
    obj = get(name, envir = .GlobalEnv)

    if (is.function(obj)) {
      "function"
    } else if (is.data.frame(obj)) {
      "dataframe"
    } else {
      "variable"
    }
  })

  as.list(obj_info) #formatting the response
}
