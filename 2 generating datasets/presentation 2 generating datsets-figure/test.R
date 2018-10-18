#cpr dataset----
ID <- LETTERS[1:26]
set.seed(123) #when sampling or generating random numbers, setting the seeds allows for exact reproducability of the pseudo-random variables
AGE <- sample(18:80, 26, replace = TRUE)
SIBLINGS <- sample(c("YES", "NO"), 26, replace = TRUE)
DATA <- data.frame(ID, AGE, SIBLINGS)
DATA$BIRTHDAY <- sample(seq(as.Date('1980/01/01'), as.Date('2018/01/01'), by="day"), 26)
  


#lsr dataset----

for (i in DATA$ID) {
  if(i == DATA$ID[1]) {AA <- 0}
  A <- sample(0:10,1)
  ATClist <-  replicate(A, { 
    paste(sample(LETTERS[1:26], 1), "0", sample(1:9, 1), sample(LETTERS[1:26], 1), sep = "", "0", sample(1:9, 1))
  })
  ID <- rep(i, A) 
  C <- data.frame(ATClist,ID)
  AA <- AA+1
  ifelse(AA == 1, lsr <- C, lsr <- rbind(lsr,C))
}
library(data.table)
setDT(lsr)
setDT(DATA)
setkey(lsr, ID)
setkey(DATA, ID)
lsr <- merge(lsr, DATA, all.x = TRUE)
lsr[, EKSD:= BIRTHDAY+365*rnorm(1, mean=60, sd = 15)]
lsr[, DDD:= replicate(.N, {sample(c(30,30,30,60,60,60,90,90,120), 1, replace = TRUE)})]
lsr$SIBLINGS <- NULL
lsr$BIRTHDAY <- NULL
lsr$EKSD <- as.character(lsr$EKSD)

fwrite
