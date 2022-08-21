#Loading necessary packages

library(bio3d)

kcsa <- read.pdb("data/raw/kcsa_popcwi.pdb")
kcsa_dcd <- read.dcd("data/raw/kcsa_popcwieq-04.dcd")
ca.inds <- atom.select(kcsa, elety="CA")
xyz <- fit.xyz(fixed=kcsa$xyz, mobile=kcsa_dcd,
               fixed.inds=ca.inds$xyz,
               mobile.inds=ca.inds$xyz)
dim(xyz) == dim(kcsa_dcd)
rf <- rmsf(xyz[,ca.inds$xyz])
plot(rf, ylab="RMSF (Å)", xlab="Residue number", typ="l", col = "gray12")
