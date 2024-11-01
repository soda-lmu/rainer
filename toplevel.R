#toplevel script for testing the function etc. Will be removed later, currently producing 1 note

library(devtools)
library(usethis)

load_all()

devtools::check()

data = mtcars
data$fast = ifelse(data$hp > 123, 1, 0)

table(data$hp data$fast)

explain()

