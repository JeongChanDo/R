#bernoulli distribution MLE
# n = 6일때, sumation x_i = 4, 5인경우 MLE(P)
# p=4/6인경우 MLE(P) = 0.02정도?
# p=5/6인 경우 MLE(P) = 0.065..

curve(x^5*(1-x)^1, 0, 1, xlab="p", ylab="L(p)", col="red")
curve(x^4*(1-x)^2, 0, 1, col="blue", add=TRUE)
legend("topleft", bty="n", c(expression(paste(sum(x[i], i=1, n), "=5")),
                             expression(paste(sum(x[i], i=1,n),"=4"))),
       lty=1,col=c("red","blue"))

abline(v=5/6, lty=2, col="red");abline(v=4/6, lty=2,col="blue")
