#functionFile

fishStats <- function(price, frequency, showGraph){
  
  FishPrices <- read.csv(price, header= TRUE)
  Fishlocations <- read.csv(frequency, header= TRUE)
  
  mergedfish <- merge(Fishlocations,FishPrices,by=c ("Fish"))
  
  mergedfish
  
}