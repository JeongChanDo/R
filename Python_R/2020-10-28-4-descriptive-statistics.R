score = read.csv("data/score.csv", header = T)
head(score)
dim(score)

score$total = score$midterm + score$final
head(score)


#모든행, 1:2번쨰 변수는 빼라(id, gender는 필요 x)
#sd 표준 편차를 구하고 결측치 제거
sapply(score[,-c(1:2)], sd, na.rm=TRUE)
sapply(score[,-c(1:2)], mean, na.rm=TRUE)


#데이터 프레임 요약. 1번째 변수는 제외
# 다섯 수치요약(min, q1, median, q3, max)
summary(score[,-1])


#클래스 보기
class(score$gender)
class(score$midterm)
class(score$total)

#다섯수치보기
fivenum(score$total)





#psych로 기술통계량 보기기
install.packages("psych")
library(psych)




describe(score[,-c(1:2)])

Dscore = describe(score[,-c(1:2)])

names(Dscore)
