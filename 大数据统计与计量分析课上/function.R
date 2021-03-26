add8 <- function(x) {
  if(length(x) == 7) {
    x[8] = " "
  }
  return (x)
}

WB <- function(filepa){
  library(readr)
  cnames <- c("name","location","gender","Nfollowers","Nfollow","Nweibo"
                           ,"creatTime","description")
  df <- readLines(filepa,encoding = "UTF-8")
  
  ddf <- strsplit(df," \t")
  ll <- sapply(ddf,length)
  ddf <- ddf[ ll >= 7 & ll <= 8]
  ddf <- sapply(ddf,add8)
  
  tab <- data.frame(matrix(unlist(ddf),byrow = T,nrow = 100),stringsAsFactors = F)
  names(tab) = cnames
  
  tabb <- tab[which(as.numeric(tab[,'Nfollowers']) > 10000),1:2]
  head(tabb)
  return (tabb)
}
result <- WB("D:/×ÀÃæ/weibo.txt")
head(result)

