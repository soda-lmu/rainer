#toplevel script for testing the function etc. Will be removed later, listed in .Rbuildignore
library(devtools)
load_all()
devtools::check()

data = mtcars
data$weight_kg = data$wt*0.454
summary(data$weight_kg)

ractivate("on")
rexplain()

ractivate("off")

