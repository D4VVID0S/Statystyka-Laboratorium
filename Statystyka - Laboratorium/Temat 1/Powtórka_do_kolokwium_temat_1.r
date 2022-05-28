# Podaje nam informacje na temat funkcji mean
help(mean)

# Zmienne
Liczbowe
Czynnikowe (wyliczeniowe) # nolint
Znaki (łańcuchy znaków) - '' lub "" # nolint
Logiczne (T, F lub TRUE, FALSE)
    # Sprawdza czy zmienna kupa jest numeryczna
    kupa <- 2.0
    is.numeric(kupa)

# Wyświetlanie tekstu
cat('Klocki')

# Obieky
Wektory:
- c(PKOBP=3,PekaoSA=5)
- cbind(PKOBP=3,PekaoSA=5)
- rbind(PKOBP=3,PekaoSA=5)
    # Wyświetla wektor
    c(PKOBP=3,PekaoSA=5)
    cbind(PKOBP=3,PekaoSA=5)
    rbind(PKOBP=3,PekaoSA=5)

# Macierz na podstawie wektora
matrix(c(1, 2, 3, 4, 5, 6), nrow = 2, ncol = 3)
matrix(cbind(1, 2, 3, 4, 5, 6), nrow = 2, ncol = 3)
matrix(rbind(1, 2, 3, 4, 5, 6), nrow = 2, ncol = 3)

# Operatory przypisania wartości do zmiennych
=
<-
->
assign('Liczba', 100)
w <- 5:1 => w[2:4]
    w <- c(x=1,y=2,z=3) => w[c('x','z')]

# Operacje na plikach/katalogach oraz wczytywanie/zapis danych
getwd() - info o katalogu roboczym
setwd(sciezka) - zmiana katalogu roboczego
list.files()

read.table("NazwaPliku.xxx", header = T, sep = "\t", dec = ".", nrows = 10, skip = 0, ...)
read.csv2(...)
write.table(NazwaObiektu, file = "NazwaPliku.xxx", append = F, sep = "\t" , dec = ".", row.names = T, col.names = T, ...)
write.csv2(...)

# Plik musi być w tym samym folderze co source_code
PlikTestowyTXT <- read.table("Pd26III.txt", header = T, sep = "\t", dec = ".")
PlikTestowyCSV <- read.csv2("pd26III.csv", header = T, sep = ";", dec = ".")
# Wyświetlenie zawartość pliku
PlikTestowyCSV
Plik2 <- read.csv2("boe.csv", header = T, sep = ";", , dec = ".")
Plik2

# Instrukcje warunkowe
liczba <- 0
if (liczba > 0) {
    cat("ta liczba jest dodatnia \n")
    } else {
    if (liczba < 0) {
    cat("ta liczba jest ujemna \n")
    } else {
    cat("ta liczba jest równa zero \n")
    }
}

# Instrukcje logiczne: ifelse(warunki, instrukcja1, instrukcja2)
# Tworzy pętle która przechodzi w przedziale 1:10 i wyświetla "Mniejsza" dla liczb
# mniejszych od 6 albo "Wieksza" dla liczb większych od 6
ifelse(1:10 < 6, "Mniejsza", "Większa")

# switch(klucz, wart1=akcja1, wart2=akcja2, ..., wart3=akcja3) # nolint
wektor = c(1, 2, 3)
# wektor = as.logical(TRUE, FALSE) # nolint
switch(class(wektor),
logical = print("Typ logiczny."),
numeric = print("Typ liczbowy."),
character = print("Typ znakowy."),
factor = print("Typ czynnikowy."),
print("Trudno okreslic.")
)

# Pętle
# Pętle ignorują ostatnie przejście jak w Pythonie
# for (zmienna in zakres) instrukcja
kolorowe_indeksy <- c("Czerwony", "Niebieski", "Zielony")
for (i in kolorowe_indeksy)
    cat(paste("Kolor", i, "\n"))

# while (warunek) instrukcja
liczba <- 1
while (liczba < 30) {
    cat(paste("Dzień dobry! po raz", liczba, "\n"))
    liczba <- liczba + 1
}

# repeat instrukcja <- brak stopu => break
repeat{
    cat("Czy liczba wylosowana z [0,1] jest < 0.1?\n", runif(1), "Jeszcze nie ...\n")
    if (runif(1) < 0.1)
    break
}

# Funkcje
# Dzisiejsza data
# Definicja funkcji
dzisiejsza_data_1 <- function() {
cat("Today is: ", format(Sys.time(), "%a, %d, %b, Year %Y\n"))
}
# Użycie funkcji
dzisiejsza_data_1()

