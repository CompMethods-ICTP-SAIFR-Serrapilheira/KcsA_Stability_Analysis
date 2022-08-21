#Loading necessary packages

library(bio3d)

kcsa <- read.pdb("data/raw/kcsa_popcwi.pdb")
kcsa_dcd <- read.dcd("data/raw/kcsa_popcwieq-04.dcd")
ca.inds <- atom.select(kcsa, elety="CA")
xyz <- fit.xyz(fixed=kcsa$xyz, mobile=kcsa_dcd,
               fixed.inds=ca.inds$xyz,
               mobile.inds=ca.inds$xyz)
dim(xyz) == dim(kcsa_dcd)
rd <- rmsd(xyz[1,ca.inds$xyz], xyz[,ca.inds$xyz])
#plot(rd, xaxt = "n", typ="l", ylab="RMSD",  xlab='Time step (fs)')
#axis(1, at=0:250, labels=seq(from=0, to=500000, by=2000))
plot(rd, typ="l", ylab="RMSD(Å)", xlab="Time step")
points(lowess(rd), typ="l", col="red", lty=2, lwd=1)
res <- 300
fig_size <- (res * 240) / 72
png("output/figs/rmsd.png",
    res = res,
    height = fig_size,
    width = 1.5 * fig_size)
