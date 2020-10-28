cotton = read.csv("data/cotton.csv", header=T)
head(cotton)

cotton$pct = as.factor(cotton$pct)

#수준간 차이를 보기 위해선
#수준별 상자 그림을 그리는게 좋음
boxplot(tensile~pct, data=cotton)

#그룹별 기술 통계량
by(cotton$tensile, cotton$pct, summary)



#pct 수준간 tensile 차이가 있느지 분산분석
fit = aov(tensile ~ pct, data=cotton)
#분산분석법 취득
summary(fit)


#Tukey 방법으로 다중 비교 분석
tukey.test = TukeyHSD(fit)
plot(tukey.test)
