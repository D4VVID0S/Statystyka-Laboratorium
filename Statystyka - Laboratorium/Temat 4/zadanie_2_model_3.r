dane3 <- read.csv2("LAB_lm3_dane.csv", header = T, sep = ";", dec = ".")

### Model 3
model3 <- lm(Y ~ X1 + X2 + X3, data = dane3)
summary(model3)

# Redukcja X2
model3YX1X3 <- lm(Y ~ X1 + X3, data = dane3)
summary(model3YX1X3)