#' Collects the current script
#'
#' This function gathers the current document and formats it accordingly.
#'
#' @return Nothing
current_script <- function() {
  max_lines_start <- 150
  max_lines_end <- 50
  max_line_length <- 500
  current_script <- tryCatch(
    {
      script_content <- rstudioapi::getSourceEditorContext()$contents
      if (!is.null(script_content)) {

        # Truncate very long individual lines
        script_content <- sapply(script_content, function(line) {
          if (nchar(line) > max_line_length) {
            paste0(substr(line, 1, max_line_length), "...[line truncated]")
          } else {
            line
          }
        })

        # Add line numbers first so they reflect actual line numbers
        total_lines <- length(script_content)
        numbered_script <- paste0("L", seq_len(total_lines), ":", script_content)

        # Truncate script if too long
        if (total_lines > (max_lines_start + max_lines_end)) {
          omitted <- total_lines - max_lines_start - max_lines_end
          numbered_script <- c(
            numbered_script[1:max_lines_start],
            paste0("\n...[", omitted, " lines omitted]...\n"),
            numbered_script[(total_lines - max_lines_end + 1):total_lines]
          )
        }
        paste0(numbered_script, collapse = "\n")
      } else {
        NULL
      }
    },
    error = function(e) {
      NULL
    }
  )
  return(current_script)
}
