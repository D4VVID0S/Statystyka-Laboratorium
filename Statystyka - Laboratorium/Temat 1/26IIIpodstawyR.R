#	1.1 Instalacja
a)  Środowisko: //cran.r-project.org,
b)  pakiety (biblioteki):
    b1) install.packages(''pakiet'', dependencies=TRUE),
    b2) Ładowanie:
        b2.1) library(pakiet) - ładowanie biblioteki + sygnalizacja potencjalnego jej braku (przerwanie programu),
        b2.2) require(pakiet) - ładowanie biblioteki + ostrzeżenie o braku (kontynuacja programu z wartościami FALSE),

#	1.2 Pomoc (wrażliwy na małe i duże litery)
a)  manual
b1) linia polecenia - ogólnie: help() / help(Funkcja) / ?Funkcja
b2) args(Funkcja) <- lista argumentów funkcji Funkcja
b3) example()
b4) apropos()
b5) help.search()

##	2. Elementy składni w R

#   2.1 Typy obiektów (wszystko co w skrypcie)
a) liczbowy (110 =1.1e2, 0.011=1.1e-2, NaN - not a number, Inf, -Inf)
b) czynnikowy (wyliczeniowy) - opisuje kategorie (np. płeć, kolor, czynnik, poziom, etc...)
    stosowany do grupowania danych za pomocą konstruktora factor():plec = factor(c('kobieta', 'mezczyzna', 'kobieta', 'mezczyzna', 'mezczyzna'))
c) znakowy (łańcuchy znaków): łańcuchy znaków w '' lub ""  i wyświetlane za pomocą cat() lub łączone - paste() + znaki specjalne:
    \t - tabulator
    \n - nowa linia
    \\ - backslash
    \  - itd.  
d) logiczny (T, F lub TRUE, FALSE)
   weryfikacja typu: is., gdzie  to:
        character
        numeric
        integer
        double
        factor
        NA (nieokreślony)
        NaN (niewłaściwa liczba) 
   lub zamiana: as. - analogicznie do is.

#	2.2 Obiekty
a) wektor: c(), cbind(), rbind()
    np: c(1:3), c(PKOBP=3,PekaoSA=5), c(1,NA,3)
b) lista: list() - uporządkowany zbiór obiektów z dopuszczalnymi różnymi typami:
    list(bank=c('A', 'B')
    KwotaTransakcji = c(125,521))
c) macierz: matrix(* ,n , m) - macierz o n wierszach i m kolumnach (kolumnowo)
d) ramka danych: data.frame() - lista wektorów identycznej długości, ale np. różnych typach kolumnowych  
e) funkcje: function()

# 2.3 Operatory przypisania wartości do zmiennych
=
<-
->
assign('liczba', 100)

# 2.4 Indeksy
a) [] w wektorze
    w <- 5:1 => w[2:4]
    w <- c(x=1,y=2,z=3) => w[c('x','z')]
b) [,] w macierzy/ramce danych
[n,], [,m], [n,m]
c) lista$zmienna w liście
    TransakcjeBankow <- list(bank=c('A', 'B')
    KwotaTransakcji = c(125,521)) => TransakcjeBankow$bank
d) pojedynczy element (podpunkty (a) i (c))
    [[]] => TransakcjeBankow[[1]][2]

# 2.5 Sekwencje
n:m
seq(n,m,by=k)
czyli n, n + k, n + 2k, ...
oraz seq(n, m, length.out = k), k - liczba elementów w tej sekwencji

## 3. Operacje na plikach/katalogach oraz wczytywanie/zapis danych
a1) getwd() - info o katalogu roboczym
a2) setwd(sciezka) - zmiana katalogu roboczego,
a3) list.files()

b11) read.table(''NazwaPliku.xxx'', header = T, sep = "\t", dec = ".", nrows = 10, skip = 0, ...)
b12) read.csv2(...)
b21) write.table(NazwaObiektu, file = "NazwaPliku.xxx", append = F, sep = "\t" , dec = ".", row.names = T, col.names = T, ...)
b22) write.csv2(...)

# Ustawienie poprawnej ścieżki, nie trzeba podawać pełnej ścieżki 
setwd("./Temat 1")
# Nie trzeba zmieniać ścieżki, można dodać rozwinięcie ścieżki w nazwie pliku do wczytania
PlikTestowyTXT <- read.table("Temat 1/pd26III.txt", header = T, sep = "\t", dec = ".")
PlikTestowyCSV <- read.csv2("pd26III.csv", header = T, sep = ";", dec=".")
