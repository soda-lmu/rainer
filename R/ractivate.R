#Function: rainer::raictivate to activate/deactivate automatical feedback in case of a warning message

ractivate = function(switch) {
  if(switch == "on") {
    options(error = function() rerror())
  } else
    if(switch == "off") {
      options(error = NULL)
    } else {
        return("Please write 'on' or 'off' in the function.")
      }
}


