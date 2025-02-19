#toplevel script for testing the function etc. Will be removed later, listed in .Rbuildignore

devtools::load_all()

Sys.unsetenv("rainer_language")
Sys.unsetenv("rainer_dataprot")
Sys.unsetenv("rainer_token")
Sys.unsetenv("rainer_log")
Sys.unsetenv("sessionId")

data = mtcars

a 378 + 983
b <- 3784*3-5
c <- 3897/19

result <- sum(result_a, result_b, result_c)

body <- list(
  messages = list(
    list(role = "system", content = "You are helping students in an R programming course for beginners and give feedback on why it is wrong, how to correct it and how to improve in the future."),

    list(role = "user", content = paste("You got the following information on the current state of my work in R:",
                                        jsonlite::toJSON(environment, auto_unbox = TRUE),
                                        "Stepwise, identify the errors (there might be multiple) and give me feedback on how to correct the issue in maximum three senctences.",
                                        "Answer me in ", language))),
  max_tokens = 200
)


"Step by step, firstly analyze the information provided, then identify the error based on the error message and relevant parts of the information and lastly give me feedback on how to correct the issue in maximum three senctences."

