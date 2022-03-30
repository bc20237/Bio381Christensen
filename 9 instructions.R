# For loops and randomization tests
# Using a for loop, write a function to calculate the number of zeroes in a numeric vector. Before entering the loop, set up a counter variable counter <- 0. Inside the loop, add 1 to counter each time you have a zero in the matrix. Finally, use return(counter) for the output.
# 
# Use subsetting instead of a loop to rewrite the function as a single line of code.
# 
# Write a function that takes as input two integers representing the number of rows and columns in a matrix. The output is a matrix of these dimensions in which each element is the product of the row number x the column number.
# 
# For Loop Review for HW
# 30 March 2022
# JAH
# Nested for loop -------------------------------
# creat sample matrix
mat <- matrix(sample(1:10, size=9),
              nrow=3,
              ncol=3)
print(mat)
# writing the for loop (i takes values in 1)
for (i in 1:nrow(mat)) {
  for (j in 1:ncol(mat)) {
    print(mat[i,j]) # prints each cell of mat i=row j=columns
  }
}
# first 3 digits first 3 rows in the matrix
# nested for loops suck in r, python is better for it
# Part 2: Putting custom functions in for loops --------------
# simulating temperature data
site1 <- runif(min=60,max=70,n=10)
site2 <- runif(min=60,max=70,n=10)
site3 <- runif(min=40,max=50,n=10)
# put them in a dframe:
temps.df <- cbind(site1,site2,site3)
# function to convert to c
degf.to.degc <- function(x){
  degc <- (x-32)*(5/9)
  return(degc)
}
# repeat function using a for loop
for(i in 1:ncol(temps.df)) {
  print(degf.to.degc(x=temps.df[,i]))
}



#mat<-matrix(nrow=i, ncol=j)
three<-function(i=3,j=3){
  mat <- matrix(nrow=i,ncol=j)
  for (i in 1:nrow(mat)) { #i is row
    for (j in 1:ncol(mat)) { #j is col
      mat[i,j] <- i*j # assign to the i*j
    } 
    print(mat)
  }
}  
three(3,3)

# In the next few lectures, you will learn how to do a randomization test on your data. We will complete some of the steps today to practice calling custom functions within a for loop. Use the code from the March 31st lecture (Randomization Tests) to complete the following steps:
#   
#   Simulate a dataset with 3 groups of data, each group drawn from a distribution with a different mean. The final data frame should have 1 column for group and 1 column for the response variable.
# 
# Write a custom function that 1) reshuffles the response variable, and 2) calculates the mean of each group in the reshuffled data. Store the means in a vector of length 3.
# 
# Use a for loop to repeat the function in b 100 times. Store the results in a data frame that has 1 column indicating the replicate number and 1 column for each new group mean, for a total of 4 columns.
# 
# Use qplot() to create a histogram of the means for each reshuffled group. Or, if you want a challenge, use ggplot() to overlay all 3 histograms in the same figure. How do the distributions of reshuffled means compare to the original means?