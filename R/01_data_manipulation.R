# Cleanning the data for the pressure analysis

#Loading necessary packages

library(tidyverse)
library(reshape2)

#Reading the file
data <- read.table(file = "data/raw/pressure.dat", header = FALSE, sep = " ")

#Deleting empty column
data[,3] <- NULL
#Setting the column names
names_col <- c("Time_step", "Pressure")
names(data) <- names_col
#Setting the time step starting from 0 (necessary since we are analizying
#only the output of the production runs)
data <- data %>%
  mutate(Time_step = Time_step - 752000)
#Writing the final file
if (!dir.exists("data/processed")) dir.create("data/processed")
write.csv(x = data,
          file = "data/processed/pressure_trace.csv",
          row.names = FALSE)
