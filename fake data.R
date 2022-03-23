#hwk8
library(ggplot2)
library(boot)
library(partsm)

t0x <- round(rnorm(500, mean = 0.6, sd = .1))
#t0<- inv.logit(t0x)

#

A = data.frame(id = 1:500,trt='A', t0x)

t0x <- round(rnorm(500, mean = 0.5, sd = .2))



B = data.frame(id=501:1000, trt='B',t0x)
tC<-rbind(A,B)

x<-aov(t0x~trt, data=tC)
summary(x)
ggplot(tC,mapping=aes(x=t0x,y=trt))








