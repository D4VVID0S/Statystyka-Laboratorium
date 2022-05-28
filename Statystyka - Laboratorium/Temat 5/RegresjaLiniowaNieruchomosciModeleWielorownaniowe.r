### Regresja liniowa - redukcja zmiennych
# Agencja pośrednictwa nieruchomościami trudni się m.in. sprzedażąmieszkań na rynku wtórnym. # nolint
# W przypadku 10 mieszkań zanotowano następujące cechy:
# cena mieszkania w tysiącach (x1), liczba pokoi (x2), metraż mieszkania (x3) oraz nr piętra, # nolint
# gdzie 0 oznacza parter (x4). Na podstawie poniższych danych zbadaj,
# czy istnieje zależność pomiędzy ceną mieszkania oraz pozostałymi cechami.
# Uzasadnij odpowied� korzystaj�c z regresji liniowej.
# Ponadto wyznacz współczynnik korelacji wielorakiej dla odpowiednich kombinacji zmiennych. # nolint

x1<-c(300,350,220,370,280,340,400,320,150,280)
x2<-c(2,3,2,4,3,3,3,2,1,2)
x3<-c(40,48,42,60,48,45,55,40,20,28)
x4<-c(1,4,3,3,4,2,2,1,3,1)

library(corrplot)

x<-cbind(x1,x2,x3,x4)
xkor<-cor(x)
corrplot(xkor)

x<-lm(x1~x2+x3+x4)
summary(x)

xx3<-lm(x1~x2+x4)
summary(xx3)

#cor(x2,x3)


########################################################################
# MODELE WIELOR�WNANIOWE
#
# Wielor�wnaniowy model ekonometryczny w kt�rym:
# - na przewozy transportem kolejowym ma wp�yw �rednie miesi�czne wynagrodzenie netto oraz liczba samochod�w,
# - liczba wypadk�w drogowych zale�y od liczby samochod�w oraz d�ugo�ci dr�g,
# - liczba samochod�w jest uzale�niona od liczby wypadk�w i �rednich wynagrodze�;


library(sem)
library(systemfit)

przewozy<-read.csv("Przewozy.csv",header=TRUE,sep=";")

tsls(P~W+LS,~W+D,data=przewozy)
tsls(LW~LS+D,~W+D,data=przewozy)
tsls(LS~W+LW,~W+D,data=przewozy)

# systemfit.R

rown1<-P~W+LS
rown2<-LW~LS+D
rown3<-LS~W+LW

lista3=list(rown1,rown2,rown3)

#ols
mnkpods=systemfit(lista3,method="OLS",data=przewozy)
summary(mnkpods)
#2sls
instrumenty=~W+D
mnk2pods=systemfit(lista3,method="2SLS",inst=instrumenty,data=przewozy)
summary(mnk2pods)

#3sls
mnk3pods=systemfit(lista3,method="3SLS",inst=instrumenty,data=przewozy)
summary(mnk3pods)