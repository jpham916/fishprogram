


genlocation <- function(filename = "Fishsite.txt"){
  
  possibleFish <- c("Cod", "Haddock", "Salmon", "Trout", "Tilapia")
  nfish <- NROW(possibleFish)
  
  
  Location1 <- round(runif(nfish,3,50),0)
  Location2 <- round(runif(nfish,3,50),0)
  Location3 <- round(runif(nfish,3,50),0)
  
  SiteTable <- cbind(possibleFish, Location1, Location2, Location3)
  
  colnames(SiteTable) <- c("Fish", "Alaska", "Frewfarms", "Taguetown")
  
  write.csv(SiteTable,filename, row.names = FALSE)
  
  return(SiteTable)
}
genlocation()

