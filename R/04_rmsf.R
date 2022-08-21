#Root Mean Square Fluctuations (RMSF) along the trajectory

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
#Calculating RMSF
rf <- rmsf(xyz[,ca$xyz])
#Generating and saving the RMSF plot
if (!dir.exists("output/figs")) dir.create("output/figs")
res <- 300
fig_size <- (res * 240) / 72
png("output/figs/rmsf.png",
    res = res,
    height = fig_size,
    width = 1.5 * fig_size)
#Plotting RMSF vs. Residue
plot(rf, ylab = "RMSF (Å)", xlab = "Residue number", typ = "l", col = "gray12")
dev.off()
