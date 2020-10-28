library(dplyr)
insurance = read.table("data/insurance.txt",header=T)
dim(insurance)
tbl_df(insurance)


# sex = m 이고 edu=3인 추출
sel1 = filter(insurance, sex=='m', edu==3)
head(sel1)


# sel = m 이거나 edu=3추출
sel2 = filter(insurance, sex=='m' | edu==3)
head(sel2)



sel3 = select(insurance, sex, job, amount, salary)
head(sel3)


sel4 = filter(select(insurance,sex, job, amount, salary), job==1)
head(sel4)


sel5 = select(insurance, job:salary)
head(sel5)



insu_add = mutate(insurance, amopersal = amount/salary)
head(insu_add)



#정렬하기
# 성별, 직업 기준 오름차순
sel3_asc = arrange(sel3, sex, job)
head(sel3_asc)

# 성별, 직업 기준 내림차순
sel3_desc =arrange(sel3,desc(sex), desc(job))
head(sel3_desc)



# 정리해서 보기. 그룹 - 요약
ins_job = arrange(insurance, job)
ins_job_g = group_by(ins_job, job)
ins_job_gm = summarise(ins_job_g, amMean =mean(amount),aSal=mean(salary))
head(ins_job_gm)


# 체인 기능
# 여러명령 연결해서 한번에 수행
# %>%


ins = insurance %>%
  select(amount,salary) %>%
  filter(salary > 130)
ins





#mtcar 데이터 처리 예제
head(mtcars)


mtcars %>% filter(am == 0) %>%
  group_by(carb) %>%
  summarise(mean(mpg))



mtcars %>% filter(gear !=5) %>% group_by(gear) %>%
  summarize(Avg_mpg = mean(mpg),
            Meadian_hp = as.numeric(median(hp)),
            Count=n()) %>%
  arrange(desc(Count))




#nycflights13 데이터 처리 예제
install.packages("nycflights13")
library(nycflights13)
#nycflights13에 존재하는 데이터프레임들
ls("package:nycflights13")


dim(flights)
tbl_df(flights)



# 출발, 도착이 지연되지 않은 경우
not_delayed <- flights %>%
        filter(!is.na(dep_delay), !is.na(arr_delay))
head(not_delayed)
