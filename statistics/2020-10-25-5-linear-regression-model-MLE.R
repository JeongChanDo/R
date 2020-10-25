# simple linear regression model MLE - beta0, beta1, sigma2

x = c(4,6,6,8,8,8,9,9,10,12)
y = c(9,10,18,20,15,17,20,22,25,30)

minuslogL = function(beta0, beta1, sigma2){
  -sum(dnorm(y - x * beta1 - beta0, 0, sqrt(sigma2), log=TRUE))
}
MaxLikeEst = mle(minuslogL, method="L-BFGS-B",
                 start=list(beta0=1, beta1=1, sigma2=1),
                 lower=c(-Inf,-Inf,0), upper=c(Inf,Inf,Inf))
summary(MaxLikeEst)
mle=MaxLikeEst@coef
mle_beta0=mle[1];mle_beta1=mle[2];mle_sigma2=mle[3]
n=length(y)
lse=lm(y~x)
summary(lse)

lse_beta0=coef(a)[[1]];lse_beta1=coef(a)[[2]]
lse_sigma2=sum((y-mle_beta0-mle_beta1*x)^2)/(n-2)
plot(x, y, ylim=c(0,30), xlim=c(0,12))
abline(lse,col=2)
