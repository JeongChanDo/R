# sample data
sample1 = c(10.2, 10.5, 10.3, 10.8,
            9.8, 10.6, 10.7, 10.2, 10.0, 10.1)
sample2 = c(9.8, 9.6, 10.1, 10.2, 10.1, 9.7,
            9.5, 9.6, 9.8, 9.9)

# lty는 linetype=2
plot(density(sample1), lty=1, ylim=c(0, 1.5))
#lines() 함수는 plot 그래프위에 추가 그래프
lines(density(sample2), lty=2, ylim=c(0, 1.5))

t.test(sample1, sample2, var.equal=T)


boxplot(sample1, sample2, ylab="약효",
        names=c("sample1","sample2"),
        main="생산 직후와 1년 후의 약효")
