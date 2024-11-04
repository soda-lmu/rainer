#function to save the current state of the environment in a .json file

rexport = function(filename) {
  environment_info = list(
    objects = Environment_Objects(),
    data_header = header(),
    directory = getwd(),
    packages = list(loadedNamespaces()),
    current_script = try(rstudioapi::getActiveDocumentContext()$contents),
    errors = geterrmessage()
  )

  jsonlite::write_json(environment_info, path = filename, pretty = TRUE)
}


