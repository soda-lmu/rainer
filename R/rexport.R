#Function: rainer::rexport in order to export the script information (might be deleted later)

rexport = function(filename) {
  environment_info = list(
    objects = Environment_Objects(),
    data_header = header(),
    directory = getwd(),
    packages = list(loadedNamespaces()),
    current_script = try(rstudioapi::getSourceEditorContext()$content),
    errors = geterrmessage()
  )

  jsonlite::write_json(environment_info, path = filename, pretty = TRUE)
}


