ID <- LETTERS[1:26]
AGE <- sample(18:80, 26, replace = TRUE)
SIBLINGS <- sample(c("yes", "no"), 26, replace = TRUE)

DATA <- cbind(ID, AGE, SIBLINGS)
DATA <- as.data.frame(DATA)

DATA$AGE <- as.character(DATA$AGE)
DATA$AGE <- as.numeric(DATA$AGE)
