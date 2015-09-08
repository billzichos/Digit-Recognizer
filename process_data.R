wd <- "~/GitHub/Digit-Recognizer"

setwd(wd)

# read in the training file and prepare for combining with test.
train <- read.csv("train.csv")
train$Source <- "Train"

# read in the test file and prepare for combining with train.
test <- read.csv("test.csv")
test$Source <- "Test"
test$label <- 0

# combine the data files for feature generation
library("dplyr")
train <- select(train, label, Source, 2:785)
test <- select(test, label, Source, 1:784)
df <- rbind(train, test)

# use the following code to get a list of the top 20 darkest pixels
# this will get turned into a function once i have worked out the kinks.
z <- df[1,head(order(df[1,3:786], decreasing = TRUE),20)+2]
z$column <- 
z$row <- 

column.1 <- seq(from = 0, to = 783, by = 28)
column.2 <- seq(from = 1, to = 783, by = 28)
column.3 <- seq(from = 2, to = 783, by = 28)
column.4 <- seq(from = 3, to = 783, by = 28)
column.5 <- seq(from = 4, to = 783, by = 28)
column.6 <- seq(from = 5, to = 783, by = 28)

df$leftMost <- 0
df$rightMost <- 0
df$upperMost <- 0
df$lowerMost <- 0
df$horizonalDistanceBetweenLeftRightMost <- 0
df$verticalDistanceBetweenUpperLowerMost <- 0

fourCorners <- function(x) {
        # identify the top 1 pixel intensity
        top <- max(x)
        
        # convert the input to a matrix
        m <- matrix(x, nrow = 28, ncol = 28, byrow = TRUE)
        
        # identify the four corners - N, S, E, W
        for (n in 1:dim(m)[1]) {
                if (any(m[n,] %in% top)) {
                        break
                }
        }
        for (s in dim(m)[1]:1) {
                if (any(m[s,] %in% top)) {
                        break
                }
        }        
        for (e in dim(m)[2]:1) {
                if (any(m[,e] %in% top)) {
                        break
                }
        }
        for (w in 1:dim(m)[2]) {
                if (any(m[,w] %in% top)) {
                        break
                }
        }
}
# for each row in the data frame
        # identify the top 3 pixel intensities
        top <- unique(t(df[100,head(order(df[100,3:786], decreasing = TRUE),3)+2]))
        # convert columns 3 through 786 to a 28 x 28 matrix
        m <- matrix(t(df[100,3:786]), nrow = 28, ncol = 28, byrow = TRUE)
                # find the first column to have one of the top 3 pixel intensities
                for (w in 1:dim(m)[2]) {
                        if (any(m[,w] %in% top)) {
                                break
                        }
                }
                leftMost <- w
                for (e in dim(m)[2]:1) {
                        if (any(m[,e] %in% top)) {
                                break
                        }
                }
                rightMost <- e
                for (n in 1:dim(m)[1]) {
                        if (any(m[n,] %in% top)) {
                                break
                        }
                }
                upperMost <- n
                for (s in dim(m)[1]:1) {
                        if (any(m[s,] %in% top)) {
                                break
                        }
                }
                lowerMost <- s
        
                
                # find the last column to have one of the top 3 pixel intensities
                # find the first row to have one of the top 3 pixel intensities
                # find the last row to have one of the top 3 pixel intensities

# for each row in the data frame
        # calculate the distance between the leftMost and rightMost
        # calculate the distance between the upperMost and LowerMost

# for a given row, convert columns 3 through 786 to an image
image(matrix(t(df[900,3:786]), 28, 28))