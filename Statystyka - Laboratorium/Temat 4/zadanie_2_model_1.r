dane1 <- read.csv2("LAB_lm1_dane.csv", header = T, sep = ";", dec = ".")


model1 <- lm(y ~ x1 + x2, data = dane1)
summary(model1)

model1X1 <- lm(y ~ x1, data = dane1)
summary(model1X1)

model1X2 <-lm(y ~ x2, data = dane1)
summary(model1X2)

n <- length(dane1$y)
X <- as.matrix(cbind(rep(1, n), dane1$x1, dane1$x2))
XTX <- t(X)%*%X
odwr_XTX <- solve(t(X)%*%X)
XTY <- t(Y)%*%