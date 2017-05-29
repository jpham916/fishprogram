#functionFile

fishStats <- function(price, frequency, showGraph){
  
  FishPrices <- read.csv(price, header= TRUE)
  Fishlocations <- read.csv(frequency, header= TRUE)
  
  mergedfish <- merge(Fishlocations,FishPrices,by=c ("Fish"))
  
  alaska <- as.character(mergedfish[which.max(mergedfish$Alaska),1])
  ff <- as.character(mergedfish[which.max(mergedfish$Frewfarms),1])
  tt <- as.character(mergedfish[which.max(mergedfish$Taguetown),1])
  
  mostabundant <- c(alaska,ff,tt)
  placeNames <- c("Alaska","Frew Farms", "Tague Town")
  abundTable <- cbind(placeNames, mostabundant)
  colnames(abundTable) <- c("Location","Most Abundant Fish")
  abundTable <- as.data.frame(abundTable)
  
  alaskasum <- sum(mergedfish$Alaska*mergedfish$X..lb)
  taguesum <- sum(mergedfish$Taguetown*mergedfish$X..lb)
  frewsum <- sum(mergedfish$Frewfarms*mergedfish$X..lb)
  total <- alaskasum+taguesum+frewsum
  
  revenue <- c(alaskasum,taguesum,frewsum,total)
  placeNames <- c("Alaska","Frew Farms", "Tague Town", "Total")
  revenueTable <- cbind(placeNames,revenue)
  colnames(revenueTable) <- c("Location","Revenue")
  
  
  mergedfish$FisherySum <- (mergedfish$Alaska + mergedfish$Frewfarms + mergedfish$Taguetown)
  
  
  revenueTabledf <- as.data.frame(revenueTable)
  revenueTabledf$Revenue <- as.numeric(as.character(revenueTabledf$Revenue))
  
  Revplot <- ggplot(data = revenueTabledf, aes(x=Location, y = Revenue)) + geom_bar(stat="identity") + ylim(0,total + 200)
  
  showGraph <- showGraph
  
  return(list(abundance = abundTable,revenue = revenueTabledf, showGraph = showGraph, revenueplot = Revplot))
}