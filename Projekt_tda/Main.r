# instalowanie biblioteki 'TDA'
if (!require(package="TDA")) {
  install.packages(pkgs="TDA", dependencies=TRUE)
}

# podłączenie biblioteki do kodu
library("TDA")


########################################
# funkcja, która ma na celu ujednolicenie dla wszystkich klubów tych samym miar od 0 do 1,
# aby wyniki poszczególnych cech były zapisane w przedziale od 0 do 1 i dla wszystkich klubów były
# miarodajne. 
normalize <- function(data, max1) {
  nData <- data
  for(i in c(1:length(data))) {
    # funkcja scale, przyjmuje daną kolumnę, zakres od 0 do max, która normalizuje wartości 
    # kolumny, w przedziale od 0 do 1
    nData[i] <- scale(data[i], center = 0, scale = max1[i])
  }
  return(nData)
}
########################################

 
# zmienna rank przechowywuje statystyki wszyskich klubów angielskich
rank <- read.csv(file="./TeamStats.csv", header=TRUE, sep=",")
# pobierane są nazwy klubów. Akutalne pozycje w tabeli ligii angielskiej.
clubs_rank <- rank$Club
# w miejsce wszystkich spacji dodaje znak -
clubs_rank <- gsub(" ", "-", clubs_rank)
# dodaje do każdej nazwy klubu rozszerzenie ".csv"
clubs_rank <- paste(clubs_rank, ".csv", sep="")

# wyszukanie maksymalnych wartości
conditions = c("Goals", "Shots", "Passes","Shots.on.target", "Accurate.long.balls", "Big.chances.created")

# wstępne cechy brane pod uwagę w przypadku badania defensywy.
#conditions = c("Fouls", "Tackle.success..", "Blocked.shots", "Clearances", "Recoveries", "Duels.won", "Aerial.battles.won")

iter <- 0
max1 <- c()



##########################################
#
# Pętla ta ma na celu przeszukanie wszystkich klubów, by ustalić maksymalne wartości dla
# zespołów w sezonie. Będzie to potrzebne, podczas tworzenia skali. 
# Gdzie min - max. Musimy przeprowadzić normalizacje, aby dane były poprawne. 
#
##########################################


for(klub in clubs_rank){
  iter <- iter + 1

  # clubs/[nazwa_klubu].csv - uniwersalna scieżka dostępu do pliku
  # wczytwanie statystyk do dataFrame
  data <- read.csv(paste("clubs",klub,sep="/"),header = TRUE)

  # sortuje malejące wg. goli
  data <- data[order(-data$Goals),]
  data <- data[1:10,] # pobieranie 10 zawodników

  # wybranie kolumn do przetwarzania
  data <- data[conditions]

  # jeżeli wartoś w wierszu wyności NA to 0
  data[is.na(data)] <- 0

  # funkcja apply (dane_do_badania, [2, czyli branie pod uwagę wierszy], [max – maksymalna wartość])
  # funkcja zwraca maksymalne wartości [statysyki] dla każdego wiersza [każdego zawodnika] 
  current <- apply(data, 2, max)

  if (iter > 1) {
    # zwraca większą wartość z dwóch podanych. Maxp funkcja dla data frame
    max1 <- pmax(max1, current)
  } else {
    max1 <- current
  }
}

# otwarcie pliku pdf na dysku
pdf("all_clubs_diag.pdf")

# paruj w pdf jako 2 wiersze i 1 kolumna. Czyli dwa wykresy na jednej stronie
par(mfrow=c(2,1))

# główny program zapisujący do pliku wykresy typu barcode, od pierwszej drużyny w tabeli wg. rankingu
for(klub in clubs_rank){

  # wczytwanie statystyk do dataFrame
  data <- read.csv(paste("clubs",klub,sep="/"),header = TRUE) 
  
  # zamiana wartości NA na 0
  data[is.na(data)] <- 0 

  # <FILTROWANIE DANYCH>
  # sortowanie malejąco wg ilości strzelonych goli
  data <- data[order(-data$Goals),] 
  
  # pobieranie 10 zawodnikow
  data <- data[1:10,] 

  # wybranie kolumn do przetwarzania
  data <- data[c(conditions)]
  
  #zamiana wartosci NA na 0
  data[is.na(data)] <- 0 
  # </FILTROWANIE DANYCH>

  
  # <WYŚWIETLANIE DANYCH>
  # normalizajca danych w przedziale od 0 do 1
  nData <- normalize(data, max1)
  
  # usunięcie z nazwy drużyny rozszerzenia pliku
  klub <- gsub('.{4}$', '', klub) 
  
  # zamiana w nazwie drużyny "-" na spacje
  klub <- gsub('-', ' ', klub) 

  # ripsDiag funkcja, która tworzy diagram na podstwie chmury punktów
  diag.info <- ripsDiag(X=nData, maxdimension=ncol(nData), maxscale=1, dist="euclidean", library="GUDHI", printProgress=FALSE)

  # rysuje i zapisuje do pliku pdf barcody [wykresy słuppkowe] przedstawiające wymiary 0 i 1
  plot(diag.info$diagram, barcode=TRUE, main=klub)
  # </WYŚWIETLANIE DANYCH>
  
}

# zamknięcie pliku pdf na dysku
dev.off()

