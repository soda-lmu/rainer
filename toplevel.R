#toplevel script for testing the function etc. Will be removed later, listed in .Rbuildignore
#library(devtools)
devtools::load_all()
devtools::check()

data = mtcars
var1 = 5
summary[data$hp]


ractivate("on")
rexplain("Why is there Length 0 and NULL at class and mode in the table?")
rerror()
ractivate("off")
rexport("test1")
