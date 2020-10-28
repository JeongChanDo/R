
insurance = read.table("data/insurance.txt",header=T)


#명목형 변수로 바꾸기
#factor(변수지정,levels=범위,labels=라벨)
insurance$job = factor(insurance$job, levels=c(1:3),
                labels=c("근로자","사무직","전문가"))
head(insurance)

#순서형 변수로 바꾸기
insurance$edu2 = ordered(insurance$edu,levels=c(1:5),
              labels=c("무취학","초졸","중졸",
                       "고졸","대졸"))
head(insurance)




#막대 그래프 그리기
#1. 빈도수 
job.freq = table(insurance$job)
job.freq

#2.막대 그리기
barplot(job.fraq)
title("막대 그래프: job")







install.packages("xlsx")
library(xlsx)
drug = read.xlsx("data/drug.xlsx",1)

#변수 변환
# 40세 이하 1, 41~ 60은 2, 60 초과는 3으로 변수 agr에 설정
drug$agr = drug$age
drug$agr[drug$agr >= 20 & drug$agr<= 40] = 1
drug$agr[drug$agr > 40 & drug$agr<= 60] = 2
drug$agr[drug$agr> 60] = 3
drug[c(1,20,40,95),]










install.packages("car")
library(car)
drug$agr2 = drug$age
drug$agr2 = recode(drug$age,"lo:40=1;40:60=2;60:hi=3")
drug[c(1,20,40,95),]



#recode를 시킨 이후 그룹을 순서형으로 라벨을 주어야
#이해하기 좋다.
#그룹 변수 값을 순서형으로 바꾸기
drug$agr2 = ordered(drug$agr2,levels=c(1:3),
              labels=c("Lo~40","40~60","60~Hi"))
agr2.freq=table(drug$agr2)
agr2.freq






insurance = read.table("data/insurance.txt",header=T)
#값 추출하기
select1 = insurance[insurance$sex=="m",]
head(select1)

select2 = insurance[which(insurance$sex=="f"&
                  insurance$job==2),]
head(select2)
