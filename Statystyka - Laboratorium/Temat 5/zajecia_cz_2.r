W <- c(2051.74, 2152.99, 2225.41, 2276.84, 2405.46, 2528.62, 2662.51, 2899.83, 3096.55, 3243.6, 3438.21, 3586.75, 3690.3, 3823.32, 3942.67, 4066.95, 4218.92, 4255.59) # nolint
M <- c(1923.98, 2062.69, 2134.68, 2201.64, 2309.52, 2402.46, 2521.16, 2739.18, 3000.11, 3156.14, 3273.88, 3458.80, 3585.86, 3706.90, 3839.77, 3968.01, 4118.63, 4271.36) # nolint

# M - cena metra kwadratowego
# M ~ a_0 + a_1 * W # nolint

wsp_korelacji_pearsona <- cor(W, M)
wsp_korelacji_pearsona

R_2 <- wsp_korelacji_pearsona ^ 2
setwd("./Temat 5")

install.packages(stats)
library(stats)
install.packages("corrplot")
library(corrplot)

dane_1 <- read.csv2("LAB_lm1_dane.csv", header = T, sep = ";", dec = ".")
dane_1_kor <- cor(dane_1)
corrplot(dane_1_kor)
summary(lm(dane_1$y ~ dane_1$x1 + dane_1$x2))
# Usuwając zmienną x1 tracimy prawie 20 przy Multiple R-squared
summary(lm(dane_1$y ~ dane_1$x2))

dane_2 <- read.csv2("LAB_lm2_dane.csv", header = T, sep = ";", dec = ".")
dane_2_kor <- cor(dane_2)
corrplot(dane_2_kor)
model_TIPN <- lm(dane_2$T ~ dane_2$I + dane_2$P + dane_2$N) # nolint
summary(model_TIPN)
# Wyrzucamy zmienną I
model_TIPN <- lm(dane_2$T ~ dane_2$P + dane_2$N) # nolint
summary(model_TIPN)
# Wyrzucamy zmienną N
model_TIPN <- lm(dane_2$T ~ dane_2$I + dane_2$P) # nolint
summary(model_TIPN)
# Wyrzucenie zmiennej I powoduje większe straty niż wyrzucenie zmiennej N

dane_3 <- read.csv2("LAB_lm3_dane.csv", header = T, sep = ";", dec = ".")
dane_3_kor <- cor(dane_3)
corrplot(dane_3_kor)
# Najważniejsza zmienna jest X1 ponieważ jako jedyna posiada jakikolwiek significant code
model_y_x1_x2_x3 <- lm(dane_3$Y ~ dane_3$X1 + dane_3$X2 + dane_3$X3)
summary(model_y_x1_x2_x3)

model_y_x1_x3 <- lm(dane_3$Y ~ dane_3$X1 + dane_3$X3)
summary(model_y_x1_x3)
# Wyrzucenie X2 zmniejsza Multiple R-squared ale uzyskaliśmy mniej parametrów do szacowania
# tz. że, pozostałe zmienne zdobyły więcej wagi i znaki significant code

model_y_x1_x2 <- lm(dane_3$Y ~ dane_3$X1 + dane_3$X2)
summary(model_y_x1_x2)
# Wyrzucenie X3 zmienjsza Multiple R-squared i Adjusted R-squared zatem ogólny wynik jest gorszy
# Lepiej jest wyrzucić zmienną X2

model_y_x2_x3 <- lm(dane_3$Y ~ dane_3$X2 + dane_3$X3)
summary((model_y_x2_x3))