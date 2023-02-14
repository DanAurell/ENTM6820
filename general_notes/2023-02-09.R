# By saving numbers and data in objects (represented by names) can do a lot of powerful mathematical operations

x <- 2
seven <- "7"

seven+x # error

# What's wrong?
# introduce functions
class(seven) # character

vec = c(1:350)
vec <- c(1:350) # preferred
vec <- c(1:7) 

vec2 <- c("Zach", "Nate", "Winona")
vec3 <- c(TRUE, FALSE, FALSE)

# How to index or find specific values in these object

vec2[2]

vec+x

# Basic summary statistics
mean(vec)
sd(vec)
# SE
sd(vec)/sqrt(7)

se <- function(x){
  y <- sd(x)/sqrt(length(x))
  return(y)
}

se(vec)

# Could make a function to convert Fahrenheit to Celsius

sum(vec)
# min, max, median, summary

summary(vec)

# exp is the power of e
exp(1)

# pipe | is OR
# & AND
# >= Greater than or equal to
# != NOT EQUAL


t <- 1:10
t[(t > 8) | (t < 5)] # t such that t is greater than 8 OR less than 5
t[t != 2]

# %in% lets you check if a certain value is in a vector or not

# Matrices and data frames
# Mainly we'll work in data frames... matrices here just briefly
# Matrix HAS to contain all the same data type

mat1 <- matrix(data = c(1:9), nrow = 3, ncol = 3) # Default behavior is to fill by column
mat2 <- matrix(data = c(1:9), nrow = 3, ncol = 3, byrow = TRUE)

col_names <- c("one", "two", "three")
mat3 <- matrix(data = c(1:9), nrow = 3, ncol = 3, byrow = TRUE, dimnames = list(NULL, col_names))
mat3[6]

mat1[,2] # All rows, second column

# Data frames
df <- data.frame(mat1[,2], mat1[,1], mat1[,3], mat1[,2])
colnames(df) <- c("name", "value1", "value2", "value3")

df$name


# Subsetting data frames

df[df$name == 4,] # Rows where name is 4

subset(df, name == 4)




