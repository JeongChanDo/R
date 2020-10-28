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




