## Funkcja licząca indeksy akustyczne dla całego nagrania dla 30 sekundowych
#odcinków czasu. Liczone indexy: H, Ht, Hs, ACI.

require(tuneR)
require(seewave)

htrgnt <- function(file, directory, time_window = 30){
  file_name <- file
  file <- paste0(directory, file)
    

  ## Wczytuje nagłówek pliku .wav, skąd bierze informacje o liczbie próbek
  # i częstotliwości próbkowania. 
  
  # l - czas w minutach, f - czestotliwość próbkowania, tw - okno czasowe
  wave_head <-readWave(file, header = TRUE)
  l <- as.integer(wave_head$samples/wave_head$sample.rate)
  f <- wave_head$sample.rate
  tw <- time_window
  
  ##Ile weźmie próbek w nagraniu
  nsamples <- l/tw
  
  ## Odczytuje z nazwy godzinę rozpoczęcia nagrania.
  
  name_time <- substr(file_name, start = 4, stop = 18)
  starttime <- as.POSIXct(name_time, format = "%Y%m%d_%H%M%S")
  coord <- substr(file_name, start = 1, stop = 2)
  
  
  # Wektory do umiejscowienia obliczanych wartości danych (niby tak jest szybicej)
  coord <- coord
  freq <- f
  id <- 1:nsamples
  ACI <- as.vector(rep(NA, nsamples), "numeric") 
  TH <- as.vector(rep(NA, nsamples), "numeric") 
  SH <- as.vector(rep(NA, nsamples), "numeric") 
  SHM <- as.vector(rep(NA, nsamples), "numeric") 
  realtime <- as.POSIXct(as.vector(rep(NA,nsamples), "character")) ###Zobacz, czy dziala
  
  
  data <- data.frame(id, coord, freq, ACI, TH, SH, SHM,
                     realtime)
  
  
  for(n in 0:nsamples-1){
    sound <- readWave(file, from = 1 + n * tw, to = tw + 1 + n * tw, units  ="seconds")
    
    
    data$id[n+1] <- n+1
    data$SHM[n+1] <- sh(meanspec(sound, plot = 0))
    data$ACI[n+1] <- ACI(sound)
    data$TH[n+1] <- th(env(sound, plot = FALSE))
    data$SH[n+1] <- sh(spec(sound, plot = 0))
    data$realtime[n+1] <- starttime + n * tw
    
    
    
  }
  
  data$H <- data$SHM*data$TH
  data$filename <- file_name
  data
}
