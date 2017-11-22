###################################################
# Exercise 2a. 
# How can we improve this graph? 
# From what we have learned about R basic graph command, 
# implement at least 3 improvements to this graph.
library(ggplot2)
data(mpg)
head(mpg)
plot(cty~hwy, data = mpg)
#改进：1.添加标题和xy轴；2.添加图例；3.极端值标签
#需要先变成因子变量
mpg$drv <- as.factor(mpg$drv)
is.factor(mpg$drv)
#极端值
outliners <- mpg[which(mpg$hwy>40),]
#作图
plot(x= mpg$cty ,y=mpg$hwy, ann=FALSE, col=mpg$drv)
title(main='Energy Efficiency of Highway and City', 
        ylab='Highway Miles/Gallon',
        xlab='City Miles/Gallon')
legend('topleft',inset=.05, legend=c("r","f","4"),
       fill = c('green', 'red', 'black'))
text(outliners$cty,outliners$hwy,outliners$drv,col = "blue",pos=2,cex=0.8)

# Exercise 2b.
# How can we improve this graph? 
# From what we have learned about R basic graph command, 
# implement at least 3 improvements to this graph.
library(nycflights13)
data(weather)
head(weather)
boxplot(temp ~ month, data = weather)
#改进
boxplot(temp ~ month, data = weather)
title(main='Weather among the Year',ylab='Temputure',xlab='Month')

###################################################
# Exercise 2c. Use ggplot2 to improve 2a图
library(ggplot2)
data(mpg)
ggplot(data=mpg,mapping=aes(x=cty,y=hwy))+
  geom_point(aes(color=drv))+
  geom_smooth()+
  ylab("Highway Miles/Gallon")+
  xlab("City Miles/Gallon")+
  ggtitle("Energy Efficiency of Highway and City")
  
# Exercise 2d. Use ggplot2 to improve 2b图
library(nycflights13)
library(tidyverse)
data(weather)
head(weather)

weather$month <- as.factor(weather$month)

ggplot(data=weather,mapping = aes(x=month,y=temp))+
  geom_boxplot(outlier.alpha = 0)+
  ylab("Tempreture")+
  xlab("Month")+
  ggtitle("Weather among the Year")


