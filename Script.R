df1<-read.csv('winequality-red.csv',sep = ';')
df2<-read.csv('winequality-white.csv',sep = ';')

head(df1)
head(df2)

df1$label<-sapply(df1$pH,function(x){'red'})
df2$label<-sapply(df2$pH,function(x){'white'})

head(df1)
head(df2)

wine<-rbind(df1,df2)
head(wine)
str(wine)


##Exploring Data
##Histogram of residual sugar from the wine data. Color by red and white wines

library(ggplot2)
pl<-ggplot(wine,aes(residual.sugar))+geom_histogram(aes(fill=label),bins = 50,color='black')
print(pl)

## Histogram of citric.acid from the wine data. Color by red and white wines
pl2<-ggplot(wine,aes(citric.acid))+geom_histogram(aes(fill=label),color='black',bins = 50)
print(pl2)

## Histogram of alcohol from the wine data. Color by red and white wines
pl3<-ggplot(wine,aes(alcohol))+geom_histogram(aes(fill=label),color='black',bins = 50)
print(pl3)

##scatterplot of residual.sugar versus citric.acid, color by red and white wine
pl4<-ggplot(wine,aes(citric.acid,residual.sugar,))+geom_point(aes(color=label))
print(pl4)

##scatterplot of volatile.acidity versus residual.sugar, color by red and white wine
pl5<-ggplot(wine,aes(volatile.acidity,residual.sugar,))+geom_point(aes(color=label))
print(pl5)

clus.data<-wine[,1:12]
head(clus.data)


wine.cluster <- kmeans(wine[1:12],2)
print(wine.cluster$centers)

table(wine$label,wine.cluster$cluster)
