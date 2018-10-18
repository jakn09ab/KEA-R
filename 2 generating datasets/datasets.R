#Excercise: Create cpr dataset 
#========================================================
library(data.table)
library(dplyr)
library(lubridate)
set.seed(123)
CPR_ENCRYPTED <- replicate(1000, {
                    paste(sample(LETTERS[1:26],1, replace = TRUE), 
                      sample(LETTERS[1:26],1, replace = TRUE), 
                      sample(1:100,1, replace = TRUE), sep = "")
                    })

birth_year <- sample(1930:2018, 1000, replace = TRUE)

cpr <- data.frame(CPR_ENCRYPTED, birth_year)

setDT(cpr)
cpr[, birth_month:= sample(1:12, 1000, replace = TRUE)]
longmonths <- c(1,3,5,7,8,10,12)
cpr[birth_month %in% longmonths, day_of_birth:= sample(1:31, .N, replace = TRUE)] #months with 31 days
cpr[birth_month == 2, day_of_birth:= sample(1:28, .N, replace = TRUE)]#february

cpr[birth_month %in% c(4,6,9,11), day_of_birth:= sample(1:30, .N, replace = TRUE)] #30day months
cpr[, sex:= sample(c(0,1), 1000, replace = TRUE)]
cpr[,date_of_birth:= ymd(paste(birth_year, birth_month, day_of_birth, sep = "-"))]
B <- cpr[sample(150)][,date_of_death:= date_of_birth + 65*365+365*round(rnorm(150, 10, 5), digits = 0)][,.(CPR_ENCRYPTED, date_of_death)]
setkey(B, CPR_ENCRYPTED)
setkey(cpr, CPR_ENCRYPTED)
cpr <- merge(cpr, B, all = TRUE)
cpr[, status:= ifelse(!is.na(date_of_death), "90", "01")]
setnames(cpr, "date_of_death", "statusdato")
B <- max(cpr$statusdato, na.rm = TRUE)
cpr[status == "01", statusdato:= B]
cpr[,birth_year:= as.character(birth_year)] #scrambles data to character type
cpr[,birth_month:= as.character(birth_month)]
cpr[,day_of_birth:= as.character(day_of_birth)]
cpr[,day_of_birth:= as.character(day_of_birth)]
cpr[,date_of_birth:= as.character(date_of_birth)]
cpr[,statusdato:= as.character(statusdato)]
