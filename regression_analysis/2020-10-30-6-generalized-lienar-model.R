glider = read.csv("data/sugar_glider_binomial.csv")
head(glider)

#로지스틱 회귀 모형 - 일반화 선형 모델
#링크 함수로 로짓함수 사용
logit_ml <- glm(occurr~p_size_km+con_metric,
            family=binomial(link=logit),
            data=glider)
summary(logit_ml)



1 - pchisq(68.994 - 54.661, 2)

anova(logit_ml)
