library(ggplot2)
view(iris)
summary(iris)
#scatterplot
plot(Iris$sepallength)
s1<-iris$sepallength
hist(s1)
density(s1)
s1.d<-density(s1)
plot(s1.d)
hist(s1,freq = F)
lines(s1.d)
s1.b<-boxplot(s1)
summary(s1.b)
names(s1.b)
?boxplot