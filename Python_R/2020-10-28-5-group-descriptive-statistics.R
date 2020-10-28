score = read.csv("data/score.csv", header = T)
score$total = score$midterm + score$final

#그룹별 기술통계
#tapply(계산할 변수, 그룹 변수, 통계량)
tapply(score$total, score$gender, mean)
tapply(score$total, score$gender, sd)
tapply(score$total, score$gender, median)



#aggregate
aggregate(score[c("midterm","final","total")],
          list(gender=score$gender), mean)
aggregate(score[c("midterm","final","total")],
          list(gender=score$gender), sd)
aggregate(score[c("midterm","final","total")],
          list(gender=score$gender), length)




#by 
by(score[,3:5], score$gender, summary)





#psych의 describeBy로 기술통계량 그루핑
library(psych)
describeBy(score[,c(3:5)], score$gender)




#줄기잎 그림
stem(score$final)



install.packages("aplpack")
library(aplpack)
maleScore = score$total[score$gender=="m"]
femaleScore = score$total[score$gender=="f"]
stem.leaf.backback(maleScore, femaleScore)














#한 plots에 여러개 그리기
par(mfrow=c(1,2))
# x는 성별 y는 total, score 데이터에서. boxplot
boxplot(total~gender, data=score)
# 성별에 따른 total score 비교
boxplot(femaleScore, maleScore)












enqete = read.csv("data/enqete.csv", header=T)
head(enqete,5)
# 형태 보기
dim(enqete)
#빈도 보기
table(enqete$grade)

#변수명 변환
grade.freq = table(enqete$grade)
names(grade.freq) = c("gr1","gr2","gr3","gr4")
grade.freq



#그래프
par(mfrow=c(1,2))
barplot(grade.freq)
pie(grade.freq)



#분할표
enqete[enqete==0] = NA
enqete = na.omit(enqete)
table(enqete$grade, enqete$q1)

head(enqete)


#분할표 만들기
xtabs(~q1+grade, data=enqete)
xtabs(~grade+q1, data=enqete)



# 학년별 1,2문항 앙케이트 결과
college = table(enqete$grade, enqete$q1)
head(college)
colnames(college) = c("ans1", "ans2")
rownames(college) = c("grade1",
                      "grade2",
                      "grade3",
                      "grade4")
college



par(mfrow=c(1,2))
barplot(college)
barplot(t(college),legend=c("ans1","ans2"))













chisq.test(college)
