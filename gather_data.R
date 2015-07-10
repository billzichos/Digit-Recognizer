wd <- "~/GitHub/Digit-Recognizer"

setwd(wd)

# The following files are provided
#   - train.csv
#   - test.csv

# source("~/GitHub/Get-Raw-Data/download.R")
# downloadKaggle("digit-recognizer","train.csv")
# downloadKaggle("digit-recognizer","test.csv")


trnFile <- "train.csv"
tstFile <- "test.csv"

download.file(trnUrl, paste(wd,"\\train.csv", sep=""), quiet=TRUE)
download.file(tstUrl, paste(wd,"\\test.csv", sep=""), quiet=TRUE)

datalist <- list(
        train=read.csv(
                paste(wd,"\\",trnFile, sep=""), header=TRUE, as.is=TRUE), 
        test=read.csv(
                paste(wd,"\\",tstFile, sep=""), header=TRUE, as.is=TRUE)
        )

downloadKaggle <- function(competitionName, fileName) {
        kaggleUrl <- "https://www.kaggle.com/c/"
        download.file(
                paste(
                        kaggleUrl,competitionName,'/download/',fileName,sep=""
                ),
                paste(getwd(),"\\",fileName,sep=""),
                quiet = FALSE
        )
}