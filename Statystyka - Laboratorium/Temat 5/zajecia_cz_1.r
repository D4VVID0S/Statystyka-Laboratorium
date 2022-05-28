# Rozkład jednostajny to sytuacje gdzie losowe działania mają zawsze
# taką samą szansę na wystąpienie
# np.: rzut monetą, rzut kostką.
# Każde wydarzenie ma szansę równą 1/6

getwd()
setwd("./Temat 5")
trendy <- read.csv2("Trendy.csv", header = T, sep = ",", dec = ".")
trendy
# Wyświetla tylko pierwsze 3 wiersze
trendy[1:3, ]

# Liniowy: y = a + b * t # nolint
t <- 1:20
t

# Losowy z N(0, 1)
y_0 <- c(20:1) + rnorm(20)
plot(y_0)

# Tworzenie modelu gdzie y jest uzależnione od kilku zmiennych
model_1 <- lm(y_0 ~ t)
summary(model_1)

# y = 21 - 1 * t # nolint
yteor <- 21.26392 - 1.00984 * t

yteor <- model_1$coefficients[1] + model_1$coefficients[2] * t

plot(y_0)
lines(yteor, type = "l", col = "blue")

# y_1
y_1 <- trendy$y1

t_2 <- t^2

model_y_1_propozycja_1 <- lm(y_1 ~ t + t_2) # nolint
summary(model_y_1_propozycja_1)

a_0_propozycja_1 <- model_y_1_propozycja_1$coefficients[1]
a_1_propozycja_1 <- model_y_1_propozycja_1$coefficients[2]
a_2_propozycja_1 <- model_y_1_propozycja_1$coefficients[3]

y_1_t_propozycja_1 <- a_0_propozycja_1 + a_1_propozycja_1 * t + a_2_propozycja_1 * t_2 # nolint

model_y_1_propozycja_2 <- lm(log(y_1) ~ t) # nolint
summary(model_y_1_propozycja_2)

a_0_propozycja_2 <- model_y_1_propozycja_2$coefficients[1]
a_1_propozycja_2 <- model_y_1_propozycja_2$coefficients[2]

y_1_t_propozycja_2 <- exp(a_0_propozycja_2 + a_1_propozycja_2 * t) # nolint

model_y_1_propozycja_3 <- lm(log(y_1) ~ t) # nolint
summary(model_y_1_propozycja_3)

a_0_propozycja_3 <- model_y_1_propozycja_3$coefficients[1]
a_1_propozycja_3 <- model_y_1_propozycja_3$coefficients[2]

y_1_t_propozycja_3 <- exp(a_0_propozycja_3) * exp(a_1_propozycja_3) ^ t # nolint

# Dzieli okienko wyświetlania wykresu na macierz 2x2
par(mfrow = c(2, 2))
plot(y_1)
plot(y_1_t_propozycja_1)
plot(y_1_t_propozycja_2)
plot(y_1_t_propozycja_3)

par(mfrow = c(1, 1))
plot(y_1, type = "p", pch = 1, col = "black", main = "Wykresy - trendy", xlab = "Lata", ylab = "Trendy") # nolint
lines(y_1_t_propozycja_1, type = "p", col = "blue", pch = 2)
lines(y_1_t_propozycja_2, type = "p", col = "green", pch = 3)
lines(y_1_t_propozycja_3, type = "p", col = "red", pch = 4)