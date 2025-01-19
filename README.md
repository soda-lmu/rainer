# RAINER - R Assistant IN Error Resolution 

Welcome to RAINER - your new best friend in R.

RAINER provides explanations for error messages, outputs not yielding your intended results and suggestions for improvements of your script based on an LLM. To do that, RAINER sends your current state of the work in R to a GPT model by using the possibility to access GPT-4o through GitHub.

# RAINER's four main functions

- r_error(): use that function to get an explanation what an error message means, why it occured and how to correct the issue
- r_activate(): use that function to automatically trigger r_error() always when an error message occurs
- r_explain(): use that function when an output (e.g. a table) does not yield the result you intended without throwing an error message
- r_improve(): use that function to get suggestions of how to improve your code

# Loading RAINER for the first time

After installing RAINER and loading the package for the first time, four questions will pop up in the console which need to be answered before using the package. The answers will be saved in the folder R.framework/Resources/etc and be read when attaching RAINER in the future to avoid providing the information every time you load the package. These information are:

- Acceptance of the data protection regulations of GitHub, which provides the access to the LLM (see below for more information)
- The answer whether we're allowed to log a part of your queries in order to further develop RAINER (see below for more information)
- Your GitHub token to access the LLM (see below for more information)
- The prefered language of the responses (German or English)

If you want to change the information saved in the file, use the function rainer:::dataprot(), rainer:::logging(), rainer:::github_token, or rainer:::language().

# Data protection

The access to the LLM is provided by GitHub. Hence, the usage of RAINER's functions is an interaction between the user and GitHub (see for GitHub's data protection regulations: https://docs.github.com/en/site-policy/privacy-policies/github-general-privacy-statement). The following data of your R environment are included in the query:

- currently opened document (e.g. script, R-markdown-document, ...)
- structure of all loaded datasets (no data are sent, just the variable names)
- name and type of all other loaded entities (e.g. variables, functions, ...)
- loaded packages
- last error message

# Access to a GPT-model by GitHub

GitHub provides the possibility to access LLMs free of charge with a GitHub-token (see for more information: https://docs.github.com/en/github-models). Therefore, you need a personal GitHub token, which you can create by following these steps:
1. Open the settings in GitHub (click on your profile in the upper right corner and select 'settings')
2. Scroll down and choose 'developer settings' in the menu on the left
3. Select 'Personal access tokens'
4. Select 'Tokens (classic)'
5. Click on 'create new token' in the upper right corner
6. You can choose now the scopes (no scopes are necessary for accessing an LLM) and the expiration date. After expiration, the access (and RAINER) will not work anymore and a new token is required.
7. Remember to directly copy your code after the creation since it cannot be accessed afterwards!

# Further Development of RAINER and logging

We developed RAINER in the first place to improve the start with R of students without prior programming experiences. To understand what students struggle with and to enhance the package including the prompts, we would like to save a part of your query when using RAINER. The logging contains the currently opened document (e.g. script, R-markdown-document, ...) and the error message connected with the query. These information are saved anonymously without the possibility of tracing back who sent the query. Acceptance of logging is voluntary and the package does work without accepting it, too. The acceptance can be withdrawn at any time with the function rainer:::logging() and choosing no. The stored queries will only be used in an academic context and will not be published or passed to other parties. In case of any questions, you may contact XXX (xxx@xxx.de). Thank you very much!
