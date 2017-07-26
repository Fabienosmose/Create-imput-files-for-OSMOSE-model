rm(list=ls())

tab <- read.csv("C:/Users/Fabien/Documents/OSMOSE-MED/Inputs R/fisheries_season.csv")
dat <- tab[,-c(1)]
setwd(dir = "C:/Users/Fabien/Documents/OSMOSE-MED/Inputs R/fishery")

vec <- seq(0, (ncol(dat)-1),1)
for (i in 1:length(vec)) {
  filename = paste0("fishing-seasonality-",names(dat[i]), ".csv")
  df <- data.frame(tab$Time,dat[,i])
  colnames(df) <- c("Time","Season")
  write.csv(df,filename,row.names = F)
}