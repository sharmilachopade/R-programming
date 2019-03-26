library(dplyr)
library(hflights)
mutate(hflights,ActualGroundTime=ActualElapsedTime-AirTime)->flight1
mutate(hflights,AvgSped=Distance/AirTime*60)->flight1
mutate(hflights,Totaltaxi=TaxiIn*TaxiOut)->flight1
mutate(hflights,TimeLoss=ArrDelay+DepDelay)->flight1
View(flight1)
filter(hflights,Distance>1000)->flight1
View(flight1)
filter(hflights,Distance>1000)->flight1
View(flight1)
range(flight1$Distance)
filter(hflights,UniqueCarrier %in% c("oo","us","AA"))->flight1
View(flight1)
table(flight1$UniqueCarrier)
filter(hflights,TaxiIn+TaxiOut>AirTime)->flight1
filter(hflights,DepTime<500 | ArrTime>2200)->flight1
filter(hflights,Dest=="JFK" & Cancelled==1)->flight1
View(flight1)
arrange(hflights,DepDelay)->flight1
arrange(hflights,DepDelay+ArrDelay)->flight1
# summarise
#---------
summarise(hflights,min_dist=min(Distance),max_dist=max(Distance))
summarise(hflights,earliest=min(ArrDelay,na.rm=T),average=mean(ArrDelay,na.rm=T),
          latest=max(ArrDelay,na.rm=T),sd=sd(ArrDelay,na.rm=T))

#Pipe
#------------------
library( magrittr)

hflights %>%  select(contains("Time")) %>% arrange(ArrTime) ->flight1 
hflights %>%  filter(UniqueCarrier=="co") %>% summarise(min_time=min(ArrTime,na.rm = T))
View(flight1)


