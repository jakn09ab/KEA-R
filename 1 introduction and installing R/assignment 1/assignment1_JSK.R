ID <- LETTERS[1:26]
set.seed(123) #when sampling or generating random numbers, setting the seeds allows for exact reproducability of the pseudo-random variables
AGE <- sample(18:80, 26, replace = TRUE)
SIBLINGS <- sample(c("YES", "NO"), 26, replace = TRUE)
DATA <- cbind(ID,AGE , SIBLINGS) #creates matrix datatype

str(as.data.frame(DATA)) #as.data.frame() returns all variables as factor variables
#this can be fixed using as.numeric
#but when calling as.numeric on a factor variable this returns the underlying factor number (sic!)

DATA <- as.data.frame(DATA)
DATA$AGE <- as.numeric(DATA$AGE)
DATA$AGE
class(DATA$AGE)
#so the way to fix it is by converting the label portion of the factor variable first and then converting to numeric
DATA <- cbind(ID,AGE , SIBLINGS) #creates matrix datatype
DATA <- as.data.frame(DATA)
DATA$AGE <- as.numeric(as.character(DATA$AGE)) #some things you just have to know!

#same syntax in data.table
DATA <- cbind(ID,AGE , SIBLINGS) #recreate dataframe
DATA <- as.data.frame(DATA)
library(data.table)
setDT(DATA) #converts to data.table
class(DATA)
DATA[,AGE := as.numeric(as.character(AGE))] # := creates the variable AGE by reference = much faster
str(DATA)

#of course the best way is to just avoid the problem altogether: 

DATA <- data.frame(ID, AGE, SIBLINGS) #as.data.frame and data.frame are two different functions.
str(DATA)

           