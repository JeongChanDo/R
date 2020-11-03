library(xlsx)
survey.data = read.xlsx("data/survey.xlsx", 1)
head(survey.data)
attach(survey.data)
summary(survey.data)


edu.tb = table(edu)
edu.tb
rownames(edu.tb) = c("무학","초졸","중졸","고졸","대졸")
barplot(edu.tb)
title("교육 정도에 대한 막대 그림")
pie(edu.tb)
title("교육 정도에 대한 원 그림")


sex.edu = list(sex, edu)
sex.edu.tb = table(sex.edu)
sex.edu.tb
colnames(sex.edu.tb) = c("무학", "초졸", "중졸", "고졸", "대졸")
rownames(sex.edu.tb) = c("남성", "여성")
barplot(sex.edu.tb)
title("성별, 교육 정도에 대한 막대그림")


par(mfrow=c(1,2))
pie(sex.edu.tb[1,])
title("남성의 교육 정도")
pie(sex.edu.tb[2,])
title("여성의 교육정도")


par(mfrow=c(1,2))
hist(salary)
stem(salary)
boxplot(salary~sex)
title("성별에 따른 봉급 상자그림")











plot(co2)
lines(smooth(co2), col="BLUE")





x = seq(0, 20, 0.1) # 0부터 20까지 0.1 간격으로 생성
y = exp(-x/10) * cos(2*x)
par(mfrow=c(1,2))
plot(x, y)
plot(x, y, type="l") # l선으로 연결






install.packages("HSAUR2")
install.packages("MVA")
library(HSAUR2)
library(MVA)


data("USairpollution")
head(USairpollution)
attach(USairpollution)
plot(manu, popul)

x = USairpollution[,c(3,4)]
bvbox(x, xlab="manu", ylab="popul") #biviriate box
title("bivariate boxplot")

identify(x) #특이값 표시. plot 마우스로 클릭 후 esc
rownames(x)[c(7,9,14,30)]









social.data = read.table("data/social_data.txt", header=T)
pairs(social.data)
round(cor(social.data), 3)


social = social.data[, -1]
year = social.data[, 1]
rownames(social) = year #social 데이터의 행들을 년도로 다바꿈
head(social)
stars(social)


par(mfrow=c(2,1))
#출생률에 대한 히스토그램 생성
hist(birth, xlab="birth rate", ylab="frequency",
     xlim=c(0,70), ylim=c(0,40))
hist(death, xlab="death rate", ylab="frequency",
     xlim=c(0,70), ylim=c(0,40))


edu = read.table("data/education.txt",header=T)
edu
names = edu[,1]
grade70 = edu[,2]
grade90 = edu[,3]
par(mfrow=c(1,2))
pie(grade70, label=names, clockwise = T,main="1970년대 여성학력")
pie(grade90, label=names, clockwise = T,main="1990년대 여성학력")





digit = read.table("data/digit.txt", header=T)
digit = as.matrix(digit) # 행렬데이터로 지정
par(mfrow=c(1,1))
digit
barplot(digit, legend.txt=rownames(digit), col=c(2:6))




rates = read.table("data/birth.txt", header=T)
attach(rates)
boxplot(birth, death, names=c("Birth", "Death"))
title("출생률과 사망률에 대한 상자그림")