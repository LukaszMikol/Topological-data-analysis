library("TDA")

read_club_names <- function(path) {
  # wczytywanie pliku ze statystykami klubowymi  
  data <- read.csv(file=path, header=TRUE, sep=",")
  # pobranie wyłącznie nazw klubów
  name_clubs <- data$Club
  # dodanie do nazw klubów rozszerzenia: "_version_2.csv"
  names <- paste(name_clubs, "_version_2.csv", sep="")
  return(names)
}

club_names <- read_club_names("TeamStats.csv")

pdf("clubs_barcode.pdf")
par(mfrow=c(2,1))

for(club in club_names){
  data_clubs <- read.csv(paste("clubs_csv", club, sep="/"), header = TRUE)
  club <- gsub('.{14}$', '', club) 
  diag.info <- ripsDiag(X=data_clubs, maxdimension=ncol(data_clubs), maxscale=1, 
                        dist="euclidean", library="GUDHI", printProgress=FALSE)
  
  plot(diag.info$diagram, barcode=TRUE, main=club)
}

dev.off()
