
View(car1)
library(dplyr)
car1 %>% select(-1)->car1
library(caTools)
install.packages("tidyverse")
sample.split(car1$pur,SplitRatio = 0.65)->sample1
sample.split(car1$pur.splitRatio=3/4)->sample2
subset(car1,sample1==T)->trainset
subset(car1,sample1==T)->testset
library(rpart)
rpart(pur~., data=trainset)->mod_class
predict(mod_class, testset, type= "class") -> result_class
table(testset$pur,result_class)
library(ggplot2)
View(diamonds)
sample.split(diamonds$price,SplitRatio = 0.65)->split_value
subset(car1,sample1==T)->train_reg
subset(car1,sample1==F)->test_reg
subset(diamonds,split_value==T)->train_regbset(diamonds,split_value==F)->test-reg
lm(price ~ .,data-train_reg)->mod_regress
lm(price~ .,data=train_reg)->mod_regress
predict(mod_regress,test_reg)->result_regress