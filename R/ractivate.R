#Function: rainer::raictivate to activate/deactivate automatic feedback in case of a warning message

ractivate = function(switch) {
  if(switch == "on") {
    options(error = function() rerror()) #overriding the current error settings, in order to trigger rerror()
  } else
    if(switch == "off") {
      options(error = NULL) #returning to default settings when turning off ractivate
    } else {
        return("Please write 'on' or 'off' in the function.") #error message if something else than on/off is put into the function
      }
}


