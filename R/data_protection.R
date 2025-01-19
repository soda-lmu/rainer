#' Function for saving the acceptance of the data protection regulations.
#'
#' This function saves whether the person has accepted the data protection regulations as system variable.
#'
#' @return Nothing
#'

data_protection <- function() {
  cat("The RAINER package sends some of the information of your R environment to a GPT-model in order to provide individual feedback. These information are: \n -the current R document (Script, R-Markdown-Document, ...),\n -structure of the loaded dataset(s), \n -loaded variables and functions, \n -the loaded packages. \n The access to the GPT-model is provided through GitHub. Hence, with using the functions provided with RAINER, you interact with GitHub. \n")
  cat("You can access the data protection statements of GitHub with the following link: \n https://docs.github.com/en/site-policy/privacy-policies/github-general-privacy-statement \n")
  cat("In order to proceed, please indicate that you understood and acceppt that by writing 'y' in the console. \n You can stop the loading process with writing 'n'.")

  response_data <- readline()

  if(tolower(response_data) == "y"){

    dataprot_path <- file.path(R.home("etc"), "rainer_dataprot")

    file.create(dataprot_path)

    cat("TRUE \n", file = dataprot_path)

    Sys.setenv(rainer_dataprot = TRUE)

    invisible(TRUE)

    cat("Thank you for accepting the data protection regulations. \n")
  } else if(tolower(response_data) == "n") {

    stop("The package can just be used if you understand and accept the data protection regulations. Loading the package has been stopped.")

  } else {
    cat("Please write just the letter y or n in the console to indicate if you understood and accept the data protection regulations.")
    return(data_protection())
  }
}
