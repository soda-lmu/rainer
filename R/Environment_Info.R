Environment_Objects = function(){
  obj_names = ls(envir = .GlobalEnv)
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

header = function() {
  obj_types = Environment_Objects()
  sapply(names(obj_types), function(name) {
    if (obj_types[[name]] == "dataframe") {
      return(head(get(name, envir = .GlobalEnv), n = 2))
    } else {return(NULL)}
  }, simplify = FALSE)
}
