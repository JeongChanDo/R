#데이터 준비
a1 = c(1.93, 2.38, 2.20, 2.25)
a2 = c(2.55, 2.72, 2.75, 2.70)
a3 = c(2.40, 2.68, 2.32, 2.28)
a4 = c(2.33, 2.37, 2.28, 2.25)

#data frame 생성
wear = c(a1, a2, a3, a4)
group = c("a1", "a2", "a3", "a4")
group <- rep(group, c(4,4,4,4))
wear.dat <- data.frame(group, wear)

# 그룹별 sum, mean
tapply(wear, group, sum)
tapply(wear, group, mean)
boxplot(wear~group)

#one way anova
aov.out = aov(wear~group, data=wear.dat)
summary(aov.out)
