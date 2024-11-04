#toplevel script for testing the function etc. Will be removed later, listed in .Rbuildignore

library(devtools)
library(usethis)

load_all()
devtools::check()

#examples for checking
data = mtcars
var1 = 5
var2 = 3
var3 = var1 * var2
data$fast = ifelse(data$hp > 123, 1, 0)
table(data$hp, data$fast)
read.csv("data/testfile")

rexport("test1")
rexplain()
rimprove()
ractivate("on")
