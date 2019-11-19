data("Titanic")
Titanic
MWSurvived <- apply(Titanic, c(2, 4), sum) #Rate of survival is greater for women
CASurvived <- apply(Titanic, c(3, 4), sum) #Rate of survival is greater for children


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
