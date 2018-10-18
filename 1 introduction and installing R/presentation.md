Introduction to R
========================================================
author: JSK@clin.au.dk
date: 12 okt 2018
autosize: true

First Slide
========================================================

Todays agenda

- About R
- github: Sharing methods for easing new researchers introducion to data-management
- Introduction R studio
- basic syntax
- excercise


About R
========================================================

- Free open source project called R
- Expanded functionality through packages that are easily installed
- Users contribute to CRAN, an online repository including most none-bioinformatics packages
- Consequently not strict coherent syntax
- Relevant elements may have limited documentation, but most popular packages have extensive documentation.

github
========================================================

- online repository (code bank)
- our repository is free and PUBLIC
- I hope we can generate dummy data resembling data structures that we all work with
- and share methods that solve the problems that we all have to go through

https://stackoverflow.com/
========================================================

- online troubleshooting
- find answers to most question
- if not, questions are usually answered in a matter of hours
- You MUST make reproducible problems or suffer bad reputation
- I imagine that we can help each other on stackexchange:

create reproducible example when there is an answer we cannot find, and share it with our co-workers in an URL.

https://stackoverflow.com/questions/48263698/data-table-how-to-get-the-blazingly-fast-subsets-it-promises-and-apply-to-a-sec #example

Special considerations for R
========================================================

- some base R operaters are slow
- like Stata, R loads (per default) data into memory.
- workarounds with database integration exists, but not for DST
- use dplyr or data.table for data management
- use ggplot2 for most graphics


install and load packages
========================================================


```r
#call library() at start of syntax, every new session
library(dplyr) # most used, great documentation, maybe easier syntax
# a little slow with big datasets. Part of the "tidyverse"
#https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf
library(data.table) #very fast and compact syntax
#contains fread() and fwrite() 
library(ggplot2) # plotting (base plots like plot() and hist () are fast and fine for exploration
library(lubridate) #great package for handling dates
```

Basic syntax
========================================================

```r
A <- 1+1 #assign to value
```


```r
A <- c(1,1,1,1) #when data is one-dimensional data is saved as a vector
```


```r
a <- c(rep(1,4)) #identical to A, R is case sensitive
```


```r
B <- A+a
B
```

```
[1] 2 2 2 2
```

Basic syntax
========================================================
- Build in dataset: mtcars

```r
mtcars <- mtcars
head(mtcars)
```

```
                   mpg cyl disp  hp drat    wt  qsec vs am gear carb
Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1
```

```r
setDT(mtcars)
```

Basic syntax
========================================================
- Build in dataset: mtcars

```r
summary(mtcars)
```

```
      mpg             cyl             disp             hp       
 Min.   :10.40   Min.   :4.000   Min.   : 71.1   Min.   : 52.0  
 1st Qu.:15.43   1st Qu.:4.000   1st Qu.:120.8   1st Qu.: 96.5  
 Median :19.20   Median :6.000   Median :196.3   Median :123.0  
 Mean   :20.09   Mean   :6.188   Mean   :230.7   Mean   :146.7  
 3rd Qu.:22.80   3rd Qu.:8.000   3rd Qu.:326.0   3rd Qu.:180.0  
 Max.   :33.90   Max.   :8.000   Max.   :472.0   Max.   :335.0  
      drat             wt             qsec             vs        
 Min.   :2.760   Min.   :1.513   Min.   :14.50   Min.   :0.0000  
 1st Qu.:3.080   1st Qu.:2.581   1st Qu.:16.89   1st Qu.:0.0000  
 Median :3.695   Median :3.325   Median :17.71   Median :0.0000  
 Mean   :3.597   Mean   :3.217   Mean   :17.85   Mean   :0.4375  
 3rd Qu.:3.920   3rd Qu.:3.610   3rd Qu.:18.90   3rd Qu.:1.0000  
 Max.   :4.930   Max.   :5.424   Max.   :22.90   Max.   :1.0000  
       am              gear            carb      
 Min.   :0.0000   Min.   :3.000   Min.   :1.000  
 1st Qu.:0.0000   1st Qu.:3.000   1st Qu.:2.000  
 Median :0.0000   Median :4.000   Median :2.000  
 Mean   :0.4062   Mean   :3.688   Mean   :2.812  
 3rd Qu.:1.0000   3rd Qu.:4.000   3rd Qu.:4.000  
 Max.   :1.0000   Max.   :5.000   Max.   :8.000  
```

Basic syntax
========================================================
- Build in dataset: mtcars

```r
summary(mtcars$mpg)
```

```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  10.40   15.42   19.20   20.09   22.80   33.90 
```

```r
?summary #access documentation for summary function
```

Basic syntax
========================================================


```r
1:10
```

```
 [1]  1  2  3  4  5  6  7  8  9 10
```

```r
LETTERS[1:10]
```

```
 [1] "A" "B" "C" "D" "E" "F" "G" "H" "I" "J"
```

```r
A <- 1:10
B <-LETTERS[1:10]
```

Basic syntax
========================================================


```r
rbind(A, B) #rowbind
```

