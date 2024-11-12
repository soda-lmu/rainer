#toplevel script for testing the function etc. Will be removed later, listed in .Rbuildignore
#library(devtools)
devtools::load_all()
devtools::check()

data = mtcars
data$weight_kg = data$wt*0.454
summary(data$weight_kg)

ractivate("on")
rexplain("Why is there Length 0 and NULL at class and mode in the table?")
rerror()
ractivate("off")
