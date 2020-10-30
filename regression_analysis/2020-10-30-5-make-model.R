tcrime = read.table("data/tcrime.txt",header=T)
head(tcrime)
attach(tcrime)
plot(motor,tcratio)


tcrime.lm = lm(tcratio~motor+I(motor^2),data=tcrime)
summary(tcrime.lm)








maraton = read.table("data/maraton.txt",header=T)
head(maraton)
plot(maraton$sect, maraton$m1990)



maraton.lm = lm(m1990~sect+I(sect^2)+I(sect^3),data=maraton)
summary(maraton.lm)










soup = read.table("data/soup.txt",header=T)
head(soup)

#범주형 변수로 인식
soup$D = factor(soup$D, levels=c(0,1),
                label=c("line0", "line1"))

plot(soup$X, soup$Y, type="n")
points(soup$X[soup$D=="line1"], soup$Y[soup$D=="line1"],
       pch=17, col="BLUE")

points(soup$X[soup$D=="line0"], soup$Y[soup$D=="line0"],
       pch=19, col="RED")
legend("bottomright", legend=levels(soup$D),
       pch=c(19,17),col=c("RED","BLUE"))




soup.lm=lm(Y~X+D,data=soup)
summary(soup.lm)
abline(27.28179, 1.23074, lty=2, col="RED")
abline(27.28179+53.12920, 1.23074, lty=2, col="BLUE")




soup2.lm = lm(Y ~ X+D+X:D, data=soup)
summary(soup2.lm)
