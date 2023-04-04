## Functions and iterations


library(tidyverse)
library(drc)

degF=82
degF=32
degF=90
degF=100

degC = (degF-32)*5/9
# any time you are finding you're doing a lot of copy and paste, 
# it may be good to make a functoin

# Anatomy of function
# func.name <- function(... variables){
#    Stuff you want the function to do
#    return(#output#)
# }

f_to_c <- function(f){
  out <- (f-32)*5/9
  return(out)
}

# Now we just use it like we do any other function
f_to_c(90)
f_to_c(100)


# Write the opposite function c_to_f
c = (f-32)*5/9
32 + c*9/5 = f

c_to_f <- function(c){
  out <- 32 + c*9/5
  return(out)
}

c_to_f(28)
c_to_f(32)
c_to_f(37.7)

# Say you make really similar plots over and over again with 
# multiple datasets. You can automate that

# You can also use them together with a for loop
  # Pretty ubiquitous in coding languages


## For loops
# Start ... some code block... asks if it's the last iteration... Y/N ...
# Y comes back to start... repeat... Y/N... N ... final output


for (i in 1:10){
  print(i*2)
}


# Let's use our function within the loop
# What are the Celsius values for -100 to 100 F

for (i in -100:100){
  result <- f_to_c(i)
  print(result)
}


# Let's go to an example with real data
# ZNoel is often doing model fitting on SUBSETS of his data
  #  - For example
# He's using fungicide inhibition data
  # Calculating EC50 for each isolate


datum <- read.csv("./general_notes/data/EC50_all.csv")
str(datum)


nm <- unique(datum$is)

for (i in seq_along(nm)){ 
  # seq_along goes iteratively through each name... will generate numbers 1-75
  isolate1 <- drm(100*datum$relgrowth[datum$is == nm[[i]]]~
                  datum$conc[datum$is == nm[[i]]],
                  fct = LL.4(fixed = c(NA, NA, NA, NA),
                             names = c("Slope", "Lower", "Upper", "EC50")),
                  na.action = na.omit)
  
  # Not complete yet
  
  EC50 <- ED(isolate1, respLev = C(50), type = "relative", interval = "delta")[i]
  
  # What we'll

  }


# Eventually we'll do this with `map` which hooks in with dplyr


------

# 2023-04-04 Finishing loops  
    
# Pulled in from the actual version  

EC50.ll4 <- NULL # create a null object   

  for (i in seq_along(nm)) {
    isolate1 <- drm(100 * datum$relgrowth[datum$is == nm[[i]]] ~ 
                      datum$conc[datum$is == nm[[i]]], 
                    fct = LL.4(fixed = c(NA, NA, NA, NA), 
                               names = c("Slope", "Lower", "Upper", "EC50")), 
                    na.action = na.omit)
    # outputs the summary of the paramters including the estimate, standard
    # error, t-value, and p-value outputs it into a data frame called
    # summary.mef.fit for 'summary of fit'
    summary.fit <- data.frame(summary(isolate1)[[3]])
    # outputs the summary of just the EC50 data including the estimate, standard
    # error, upper and lower bounds of the 95% confidence intervals around the
    # EC50
    EC50 <- ED(isolate1, respLev = c(50), type = "relative", 
               interval = "delta")[[1]]
    EC50
    isolate_ec_i <- data.frame(nm[i], EC50)
    colnames(isolate_ec_i) <- c("Isolate", "EC50")
    EC50.ll4 <- rbind.data.frame(EC50.ll4, isolate_ec_i)
  }




#######

# Using `map`


#### ---- Pulled from GitHub but gives errors
datum %>%
  group_by(is) %>%
  nest() %>%
  mutate(ll.4.mod = map(datum, ~drm(.$relgrowth ~ .$conc, 
                                   fct = LL.4(fixed = c(NA, NA, NA, NA), 
                                              names = c("Slope", "Lower", "Upper", "EC50"))))) %>%
  mutate(ec50 = map(ll.4.mod, ~ED(., 
                                  respLev = c(50), 
                                  type = "relative",
                                  interval = "delta")[[1]])) %>%
  unnest(ec50)

#### End

# Step by step
tibble_by_is <- datum %>% group_by(is) %>% # get the model for each isolate
  nest() # There is a tibble for each group...
  

datum %>% group_by(is) %>% # 
  nest() %>% 
  mutate(ll.4.mod = map(data, ~drm(.$relgrowth ~.$conc, fct = LL.4())))  # "." means "everything"... 
# it's a quirk of the `map` function

ec50results$data[1] <- datum %>% group_by(is) %>% 
  nest() %>% 
  mutate(ll.4.mod = map(data, ~drm(.$relgrowth ~.$conc, fct = LL.4()))) %>% 
  mutate(ec50 = map(ll.4.mod, ~ED(., respLev = 50)[1]))
ec50results$data[1]
ec50results$ll.4.mod[1]

# We can unnest any of these columns




