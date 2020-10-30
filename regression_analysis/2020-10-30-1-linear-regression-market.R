market = read.table("data/market-1.txt",header=T)
head(market)

plot(market$X, market$Y, xlab="광고료",
     ylab="총판매액")
title("광고료와 판매액의 산점도")

market.lm = lm(Y~X, data=market)
summary(market.lm)
abline(market.lm)


#어떤 값들이 있는지 확인 가능 names() 함수
names(market.lm)
resid = market.lm$residuals
fitted = market.lm$fitted
sum(resid) #sum of residuals
sum(fitted) # sum of suqared estimate
sum(market$Y) # sum of squared measurements


#분산분석표 작성 anova()
anova(market.lm)


#선형 모델에 대한 요약
summary(market.lm)

