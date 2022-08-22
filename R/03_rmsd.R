#Root Mean Square Deviation (RMSD) along the trajectory

#Loading necessary packages

library(bio3d)

#Reading the pdb file
kcsa <- read.pdb("data/raw/kcsa_popcwi.pdb")
#Reading the trajectory
kcsa_dcd <- read.dcd("data/raw/kcsa_popcwieq-04.dcd")
#Vector with the C-alpha atoms in the first frame
ca <- atom.select(kcsa, elety = "CA")
#Performing the superposition of each frame with the first one and saving the
#new coordinates in the xyz matrix
xyz <- fit.xyz(fixed = kcsa$xyz, mobile = kcsa_dcd,
               fixed.inds = ca$xyz,
               mobile.inds = ca$xyz)
#Calculating RMSD from the initial structure
rd <- rmsd(xyz[1, ca$xyz], xyz[, ca$xyz])
#Generating and saving the RMSD plot
if (!dir.exists("output/figs")) dir.create("output/figs")
res <- 300
fig_size <- (res * 240) / 72
png("output/figs/rmsd.png",
    res = res,
    height = fig_size,
    width = 1.5 * fig_size)
#Plotting RMSD vs. Time Step
plot(rd, typ = "l", ylab = "RMSD(Å)", xlab = "Time step")
#Plotting LOWESS smoothing
points(lowess(rd), typ = "l", col = "red", lty = 2, lwd = 1)
dev.off()
