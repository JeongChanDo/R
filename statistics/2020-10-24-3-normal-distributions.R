install.packages("mosaic")
library(mosaic)

plotDist("binom", size = 100, prob=.30, col=2,lwd=2) +
  plotDist("norm", mean=30, sd=sqrt(100 * .3 *.7), add=TRUE)

plotDist("norm",mean=1,sd=1/2,lwd=2,xlim=c(-6,6)) +
  plotDist("norm", col=2, lwd=2, add=TRUE) +
  plotDist("norm", mean=-1, sd=2,lwd=2,col=1,add=TRUE)
