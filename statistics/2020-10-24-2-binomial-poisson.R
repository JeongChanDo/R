library(distrEx)
Poisson_21 = Pois(2) # np = 2 = lambda
Poisson_22 = Pois(0.2) # np = 0.2 = lambda
Binom_21 = Binom(10, 0.2) # np = 2 
Binom_22 = Binom(100, 0.02) # np = 0.2
par(mfrow=c(4,1))
plot(Poisson_21, mfColRow=FALSE,to.draw.arg="d",ylab="")
plot(Poisson_22, mfColRow=FALSE,to.draw.arg="d",ylab="")
plot(Binom_21, mfColRow=FALSE,to.draw.arg="d",ylab="")
plot(Binom_22, mfColRow=FALSE,to.draw.arg="d",ylab="")
