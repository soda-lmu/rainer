#function to create the environment info for r_error, r_explain etc. excluding the error message

environment_info = function() {
  info = list(
    objects = environment_objects(), #function to get the object names incl. classification
    data_header = header(), #function to get the data incl. first two rows to see the structure
    directory = getwd(), #working directory
    packages = list(loadedNamespaces()), #loaded packages, not all installed
    current_script = try(rstudioapi::getSourceEditorContext()$contents) #current script
  )
  return(info)
}
