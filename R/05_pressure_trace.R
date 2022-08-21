#Pressure trace analysis

#Loading necessary packages

library(zoo)
library(ggplot2)

#Reading the data
pressure <- read.csv("data/processed/pressure_trace.csv")
#Obtaining moving average for the pressure trace
pressure$roll_mean<-zoo::rollmean(pressure$Pressure, 70, fill=NA)
#Plotting time series with moving average
gg_pr <- ggplot(pressure) +
          geom_line(aes(x = Time_step, y = Pressure))+
          labs(x = "Time step", y = "Pressure (bar)") +
          geom_line(aes(x = Time_step, y = roll_mean), color = "red") +
          theme_classic()
#Saving the image
if (!dir.exists("output/figs")) dir.create("output/figs")
res <- 300
ggsave(plot = gg_pr, "output/figs/Pressure_trace.png",
       height = 6,
       width = 18,
       dpi = res)



