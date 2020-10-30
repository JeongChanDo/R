market = read.table("data/market-2.txt", header=T)
head(market)
X = market[,c(2:3)]
head(X)
X = cbind(1,X)
head(X)
Y = market[,c(4)]
X = as.matrix(X)
Y = as.matrix(Y)
XTX = t(X) %*% X
XTX
XTXI = solve(XTX) #역행렬 구하기 위해 sovle() 
XTY = t(X) %*% Y
beta = XTXI %*% XTY
beta = round(beta,3)
beta


market2.lm = lm(Y~X1 +X2, data=market)
summary(market2.lm)

anova(market2.lm)
