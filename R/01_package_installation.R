#Installing necessary packages
#--------------
#Run this part of the code if it is needed to install all the packages
packages <- c("tidyverse", "reshape2", "ggplot2", "zoo", "bio3d")
for (package in packages) {
  if (!package %in% installed.packages()) install.packages(package)
}
#--------------
#If it is needed to install only one or some of the packages, run the line
#with the necessary package
install.packages("tidyverse")
install.packages("reshape2")
install.packages("ggplot2")
install.packages("zoo")
install.packages("bio3d")