```
  [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
A "1"  "2"  "3"  "4"  "5"  "6"  "7"  "8"  "9"  "10" 
B "A"  "B"  "C"  "D"  "E"  "F"  "G"  "H"  "I"  "J"  
```

Basic syntax
========================================================


```r
cbind(A, B) #columnbind
```

```
      A    B  
 [1,] "1"  "A"
 [2,] "2"  "B"
 [3,] "3"  "C"
 [4,] "4"  "D"
 [5,] "5"  "E"
 [6,] "6"  "F"
 [7,] "7"  "G"
 [8,] "8"  "H"
 [9,] "9"  "I"
[10,] "10" "J"
```

```r
C <- cbind(A, B)
```
Basic syntax
========================================================


```r
t(C) #transpose data
```

```
  [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
A "1"  "2"  "3"  "4"  "5"  "6"  "7"  "8"  "9"  "10" 
B "A"  "B"  "C"  "D"  "E"  "F"  "G"  "H"  "I"  "J"  
```

Basic syntax
========================================================


```r
class(C)
```

```
[1] "matrix"
```
I don't like matrix. Dataframe is standard R format


```r
C <- as.data.frame(C)
```


```r
class(C)
```

```
[1] "data.frame"
```


Basic syntax
========================================================
but I use data.table

```r
setDT(mtcars)
mtcars
```

```
     mpg cyl  disp  hp drat    wt  qsec vs am gear carb
 1: 21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
 2: 21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
 3: 22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
 4: 21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
 5: 18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
 6: 18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
 7: 14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
 8: 24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
 9: 22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
10: 19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
11: 17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4
12: 16.4   8 275.8 180 3.07 4.070 17.40  0  0    3    3
13: 17.3   8 275.8 180 3.07 3.730 17.60  0  0    3    3
14: 15.2   8 275.8 180 3.07 3.780 18.00  0  0    3    3
15: 10.4   8 472.0 205 2.93 5.250 17.98  0  0    3    4
16: 10.4   8 460.0 215 3.00 5.424 17.82  0  0    3    4
17: 14.7   8 440.0 230 3.23 5.345 17.42  0  0    3    4
18: 32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
19: 30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
20: 33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1
21: 21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
22: 15.5   8 318.0 150 2.76 3.520 16.87  0  0    3    2
23: 15.2   8 304.0 150 3.15 3.435 17.30  0  0    3    2
24: 13.3   8 350.0 245 3.73 3.840 15.41  0  0    3    4
25: 19.2   8 400.0 175 3.08 3.845 17.05  0  0    3    2
26: 27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
27: 26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2
28: 30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2
29: 15.8   8 351.0 264 4.22 3.170 14.50  0  1    5    4
30: 19.7   6 145.0 175 3.62 2.770 15.50  0  1    5    6
31: 15.0   8 301.0 335 3.54 3.570 14.60  0  1    5    8
32: 21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2
     mpg cyl  disp  hp drat    wt  qsec vs am gear carb
```

Basic syntax
========================================================
syntax is simple:
mtcars[filtering, manipulation, by-group]

```r
mtcars[mpg >18]
```

```
     mpg cyl  disp  hp drat    wt  qsec vs am gear carb
 1: 21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
 2: 21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
 3: 22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
 4: 21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
 5: 18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
 6: 18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
 7: 24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
 8: 22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
 9: 19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
10: 32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
11: 30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
12: 33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1
13: 21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
14: 19.2   8 400.0 175 3.08 3.845 17.05  0  0    3    2
15: 27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
16: 26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2
17: 30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2
18: 19.7   6 145.0 175 3.62 2.770 15.50  0  1    5    6
19: 21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2
```

Basic syntax
========================================================
syntax is simple:
mtcars[filtering, manipulation, by-group]

```r
mtcars[mpg >18, mean(hp)]
```

```
[1] 104.8421
```

Basic syntax
========================================================
syntax is simple:
mtcars[filtering, manipulation, by-group]

```r
mtcars[mpg >18, mean(hp), by = cyl]
```

```
   cyl        V1
1:   6 122.16667
2:   4  82.63636
3:   8 175.00000
```


Basic syntax
========================================================
syntax is simple:
mtcars[filtering, manipulation, by-group][and can be chained]

```r
mtcars[mpg >18, mean(hp), by = cyl][V1 >90]
```

```
   cyl       V1
1:   6 122.1667
2:   8 175.0000
```

```r
D <- mtcars[mpg >18, mean(hp), by = cyl][V1 >90]
```

Basic syntaxs
========================================================

```r
head(D)
```

```
   cyl       V1
1:   6 122.1667
2:   8 175.0000
```

```r
setnames(D, c("cyl", "V1"), c("bamse", "kylling"))
D
```

```
   bamse  kylling
1:     6 122.1667
2:     8 175.0000
```


Excercise: Create dataset with columns:
========================================================

- ID: A-Z
- AGE: ages between 18:80
- SIBLINGS: "YES" or "NO"
- save in lesson 1 folder and upload to github

