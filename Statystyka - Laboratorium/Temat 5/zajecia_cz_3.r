x1 <- c(300, 350, 220, 370, 280, 340, 400, 320, 150, 280)
x2 <- c(2, 3, 2, 4, 3, 3, 3, 2, 1, 2)
x3 <- c(40, 48, 42, 60, 48, 45, 55, 40, 20, 28)
x4 <- c(1, 4, 3, 3, 4, 2, 2, 1, 3, 1)

library(corrplot)

x <- cbind(x1, x2, x3, x4)
xkor <- cor(x)
corrplot(xkor)

x <- lm(x1 ~ x2 + x3 + x4)
summary(x)

xx3 <- lm(x1 ~ x2 + x4)
summary(xx3)

# cor(x2, x3)