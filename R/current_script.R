#' Collects the current script
#'
#' This function gathers the current document and formats it accordingly.
#'
#' @return Nothing
current_script <- function() {
  max_chars <- 15000
  lines_start <- 50
  lines_before_cursor <- 200
  lines_after_cursor <- 100

  current_script <- tryCatch(
    {
      context <- rstudioapi::getSourceEditorContext()
      script_content <- context$contents
      cursor_line <- context$selection[[1]]$range$start[["row"]]

      if (!is.null(script_content)) {
        total_lines <- length(script_content)
        numbered_script <- paste0("L", seq_len(total_lines), ":", script_content)

        # If script is short enough return it all
        if (total_lines <= lines_start + lines_before_cursor + lines_after_cursor) {
          result <- paste0(numbered_script, collapse = "\n")
        } else {
          # Always include first lines
          start_section <- numbered_script[1:min(lines_start, total_lines)]

          # Lines around cursor with more before if near end of document
          cursor_start <- max(lines_start + 1, cursor_line - lines_before_cursor)
          cursor_end <- min(total_lines, cursor_line + lines_after_cursor)

          if (cursor_end >= total_lines - 50) {
            cursor_start <- max(lines_start + 1, total_lines - lines_before_cursor - lines_after_cursor)
          }

          cursor_section <- numbered_script[cursor_start:cursor_end]

          if (cursor_start > lines_start + 1) {
            omitted <- cursor_start - lines_start - 1
            combined <- c(
              start_section,
              paste0("\n...[", omitted, " lines omitted]...\n"),
              cursor_section
            )
          } else {
            combined <- c(start_section, cursor_section)
          }

          result <- paste0(combined, collapse = "\n")
        }

        # Apply overall character limit
        if (nchar(result) > max_chars) {
          result <- paste0(substr(result, 1, max_chars), "\n...[truncated due to character limit]...")
        }

        result
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
