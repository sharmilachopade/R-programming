


View(iris)
#scatter plot
plot(iris$sepallength~iris$petallength)

#time To modify lables
plot(iris$sepallength~iris$petallength,ylab = "sepal Lenght",xlab="petal lenght",main="graph")
plot(iris$sepallength~iris$petallength,ylab = "sepal Lenght",xlab="petal lenght",main="graph",col="blue")


#histograph
hist(iris$sepalwidth)
hist(iris$sepalwidth,xlab="petal lenght",main = "hist",col="blue")

#boxplot
boxplot(iris$sepallength~iris$iris,ylab="sepal lenght",xlab="species",main="bocplot",col="burlywood")


library(ggplot2)
ggplot(data=iris)
ggplot(data=iris,aes(y=sepallength,x=petallength,col=iris)+geom_point()

#asthetics
ggplot(data=iris,aes(y=sepallength,x=petallength,col=iris))+geom_point()
ggplot(data=iris,aes(y=sepallength,x=petallength,shape=iris))+geom_point()
ggplot(data=iris,aes(y=sepallength,x=petallength,col=iris,shape=iris))+geom_point()


#attachment of dataset
house = read.table("http://www.rossmanchance.com/iscam2/data/housing.txt", header = T,sep = "\t")
attach(house)

library(dplyr)
#house %>% select(c(-1))->house
ggplot(data=house,aes(x=price))+geom_histogram()
ggplot(data=house,aes(x=price))+geom_histogram(bins = 30,fill="palegreen4")
ggplot(data=house,aes(x=price))+geom_histogram(bins = 30,fill="palegreen4",col="green")

ggplot(data=house,aes(x=price,fill=bedrooms))+geom_histogram()
ggplot(data=house,aes(x=price,fill=bedrooms))+geom_histogram(position = "fill")

ggplot(data=house,aes(x=price))+geom_freqpoly()
ggplot(data=house,aes(x=factor(bedrooms),y=price,fill=factor(bedrooms))+geom_boxplot()
ggplot(data=house,aes(x=factor(bedrooms),y=price)+geom_boxplot()      
view(housing)
View(housing)
