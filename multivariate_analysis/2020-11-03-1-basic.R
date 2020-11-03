a = c(1:10)
a
a = c(20:10)
a
a %/% 3 ## 몫 출력
a %% 3 # 모듈(나머지) 출력

x = -5:5
x[x<0]

seq(-pi, pi, length = 10) # 사용자가 지정한 조건과 수만큼 값 생성



#평균이 10이고 표준편차가 1인 정규 분포를 따르는 난수 10개 생성
rnorm(10, 10, 1)


x = c(1:12)
x = matrix(x, ncol=3, byrow = T)
x

matrix(1, nrow=3, ncol=5)

x[,c(1:2)]
x[c(1:3), c(1:2)]




t(x)
y = matrix(1,nrow=4, ncol=3)

x
y
t(x) %*% y


square = function(x) {x*x}
square(4)



#패키지 설치
#cluster 패키지
install.packages("cluster")
library(cluster)



mat = c(68, 64, 48, 46, 78, 60, 90, 50, 66, 70)
phys = c(70, 68, 46, 48, 84, 64, 92, 52, 68, 72)
plot(mat, phys, main = "수학과 물리 점수에 관한 산점도")
cor(mat,phys)



library(xlsx)
survey.data = read.xlsx("data/survey.xlsx", 1)
head(survey.data)
summary(survey.data)


attach(survey.data)
tapply(age, sex, mean)
tapply(age,sex, sd)
tapply(age,marriage, mean)
tapply(age,marriage, sd)

sex.marriage = list(sex, marriage)
table(sex.marriage) #분할표
tapply(age, sex.marriage, mean)
tapply(age, sex.marriage, sd)




table(sex)
table(edu)
SexEdu = table(sex, edu)
SexEdu
summary(SexEdu)



example = read.table("data/ex8.txt", header=T)
head(example)
attach(example)
colnames(example)
sex.tb = table(sex)
sex.tb
edu.tb = table(edu)
edu.tb


rownames(edu.tb) = c("중졸 이하", "고졸", "대졸이상")
edu.tb
barplot(edu.tb)




plot(age, salary)
title("scatter plot of age,salary")


plot(age, salary, type="n") # type="n"은 plot을 중지
points(age[sex==1], salary[sex==1], pch="M", col="BLUE")
points(age[sex==2], salary[sex==2], pch="F", col="RED")
title("남녀구분 : 나이, 월수입 산점도")



data = read.table("data/haldheader.txt", header=T)
head(data)
x = data[,-1] # 1번변수빼고 모든 열
y = data[,1] #1번열에 대한 모든 행데이터
sample.reg = lsfit(x,y)
sample.reg


resid = sample.reg$resid #잔차
coeff = sample.reg$coeff #계수
yhat = y - resid
plot(resid, yhat)
title("scatter plot of resid, yhat \n Y = (X1, X2, X3, X4)")
