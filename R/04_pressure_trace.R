#Loading necessary packages
library(zoo)
library(ggplot2)
#Reading the data
pressure <- read.csv("data/processed/pressure_trace.csv")

#Obtaining moving average for the pressure trace
pressure$roll_mean<-zoo::rollmean(pressure$Pressure, 50, fill=NA)
#Plotting time series
if (!dir.exists("output/figs")) dir.create("output/figs")
ggplot(pressure) +
  geom_line(aes(x = Time_step, y = Pressure))+
  labs(x = "Time step (fs)", y = "Pressure (bar)") +
  geom_line(aes(x = Time_step, y = roll_mean), color = "red") +
  theme_classic() +
  ggsave()



