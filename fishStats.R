#functionFile

fishStats <- function(price, frequency, showGraph){
  
  FishPrices <- read.csv(price, header= TRUE)
  Fishlocations <- read.csv(frequency, header= TRUE)
  
  mergedfish <- merge(Fishlocations,FishPrices,by=c ("Fish"))
  mergedfish

alaska <- as.character(mergedfish[which.max(mergedfish$Alaska),1])
ff <- as.character(mergedfish[which.max(mergedfish$Frewfarms),1])
tt <- as.character(mergedfish[which.max(mergedfish$Taguetown),1])

mostabundant <- c(alaska,ff,tt)
placeNames <- c("Alaska","Frew Farms", "Tague Town")
abundTable <- cbind(placeNames, mostabundant)
colnames(abundTable) <- c("Location","Fish")

}
