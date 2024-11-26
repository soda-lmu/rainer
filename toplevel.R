#toplevel script for testing the function etc. Will be removed later, listed in .Rbuildignore

devtools::load_all()

load("gpa2.RData")
gpa2 = data

data = mtcars
data$weight_kg = data$wt*0.454
data$weight_kgsq = data$weight_kg^2

scatter_colgpa_sat = ggplot(gpa2, mapping = aes(x = sat, y = colgpa)) +
  geom_point(size = 0.3, alpha = 0.3)
scatter_colgpa_sat
scatter_colgpa_hsperc = ggplot(gpa2, mapping = aes(x = hsperc, y = colgpa)) +
  geom_point(size = 0.3, alpha = 0.3)
scatter_colgpa_hsperc

model_a15 = lm(colgpa ~ sat + hsperc + athlete, data = gpa2)
summary(model_a15)
coefficients(model_a15)
model_a15_sat = lm(colgpa ~ sat, data = gpa2)
model_a15_hsperc = lm(colgpa ~ hsperc, data = gpa2)

rerror()
