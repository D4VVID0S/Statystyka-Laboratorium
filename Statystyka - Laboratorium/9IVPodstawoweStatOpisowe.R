### Podstawowe statystyki
wiek <- read.csv2("wiek.csv", header = T)
# Średnia - mean(wiek$wiek)
EX <- mean(wiek$wiek)
# mean(wiek#wiek) - wyświetla od razu wartość w terminalu bez zapisywania jej do zmiennej
# Wariancja próbki
varX <- var(wiek$wiek)
# Odchylenie standardowe
sdX <- sd(wiek$wiek)

# Średnie
install.packages("psych")
library("psych")
# Średnia arytmetyczna
mean(wiek$wiek)
# Średnia ważona
weighted.mean(wiek$wiek)
# Średnia harmoniczna
harmonic.mean(wiek$wiek)
# Średnia geometryczna
geometric.mean(wiek$wiek)

# Pozostałe statystyki
# Tworzy tabele z danych pobranych z pliku
tabelaWiek <- table(wiek$wiek)
tabelaWiek
# Tworzy rozkład i wyświetla tylko ile razy występuje dana wartość
rozkladWiek <- as.vector(tabelaWiek)
rozkladWiek
# Tworzy rozkład i wyświetla tylko wartości (odwrotność co do as.vector(tabelaWiek)) # nolint
niepowtarzalneWiek <- as.numeric(names(tabelaWiek))
niepowtarzalneWiek
# Wartość która występuje najwięcej razy ponieważ jest użyte which.max
dominanta1a <- niepowtarzalneWiek[which.max(rozkladWiek)]
dominanta1a
dominanta1b <- names(sort(tabelaWiek, decreasing = T)[1]) #tekstowo
dominanta1b

sortWiek <- names(sort(tabelaWiek, decreasing = T))
# dominanta1b <- sortWiek[1]


# dominanta2 <- niepowtarzalneX[which.max(tabulate(match(wiek$wiek,niepowtarzalneX)))]

# niepowtarzalneX = unique(wiek$wiek)
# dominanta3 <- niepowtarzalneX[which.max(tabulate(match(wiek$wiek,niepowtarzalneX)))]

histogram <- hist(wiek$wiek, breaks = 5, plot = T)

rozklad <- (histogram$counts / sum(histogram$counts)) * 100

z1 <- rozklad[3]
z2 <- sum(rozklad[1:3])

cat("Osoby w wieku 31-40 lat stanowi1", z1, "% pracowniókw firmy.") # message("Osoby w wieku 31-40 lat stanowi1 ", z1 , "% pracowników firmy.") # nolint
cat("Osoby nieprzekraczaj1ce 40 lat stanowi1", z2, "% pracowników firmy.")


# Obserwacje odstające?

kwantyl <- as.vector(quantile(wiek$wiek))
Q <- (kwantyl[4] - kwantyl[2]) / 2

if(max(wiek$wiek) > kwantyl[4] + 3 * Q) {
  print("Dodatnie wartosci odstajace")
  } else {
    print("Brak wartosci odstajacych")
    }
if(min(wiek$wiek) < kwantyl[2] - 3 * Q) {
  print("Ujemne wartosci odstajace")
  } else {
    print("Brak wartosci odstajacych")
    }

# razem:
if(min(wiek$wiek) < kwantyl[2] - 3 * Q) {
  print("Ujemne wartosci odstajace")
  } else {
    if(min(wiek$wiek) < kwantyl[2] - 3 * Q){
      print("Ujemne wartosci odstajace")
      } else {
        print("Brak wartosci odstajacych")
        }
      }

# KWANTYLE + MIERNIKI # nolint

dane <- read.csv2("wydajnosc.csv", header = TRUE, sep = ",")

quantile(dane$Wydajnosc, c(0.05)) #kwantyle 0.05
quantile(dane$Wydajnosc, c(0.25)) #kwantyle 0.25
quantile(dane$Wydajnosc, c(0.5)) #kwantyle 0.5
quantile(dane$Wydajnosc, c(0.75)) #kwantyle 0.75
quantile(dane$Wydajnosc, c(0.95)) #kwantyle 0.95
plot(ecdf(dane$Wydajnosc)) #dystrybuanta empiryczna - szereg punktowy

## MIERNIKI:
wydajnoscTabela <- table(dane$Wydajnosc)
wydajnoscRozklad <- as.vector(wydajnoscTabela)
niepowtarzalneW <- as.numeric(names(wydajnoscTabela))


mierniki <- function(dane, niepowtarzalne, rozklad) {
  miernik <- list()
  n <- sum(rozklad)
  miernik$EX <- sum(niepowtarzalne * rozklad) / n
  miernik$med <- median(dane$Wydajnosc)
  miernik$varX <- sum(((niepowtarzalne - EX)^2) * rozklad) / n
  miernik$sd <- (miernik$varX)^(1 / 2)
  miernik$WspZmiennosci <- miernik$sd / miernik$EX * 100
  miernik
}

RozdzielczyPunktowyMierniki <- mierniki(dane,niepowtarzalneW, wydajnoscRozklad)

cat(
  sprintf("Miary - szereg rozdzielczy punktowy: "),
  sprintf("EX: %f", RozdzielczyPunktowyMierniki$EX),
  sprintf("Wariancja X: %f", RozdzielczyPunktowyMierniki$varX),
  sprintf("Odchylenie standardowe X: %f", RozdzielczyPunktowyMierniki$sd),
  sprintf("Wspolczynnik zmiennosci X=sdX/meanX: %f", RozdzielczyPunktowyMierniki$WspZmiennosci), # nolint
  sprintf("3-ci moment centralny X: %f", RozdzielczyPunktowyMierniki$EX3), # nolint
  sprintf("4-ty moment centralny X: %f", RozdzielczyPunktowyMierniki$EX4), # nolint
  sprintf("Wspolczynnik asymetrii X: %f", RozdzielczyPunktowyMierniki$WspAsymetrii), # nolint
  sprintf("Kurtoza X: %f", RozdzielczyPunktowyMierniki$Kurtoza), # nolint
  sprintf("Wspolczynnik ekscesu X: %f", RozdzielczyPunktowyMierniki$WspEkscesu), # nolint
  sep = "\n"
)

### WYKRESY

par(mfrow = c(2, 1))

## wykres dystrybuanty empirycznej
# - szereg punktowy
rozklad <- table(dane$Wydajnosc) / length(dane$Wydajnosc)
dystrybuanta <- cumsum(rozklad)
plot(as.numeric(names(dystrybuanta)), dystrybuanta, type = "s", main = "Dystrybuanta empiryczna - szereg punktowy", xlab = "Wydajność", ylab = "P-stwo") # nolint

# - szereg przedzia3owy
krok <- 2
przedzialy <- seq(min(dane$Wydajnosc) - krok, max(dane$Wydajnosc) + 2 * krok, by = krok) # nolint
rozkladPrzedzialowy <- table(cut(dane$Wydajnosc, przedzialy, right = F)) / length(dane$Wydajnosc) # nolint
dystrybuantaPrzedzialowa <- cumsum(rozkladPrzedzialowy) # nolint
plot(dystrybuantaPrzedzialowa, type = "s", main = "Dystrybuanta empiryczna - szereg przedzia3owy", xlab = "Wydajność - przedziały", ylab = "P-stwo", xaxt = "n") # nolint
axis(1, labels = names(dystrybuantaPrzedzialowa), at = 1:length(names(dystrybuantaPrzedzialowa))) # nolint