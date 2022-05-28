# Ustalenie poprawnej ścieżki
getwd()
setwd("./Kolokwium")

# A1
Z4 <- read.csv2("Z4.csv", header = T, sep = ";", dec = ".")
Z4

# A2
EX <- mean(Z4$Z4)
EX

# A2
mediana <- median(Z4$Z4)
mediana

# A2
pierwszy_kwantyl <- quantile(Z4$Z4, c(0.05))
pierwszy_kwantyl

# A3


# A4
kwantyl <- as.vector(quantile(Z4$Z4))
Q <- (kwantyl[4] - kwantyl[2]) / 2

czy_odstaje <- if(min(Z4$Z4) < kwantyl[2] - 3 * Q) {
  print("Ujemne wartosci odstajace")
  } else {
    if(min(Z4$Z4) < kwantyl[2] - 3 * Q){
      print("Ujemne wartosci odstajace")
      } else {
        print("Brak wartosci odstajacych")
        }
      }

# A5
histogram <- hist(Z4$Z4, breaks = 4, plot = T, col = rainbow(5), labels = TRUE)

# Własna funkcja
cat(
    sprintf("Załadowano plik Z4:\n"),
    sprintf("Średnia arytmetyczna Z4: %f\n", EX),
    sprintf("Mediana Z4: %f\n", mediana),
    sprintf("Pierwszy kwantyl: %f\n", pierwszy_kwantyl),
    sprintf("Obserwacje odstające: %s\n", czy_odstaje),
    sep = "\n"
)
