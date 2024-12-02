#Function: rainer::rexport in order to export the script information (might be deleted later)

r_export = function(filename, error = TRUE) {
  environment = list(
    if(error) {environment_info_error()
    } else {
      environment_info()}
  )

  jsonlite::write_json(environment, path = filename, pretty = TRUE)
}

