#' Function for saving the acceptance of the data protection regulations.
#'
#' This function saves whether the person has accepted the data protection regulations as system variable.
#'
#' @return Nothing
#'

data_protection <- function() {
  cat("Access to the LLM is provided by GitHub. Hence, the usage of RAINER's functions is an interaction between the user and GitHub. \n")
  cli::cli_text("You can access the data protection statements of GitHub with the following link:
                {.url https://docs.github.com/en/site-policy/privacy-policies/github-general-privacy-statement}")
  cat("The following data of your R environment are included in the query: \n
  - The currently opened document (e.g. script, R-markdown-document, ...) \n
  - The structure of all loaded datasets (only variable names, not the data itself) \n
  - The name and type of all other loaded entities (e.g. variables, functions, ...) \n
  - The names of loaded packages \n
  - The last error message")

  response_data <- utils::askYesNo(msg = "Do you understand and accept the data protection regulations?", default = FALSE)

  if(response_data){

    .set_config(setting = "rainer_dataprot", content = TRUE)

    cat("Thank you for accepting the data protection regulations. \n")
  } else {

    stop("The package can just be used if you understand and accept the data protection regulations. Loading the package has been stopped.")

  }
}
