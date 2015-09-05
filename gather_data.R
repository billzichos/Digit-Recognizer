wd <- "~/GitHub/Digit-Recognizer"

setwd(wd)

# The following files are provided
#   - train.csv
#   - test.csv

source("~/GitHub/Get-Raw-Data/download.R")
downloadKaggle("digit-recognizer","train.csv")
downloadKaggle("digit-recognizer","test.csv")