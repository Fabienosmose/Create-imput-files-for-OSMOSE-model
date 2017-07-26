rm(list=ls())

tab <- read.csv("C:/Users/Fabien/Documents/OSMOSE-MED/config-osm-med/reproduction-seasonality.csv")
dat <- tab[,-c(1:2)]
setwd(dir = "C:/Users/Fabien/Documents/OSMOSE-MED/config-osm-med/reproduction/test")

vec <- seq(0, (ncol(dat)-1),1)
for (i in 1:length(vec)) {
  filename = paste0("reproduction-seasonality-sp",(i-1), ".csv")
  df <- data.frame(tab$Time,dat[,i])
  colnames(df) <- c("Time",names(dat[i]))
  write.csv(df,filename,row.names = F)
}