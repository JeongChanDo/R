#합의 확률분포
library(distrEx)
#이항분포의 합의 분포
Bi_sum = Binom(5, 0.3) + Binom(2, 0.3) + Binom(3,0.3)
Bi_sum


#포아송 분포의 합의 분포
Po_sum = Pois(5) + Pois(2) + Pois(3)
Po_sum

#정규분포의 합 분포
Norm_sum = Norm(5,2) + Norm(2, 4) + Norm(3,3)
Norm_sum

#정규분포의 평균의 분포
Norm_mean =(Norm(2,2) + Norm(2,2) + Norm(2,2))/3
Norm_mean
