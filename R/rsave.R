#function to save the current state of the environment in a .json file

rsave = function(filename) {
  environment_info = list(
    Environment_Objects = ls(envir = .GlobalEnv),
    packages = devtools::session_info(),
    current_script = try(rstudioapi::getActiveDocumentContext()$contents),
    errors = geterrmessage()
  )

  jsonlite::write_json(environment_info, path = filename, pretty = TRUE)
}


