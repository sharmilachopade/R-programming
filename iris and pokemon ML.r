library(dplyr)
library(caTools)
View(iris)
#clustering
iris[1:4]->iris_k
View(iris_k)
kmeans(iris_k,3)->i_cluster
View(i_cluster)
cbind(iris,i_cluster$cluster)->clustered_data
View(clustered_data)
read.csv("C:/Users/Administrator/Downloads/pokemon/pokemon_alopez247.csv")->pokemon
pokemon %>% select(-1)->pokemon
View(pokemon)
library(dplyr)
# Renameing
View(pokemon)
colnames(pokemon)[2]<-"Primary_type"
colnames(pokemon)[3]<-"Secondary_type"
colnames(pokemon)[5]<-"health_point"
colnames(pokemon)[8]<-"special_attack"
colnames(pokemon)[9]<-"special_defence"
View(pokemon)

str(pokemon)
as.factor(pokemon$isLegendary)->isLeendary
as.factor(pokemon$hasMegaEvolution)->hasMegaEvolution
as.factor(pokemon$hasgender)->hasgender

table(pokemon$Primary_type)
#
library(dplyr)

pokemon %>% filter(Primary_type=="Grass")->Grass_pokemon
Grass_pokemon %>% filter(Secondary_type=="Poison")->Grass_poison_pokemon
range(Grass_poison_pokemon$Speed)
Grass_poison_pokemon%>% filter(Speed==90)->My_speed_Pokemon

pokemon %>% filter(Primary_type=="Water")->water_pokemon
water_pokemon %>% filter ( Secondary_type=="Psychic")->water_psychic_pokemon
range(water_psychic_pokemon$Defense)
water_psychic_pokemon %>% filter(Defense==110)->My_water_Pokemon
View(My_water_Pokemon)

pokemon %>% filter(Primary_type=="Fire")->fire_pokemon
fire_pokemon %>% filter ( Secondary_type=="Fighting")->fire_Fighting_pokemon
range(fire_Fighting_pokemon$Attack)
fire_Fighting_pokemon %>% filter(Attack==123)->My_fire_Pokemon
View(My_fire_Pokemon)

rbind(My_speed_Pokemon,My_water_Pokemon,My_fire_Pokemon)->My_pokemon
View(My_pokemon)


# Linear regrassion
#slpitting of data
sample.split(pokemon$Attack,SplitRatio = 0.65)->split_index
subset(pokemon,split_index==T)->train1
subset(pokemon,split_index==F)->test1

View(train1)
View(test1)
#Building model attack vs defence
lm(Attack~Defense,data = train1)->mod_reg
View(mod_reg)
predict(mod_reg,test1)->result_reg1
View(result_reg1)

cbind(Actual=test1$Attack,Predicted=result_reg1)->final_data
as.data.frame(final_data)->final_data
View(final_data)

# find out Error
(final_data$Actual-final_data$Predicted)->error
View(error)
cbind(final_data,error)->final_data
rme1<-sqrt(mean(final_data$error^2))
rme1

#Building model attack vs defence
lm(Attack~Defense+Speed+health_point,data = train1)->mod_reg2
predict(mod_reg,test1)->result_reg2
cbind(Actual=test1$Attack,Predicted=result_reg2)->final_data2
as.data.frame(final_data2)->final_data2
View(final_data2)


# find out Error
(final_data2$Actual-final_data2$Predicted)->error2
View(error2)
cbind(final_data2,error2)->final_data2
rme2<-sqrt(mean(final_data2$error2^2))
rme2

sample.split(pokemon$Attack,SplitRatio = 0.65)->split_index
subset(pokemon,split_index==T)->train1
subset(pokemon,split_index==F)->test1
