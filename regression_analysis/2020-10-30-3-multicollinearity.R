hospital = read.table("data/hospital.txt", header=T)
head(hospital)


#Y~, => Y를 종속변수, .은 나머지 모든 변수를 독립변수로
hospital.lm = lm(Y~.,data=hospital)
summary(hospital.lm)


install.packages("fmsb")
library(fmsb)
VIF(lm(X1~X2+X3+X4+X5, data=hospital))
VIF(lm(X2~X1+X3+X4+X5, data=hospital))
VIF(lm(X3~X1+X2+X4+X5, data=hospital))
VIF(lm(X4~X1+X2+X3+X5, data=hospital))
VIF(lm(X5~X1+X2+X3+X4, data=hospital))


cor(hospital[,-6])





summary(lm(Y~X2+X3+X4+X5,data=hospital))
VIF(lm(X2~X3+X4+X5, data=hospital))
VIF(lm(X3~X2+X4+X5, data=hospital))
VIF(lm(X4~X2+X3+X5, data=hospital))
VIF(lm(X5~X2+X3+X4, data=hospital))