# Kalkulator
kalkulator <- function(a, b, stala = 5) {
wynik <- c(a + b, a - b, a * b, a / b)
wynik_1 <- wynik * stala
cat("Wynik: ", wynik,"\n")
cat(paste("Przeskalowany: ", wynik_1, "\n"))
}
kalkulator(4, 5)

# Anonimowe
sapply(c(1:5),function(x) x^2)

# Lub z większą liczbą znaków:
kwadrat_x <- function(x) {
x^2
}
sapply(c(1:5), kwadrat_x)

# Wykresy
plot(1:5, sin(-1:3))

# Zmienne dla poniższych wykresów
a <- -2
b <- 3
c <- -1
x <- c(-10:10)
plot(x, a * x + b, type <- "h")
plot(x, a * x ^ 2 + b * x + c, type = "b", pch = 1, col = "blue", main = "Parabola", xlab = "Argumenty funkcji f(x)", ylab = "Wartosci f(x)")

par(mfrow <- c(2, 1))
plot(x, a * x + b, type = "b")
plot(x, a * x^2 + b * x + c, type = "b", pch = 1, col = "blue", main = "Parabola", xlab = "Argumenty funkcji f(x)", ylab = "Wartosci f(x)")
lines(x, b * x + c, type = "p", pch = 3, col = "green")

# Tworzenie pliku PDF dla wykresu
pdf("ProstaParabola.pdf", width = 7, height = 6) # width, height - cale
# Tworzy podstawowy wykres
plot(x, a * x^2 + b * x + c, type = "b", pch = 1, col = "blue", main = "Prosta i Parabola", xlab = "Argumenty funkcji f(x)", ylab = "Wartosci f(x)", ylim = c(-40,15)) # nolint
# Dodaje linie przechodzące przez punkt (0, 0)
lines(x, b * x + c, type = "p", pch = 3, col = "green")
# Dodaje linie przechodzące przez punkt (0, 0)
points(x, a * x + c, type = "p", pch = 2, col = "red")
# Dodaje linie poziomą płaszczyzny
abline(h = 0, col = "grey", lwd = 1)
# Dodaje linie pionową płaszczyzny
abline(v = 0, col = "grey", lwd = 1)
# Dodaje legende
legend("bottomright", c("a * x^2 + b * x + c","b * x + c","a * x + c"), col = c("blue", "green", "red"), pch = c(1,3,2)) # nolint
# Kasuje cały wykres
dev.off()

# Wykresy 3D
# Do zainstalowania pakietów trzeba użyć
install.packages("plot3D")
install.packages("scatterplot3d")
library(plot3D)
library(scatterplot3d)

# Utworzenie zmiennych jako wektory
x <- c(1:20)
y <- c(runif(20))
z <- c(runif(20))

# Utworzenie histogramu w 3D
hist(x, 5)
scatterplot3d(x, y, z, highlight.3d = TRUE, col.grid = "lightblue" , pch=19)
example(scatter3D)
example(slice3D)

# Wykres funkcji sinus
plot(1:7, sin(-3:3), type = "b", pch = 3, col = "blue", main = "Sin(x)", xlab = "Argumenty funkcji sin", ylab = "Wartosci") # nolint

# Słupkowe
k1 <- sample(c(2, 3, 3.5, 4, 4.5, 5), 40, T)
k2 <- sample(c(2, 3, 3.5, 4, 4.5, 5), 40, T)
par(mfrow = c(1, 2))
barplot(k1)
barplot(k2)
par(mfrow = c(2,1))
barplot(sort(k1))
table(k1, k1)
barplot(table(k1, k1))
table(k1, k2)
par(mfrow = c(1,1))
barplot(table(k1, k2), col = rainbow(6), legend.text = T, beside = T)

# Pokazanie wszystkich dostępnych kolorów
colors()

# Wachlarzowe
install.packages("fanplot")
library("fanplot")

boe <- read.csv("boe.csv", header = T, sep = ";")
cpi2 <- read.csv("cpi2.csv", header = T, sep = ";")

y0 <- 2011
boe0 <- subset(boe, time0 == y0)
k <- nrow(boe0)
 
cpisim <- matrix(NA, nrow = 10000, ncol = k) #simulate future values
for (i in 1:k)
   cpisim[,i] <- rsplitnorm(n = 10000, mode = boe0$mode[i], sd = boe0$uncertainty[i], skew = boe0$skew[i]) # nolint

cpi0 <- ts(cpi[time(cpi)<2013],start=start(cpi),frequency=frequency(cpi)) # truncate cpi series # nolint
 
plot(cpi0, type = "l", lwd = 2, xlim = c(y0 - 5, y0 + 3.25), ylim = c(-2, 7)) # past data # nolint
 
fan(data = cpisim, start = y0, frequency = 4) # add fan