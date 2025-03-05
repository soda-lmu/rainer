# RAINER - R Assistant IN Error Resolution 

Welcome to RAINER - your new best friend in R.

RAINER provides explanations for error messages, outputs not yielding your intended results and suggestions for improvements of your script based on an LLM. To do that, RAINER sends your current state of the work in R to a GPT model by using the possibility to access GPT-4o through GitHub.

## Overview

- `r_error()`: use that function to get an explanation what an error message means, why it occured and how to correct the issue
- `r_activate()`: use that function to automatically trigger `r_error()` always when an error message occurs
- `r_explain()`: use that function when an output (e.g. a table) does not yield the result you intended without throwing an error message
- `r_improve()`: use that function to get suggestions of how to improve your code

## Installation

RAINER is currently not available on CRAN (yet), but can be installed directly from GitHub. To install the package, use the command below.

```r
# If you have not installed it yet, install the remotes package first
install.packages("remotes")

# Install RAINER
remotes::install_github("soda-lmu/rainer")
```

## Getting Started

When you load RAINER for the first time, you will be guided through the setup process. RAINER will ask you for input on the following questions and will store your response, so you only have to answer them once. More detailed information on the questions can be found below.

- Accepting the data protection regulations
- Your GitHub token (see below on how you can get one)
- Your preferred language (German 🇩🇪 or English 🇬🇧)
- Whether or not the requests to RAINER can be logged (totally optional)

If you want to change your response to any of these questions later on, you can do so by using the following functions: `rainer:::dataprot()`, `rainer:::github_token()`, `rainer:::language()`, or `rainer:::logging()`.

### Getting your GitHub token

With a GitHub token you can access LLMs free of charge (see for more information: https://docs.github.com/en/github-models). Therefore, you need a personal GitHub token, which you can create by following these steps:

1. Go to the GitHub page for managing your tokens: <https://github.com/settings/tokens>
2. Make sure you selected 'Tokens (classic)' on the left
3. Click on 'Generate new token' in the upper right corner
4. Next, you need to choose the scopes for this token (what it's allowed to do) and the expiration date (when the token stops working). For using RAINER and accessing LLMs you do not need to select any of the scopes.
5. Success, you created your token! 🎉 Now make sure to copy it into RAINER and check that it works, before closing the website.

After the expiration date, the token (and RAINER) will stop working and you will need to create a new token. You can provide a new token to RAINER with `rainer:::github_token()`.

## Data protection

Access to the LLM is provided by GitHub. Hence, the usage of RAINER's functions is an interaction between the user and GitHub (see for GitHub's data protection regulations: https://docs.github.com/en/site-policy/privacy-policies/github-general-privacy-statement). The following data of your R environment are included in the query:

- The currently opened document (e.g. script, R-markdown-document, ...)
- The structure of all loaded datasets (no data are sent, just the variable names)
- The name and type of all other loaded entities (e.g. variables, functions, ...)
- The names of loaded packages
- The last error message

## Further Development

We developed RAINER in the first place to improve the start with R of students without or little prior programming experiences. To understand what students struggle with and to enhance the package including the prompts, we would like to save a part of your query when using RAINER.

The logged information contains the currently opened document (e.g. script, R-markdown-document, ...) and the error message connected with the query. This information is saved anonymously without the possibility of tracing back who sent the query.

Acceptance of logging is voluntary and the package does work without accepting it, too. The acceptance can be withdrawn at any time with the function `rainer:::logging()` and choosing no.

The stored queries will only be used in an academic context and will not be published or passed to other parties. In case of any questions, you may contact XXX (xxx@xxx.de). Thank you very much!
