% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/r_explain.R
\name{r_explain}
\alias{r_explain}
\title{Function to explain something based on a individual prompt}
\usage{
r_explain(
  question =
    "The code does not yield the result I intended. Please explain what the problem might be.",
  error = FALSE
)
}
\arguments{
\item{question}{The individual question/prompt which GPT is supposed to answer.}

\item{error}{Logical. If TRUE, adds the last error message to the output. FALSE per default.}
}
\value{
Response
}
\description{
Use that function to get an explanation in case the output is not what you expected without getting an error message.
}
