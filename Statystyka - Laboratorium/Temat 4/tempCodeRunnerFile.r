dane1 <- read.csv2("LAB_lm1_dane.csv", header = T, sep = ";", dec = ".")
dane3 <- read.csv2("LAB_lm3_dane.csv", header = T, sep = ";", dec = ".")

model1 <- lm(y ~ x1 + x2, data = dane1)
summary(model1)

model1X1 <- lm(y ~ x1, data = dane1)
summary(model1X1)
