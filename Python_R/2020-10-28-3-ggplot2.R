library(dplyr)
library(ggplot2)
tbl_df(trees)

# Height를 4그룹으로 분리
H = cut(trees$Height, 4)
H


ggplot(data=trees) +
  geom_point(aes(x=Girth,y=Volume))


ggplot(data=trees) +
  geom_point(aes(x=Girth, y=Volume, col = H))




tbl_df(mpg)

hwy_plot <-ggplot(data=mpg)+
    geom_point(aes(x=displ, y = hwy, color=class))
hwy_plot


