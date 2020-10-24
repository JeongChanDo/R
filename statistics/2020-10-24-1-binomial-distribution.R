install.packages("distrEx")
library(distrEx)

Binom5_1 = Binom(5, 0.5)
Binom5_2 = Binom(5, 0.25)
Binom5_3 = Binom(5, 0.75)
par(mfrow=c(3,1))

plot(Binom5_1,mfColRow=FALSE,to.draw.arg="d",ylab="")
plot(Binom5_2,mfColRow=FALSE,to.draw.arg="d",ylab="")
plot(Binom5_3,mfColRow=FALSE,to.draw.arg="d",ylab="")

E(Binom5_1);E(Binom5_2); E(Binom5_3)
var(Binom5_1); var(Binom5_2); var(Binom5_3)
