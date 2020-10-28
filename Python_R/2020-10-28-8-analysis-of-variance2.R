glass = read.csv("data/glass.csv",header=T)
head(glass)

library(car)
glass$temperature = recode(glass$temperature,"100=1;125=2;150=3")
head(glass)


glass$glass = factor(glass$glass)
glass$temperature = factor(glass$temperature)

class(glass$glass)
class(glass$temperature)



# 이원배치 분산분석 수행
# glass:temperature 는 교장효과를 의미
fit = aov(strength ~ glass+temperature + glass:temperature,
          data=glass)
summary(fit)


# 유리 종류별, 온도별, 장력
interaction.plot(glass$glass,
                 glass$temperature,
                 glass$strength)
