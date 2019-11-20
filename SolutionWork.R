#1
data("Titanic")
Titanic
MWSurvived <- as.data.frame(apply(Titanic, c(2, 4), sum))
MWSurvivalRate <- MWSurvived$Yes/(MWSurvived$No+MWSurvived$Yes)
MWSurvivalLabeled <- cbind(MWSurvived, MWSurvivalRate)
#Rate of survival is greater for women

CASurvived <- as.data.frame(apply(Titanic, c(3, 4), sum))
CASurvivalRate <- CASurvived$Yes/(CASurvived$No+CASurvived$Yes)
CASurvivalLabeled <- cbind(CASurvived, CASurvivalRate)
#Rate of survival is greater for children

#2
prismDat <- function(path){
  data.path <- path
  glob.path <- paste0(data.path, "*", ".csv")  
  dataFiles <- lapply(Sys.glob(glob.path), read.csv, skip=11, head=F)
  climvars <- c("pdate", "ppt", "tmin", "tmean", "tmax")
  dataFiles <- lapply(dataFiles, setNames, climvars)
  return(dataFiles)
}

minTemp <- function(df, threshold) {
  if(df$tmin<threshold){
    print(FALSE)
  }else{
    print(TRUE)
  }
return(df)
}




#3
year <- seq.Date(as.Date("1985/1/1"), as.Date("2019/12/31"), by="month")
all_years <- as.character(year)

for(temperature in 1: length(all_years)){
  my.query <- ncdc(datasetid='GSOM', stationid='GHCND:ASN00091245', datatypeid='TAVG', startdate=all_years[temperature], enddate=all_years[temperature], add_units=TRUE, limit=1000)
}


for (j in 1: length(my.query$data$value)){
  if(my.query$data$value$Station[j] %in% data_temp[ ,1]){
    row <- which(data_temp[ ,1]==my.query$data$Station[j])
    data_temp[row, temperature] <- my.query$data$value[j]
  }
}



start <- as.Date("19850101", format = "%Y%m%d")
end <- as.Date("20191231", format = "%Y%m%d")

theDate <- start

while (theDate <= end){
  df<- ncdc(
    datasetid ='GSOM',
    stationid = 'GHCND:ASN00091245',
    token = "vOhMgIvwqWkcgBBlpYPfHSldYhQiTfbR", 
    datatypeid = 'TAVG',
    startdate = theDate,
    enddate = theDate,
    limit = 1000
  )$data
  
  theDate <- theDate
}
  