presentation 2 generating datsets
========================================================
author: JSK@clin.au.dk
date: 15 oktober 2018
autosize: true

First Slide
========================================================

For more details on authoring R presentations please visit <https://support.rstudio.com/hc/en-us/articles/200486468>.
s
- Bullet 1
- Bullet 2
- Bullet 3

Slide With Code
========================================================


```r
summary(cars)
```

```
     speed           dist       
 Min.   : 4.0   Min.   :  2.00  
 1st Qu.:12.0   1st Qu.: 26.00  
 Median :15.0   Median : 36.00  
 Mean   :15.4   Mean   : 42.98  
 3rd Qu.:19.0   3rd Qu.: 56.00  
 Max.   :25.0   Max.   :120.00  
```

Excercise: Create cpr dataset 
========================================================

- CPR_ENCRYPTED: character-vector: "AA1"ZZ9"
- birth_year: numeric 1930-2018
- birth_month: numeric: 1-12
- birth_day: numeric 1:28 #for simplicity
- sex: numeric: 0 or 1 (female or male)
- A: date: date of birth
- STATUS: factor:  01 (95%) or 90 (5%) (01 = alive, 90 = dead)

- save cpr.R in lesson 2 assignment 2 folder and upload to github

Excercise: Create lsr dataset 
========================================================

- CPR_ENCRYPTED: character-vector: "AA1"ZZ9"
- EKSD
- ATC
- DDD
- save lsr.R in lesson 2 assignment 2 folder and upload to github

Excercise: Create labka dataset 
========================================================

- CPR_ENCRYPTED: character-vector: "AA1"ZZ9"
- SampleDate
- ATC
- result
- unit
- analysisno

- save labka.R in lesson 2 assignment 2 folder and upload to github

Excercise: Create population dataset 
========================================================

from cpr: select 75% of CPR_ENCRYPTED at random
create indexdate column as birthday + 25 years, normally distributed (rnorm()) with standard deviation 10 years
remove rows with index date lower than birthday and later than 2018. 
- save population.R in lesson 2 assignment 2 folder and upload to github
