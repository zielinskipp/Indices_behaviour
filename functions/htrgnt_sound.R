## Funkcja licząca indeksy akustyczne. Liczone indexy: H, Ht, Hs, ACI.

require(tuneR)
require(seewave)

htrgnt_sound <- function(sound){
  
  
  # Wektory do umiejscowienia obliczanych wartości danych (niby tak jest szybicej)
  
  
  ACI <- as.vector(NA, "numeric") 
  TH <- as.vector(NA, "numeric") 
  SH <- as.vector(NA, "numeric") 
  SHM <- as.vector(NA, "numeric") 
  
  
  
  data <- data.frame( ACI, TH, SH, SHM)
  n=0
  
  
    data$id[n+1] <- n+1
    data$SHM[n+1] <- sh(meanspec(sound, plot = 0))
    data$ACI[n+1] <- ACI(sound)
    data$TH[n+1] <- th(env(sound, plot = FALSE))
    data$SH[n+1] <- sh(spec(sound, plot = 0))
    
    
    
    
  
  
  data$H <- data$SHM*data$TH
  
  data
}
