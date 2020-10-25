# normal distribution MLE example
library(stats4)
x = c(160,155,161,170,153,158,159,165,157,165,
      173,165,171,177,188,168,179,172,166,171)
minuslogL = function(mu, sigma2){
  -sum(dnorm(x, mean=mu, sd=sqrt(sigma2),log=TRUE))
}

MaxLikeEst= mle(minuslogL,start=list(mu=160,sigma2=70),
                method="L-BFGS-B",lower=c(-Inf,0),
                upper=c(Inf,Inf))

summary(MaxLikeEst)
mle = MaxLikeEst@coef
mle_mu = mle[1]; mle_sigma2=mle[2]
n=length(x)
mu <-seq(150,180,length=100)
likelihood<-rep(NA,length(mu))
for(i in 1:length(mu)){
  mle_s2<-sum((x-mu[i])^2)/2
  likelihood[i]<-(2*pi)^(-n/2)*(mle_s2)^(-n/2)*exp(-n/2)
}
plot(mu, likelihood, type="l", xlab=expression(mu),
     ylab=expression(paste("L(",mu,")")), col="red")
abline(v=mle_mu, lty=2, col="blue")
like_mle=(2*pi)^(-n/2)*mle_sigma2^(-n/2)*exp(-n/2); like_mle
