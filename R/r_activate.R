#Function: rainer::raictivate to activate/deactivate automatic feedback in case of a warning message

r_activate = function(switch = TRUE) {
  if(switch == TRUE) {
    options(error = function() r_error()) #overriding the current error settings, in order to trigger r_error()
  } else
    if(switch == FALSE) {
      options(error = NULL) #returning to default settings when turning off r_activate
    } else {
        return("Please write 'TRUE' or 'FALSE' in the function.") #error message if something else than on/off is put into the function
      }
}


