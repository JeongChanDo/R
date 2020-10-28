crab = scan("data/crab.txt")
crab

t.test(crab, mu = 24.3)


drug = read.csv("data/drug.csv",header=T)
drug[c(1,7),]
t.test(time ~ drug, data=drug)


var.test(time~drug, data=drug)





deer = read.csv("data/deer.csv", header=T)
head(deer)
t.test(deer$hleg, deer$fleg, paired=TRUE)
