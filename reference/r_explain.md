# Function to explain something based on a individual prompt

Use that function to get an explanation in case the output is not what
you expected without getting an error message.

## Usage

``` r
r_explain(
  question =
    "The code does not yield the result I intended. Please explain what the problem might be.",
  error = FALSE,
  interactive_prompt = TRUE
)
```

## Arguments

- question:

  The individual question/prompt which GPT is supposed to answer.

- error:

  Logical. If TRUE, adds the last error message to the output. FALSE per
  default.

- interactive_prompt:

  Logical. If TRUE, the popup-window is usable (necessary for the
  testing environment).

## Value

Response
