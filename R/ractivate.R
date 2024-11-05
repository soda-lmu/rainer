#Function: rainer::raictivate to activate/deactivate automatical feedback in case of a warning message

ractivate = function(switch) {
  if(switch == "on") {
    error_message = geterrmessage()

    if(is.null(error_message) || error_message == "") {return(invisible(NULL))} else {rexplain()}

  } else {return(invisible(NULL))}
}

