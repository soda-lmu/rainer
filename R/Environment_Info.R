Environment_Objects = function(){
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

header = function() {
  obj_types = Environment_Objects() #getting all objects

  dataframe_names = names(obj_types)[obj_types == "dataframe"] #names for all dataframes

  if(length(dataframe_names) == 0 | is.null(dataframe_names)) { #check if a dataframe is loaded
    return("No datasets loaded in the session") #return message if not
  } else{
    heads = lapply(dataframe_names, function(name) { #function for all dataframes if one or more is loaded
      utils::head(get(name, envir = .GlobalEnv), n = 1) #head and first row of all dataframes
    })
    names(heads) = dataframe_names #naming the output
    return(heads) #printing them
  }
}
