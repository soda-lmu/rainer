#' Function for saving the acceptance of the data protection regulations.
#'
#' This function saves whether the person has accepted the data protection regulations as system variable.
#'
#' @return Nothing
#'

data_protection <- function() {
  cat("The RAINER package sends some of the information of your R environment to a GPT-model in order to provide individual feedback.
      These information are: \n
      -the current R document (Script, R-Markdown-Document, ...),
      -structure of the loaded dataset(s),
      -loaded variables and functions,
      -the loaded packages. \n
      The access to the GPT-model is provided through GitHub. Hence, with using the functions provided with RAINER, you interact with GitHub. \n
      You can access the data protection statements of GitHub with the following link:
      https://docs.github.com/en/site-policy/privacy-policies/github-general-privacy-statement \n")

  response_data <- utils::askYesNo(msg = "Do you understand and accept the data protection regulations?", default = TRUE)

  if(response_data){

    .set_config(setting = "rainer_dataprot", content = TRUE)

    cat("Thank you for accepting the data protection regulations. \n")
  } else {

    stop("The package can just be used if you understand and accept the data protection regulations. Loading the package has been stopped.")

  }
}
