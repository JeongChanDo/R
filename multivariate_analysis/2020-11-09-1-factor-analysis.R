med.data = read.table("data/medFactor.txt", header=T)
head(med.data)
summary(med.data)

install.packages("GPArotation")
library(psych)
library(GPArotation)
med.factor = principal(med.data, rotate="none")
names(med.factor)
med.factor$values
plot(med.factor$values, type="b")

med.Varimax$scores

med.Varimax = principal(med.data, nfactors = 3, rotate="varimax")
med.Varimax

biplot(med.Varimax)
