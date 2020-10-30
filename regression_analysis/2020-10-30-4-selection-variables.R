hald = read.table("data/hald.txt",header=T)
head(hald)


install.packages("leaps")
library(leaps)
all.lm = regsubsets(Y~.,data=hald)
(rs=summary(all.lm))



names(rs)
rs$rsq
rs$adjr2
rs$cp


#forward selection
start.lm = lm(Y~1, data=hald)
full.lm = lm(Y~.,data=hald)
step(start.lm, scope=list(lower=start.lm,
              upper=full.lm), direction="forward")


#backward selection
full.lm = lm(Y~., data=hald)
step(full.lm, data=hald, direction="backward")


#stepwise selection
start.lm = lm(Y~1, data=hald)
full.lm = lm(Y~.,data=hald)
step(start.lm, scope=list(lower=start.lm,
    upper=full.lm), direction="both")
