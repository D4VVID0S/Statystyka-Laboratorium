# Czytanie pliku ProdukcjaPrzychody
dane <- read.csv2("ProdukcjaPrzychody.csv", head = T)

# Przypisanie zmiennej X kolumnę produkcja
X <- dane$produkcja

# Przypisanie zmiennej Y kolumnę przychody
Y <- dane$przychody

# Ilość zmiennych
N <- length(X)

# Średnia w kolumnie produkcja
sredniaX <- mean(X)

# Średnia w kolumnie prychody
sredniaY <- mean(Y)

kwadratXsrX <- (X - sredniaX)^2
kwadratYsrY <- (Y - sredniaY)^2

iloczynXsrX_YsrY <- (X - sredniaX) * (Y - sredniaY)

sumaKwadratXsrX <- sum(kwadratXsrX)
sumaKwadratYsrY <- sum(kwadratYsrY)

# Odchylenie standardowe
sumaOdchylenOdSredniejXY <- sum(iloczynXsrX_YsrY)

sqrtX <- sqrt(sumaKwadratXsrX / N)
sqrtY <- sqrt(sumaKwadratYsrY / N)

covXY <- sumaOdchylenOdSredniejXY / N

# Współczynnik Korelacji Pearsona
wspKorPearsona <- (sumaOdchylenOdSredniejXY / N) / (sqrtX / sqrtY)

# Współczynnik Pearsona ^2 = Współczynnik detetrminacji

# Wydrukowanie na konsole tak jak w C
cat(
    sprintf("Odchylenie standardowe X: %f", sqrtX),
    sprintf("Odchylenie standardowe Y: %f", sqrtY),
    sprintf("Kowariancja (X, Y): %f", covXY),
    sprintf("Współczynnik Korelacji Pearsona: %f", wspKorPearsona),
    # Separator nowej linii
    sep = "\n"
)

# Funkcja regresji: y = a + bx
b = covXY / sqrtX^2
a = sredniaY - b * sredniaX

parametry2k <- c(a, b)

cat(
    sprintf("Funkcja regresji: ^y = %f + %f * x", a, b),
    sep = "\n"
)

# Wykres
# Utworzenie wykresu punktowego
plot(X, Y, pch = 15, cex = 1.5)
# Dodanie linii funkcji liniowej do wykresu
abline(a, b)

# Ocena dopasowania liniowej funkcji regresji do danych empirycznych
# Liczba parametrów
k = 2

Yteor = a + b * X

# Reszty
# e_t = y_t - y^t_i
reszty = Y - Yteor

sumaKwadratyReszt = sum(reszty^2)

wariancjaReszt = sumaKwadratyReszt / (N - k)
odchStandReszt = sqrt(wariancjaReszt)
wspZmienReszt = 100 * odchStandReszt / sredniaY
wspZbieznosci = sumaKwadratyReszt / sumaKwadratYsrY
wspDeterminacji = 1 - wspZbieznosci

cat(
    sprintf("Wariancja resztowa: %f", wariancjaReszt),
    sprintf("Odchylenie standardowe reszt: %f", odchStandReszt),
    sprintf("Współczynnik zmienności resztowej: %f", wspZmienReszt),
    sprintf("Współczynnik zbieżności: %f", wspZbieznosci),
    sprintf("Współczynnik determinacji R^2: %f", wspDeterminacji),
    sep = "\n"
)

# Prognoza x_progn

# Bezwględny błąd prognozy ex ante

DYp <- function(xprognoza) {
    odchStandReszt * sqrt((1 + 1/N + sum((xprognoza-sredniaX)^2) / sumaKwadratXsrX))
}

# Względny błąd prognozy ex ante:
V_Yp <- function(xprognoza, yprognoza){
    DYp(xprognoza) / yprognoza
}

xprogn <- c(15.734)
yprogn <- function(xprognoza, parametry){
    parametry[1] + parametry[2] * xprognoza
}

Yprognoza <- yprogn(xprogn, parametry2k)

V_Yp(xprogn, Yprognoza)

# VYp <- DYp(xprogn)/Yprognoza