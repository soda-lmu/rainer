#toplevel script for testing the function etc. Will be removed later, listed in .Rbuildignore
library(devtools)
library(usethis)
load_all()
devtools::check()

#examples for checking
read.csv("data/testfile")

data = ?mtcars
plot = ggplot(data = mtcars, mapping = aes(x = hp, y = cyl)) +
  geom_point()

data$weight_kg = data$wt*0.454
summary(data$weight_kg)

summary[data$hp]

var1 = 5
var2 = 3
var3 = var1 * var2

rexport("test1")
rexplain()
rimprove()
ractivate("on")
