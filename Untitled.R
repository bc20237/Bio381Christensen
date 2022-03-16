#hwk8
library(ggplot2)
library(partsm)

t0x <- rnorm(500, mean = 0.2, sd = .5)
t0<- inv.logit(t0x)
t1x <- rnorm(500, mean = 0.2, sd = .5)
t1<- inv.logit(t1x)
t2x <- rnorm(500, mean = 0.2, sd = .5)
t2<- inv.logit(t2x)
t3x <- rnorm(500, mean = 0.2, sd = .5)
t3<- inv.logit(t3x)
t4x <- rnorm(500, mean = 0.2, sd = .5)
t4<- inv.logit(t4x)
#

A = data.frame(id = 1:500,trt='A', t0,t1,t2,t3,t4)

t0x <- rnorm(500, mean = 0.2, sd = .5)
t0<- inv.logit(t5x)
t1x <- rnorm(500, mean = 0.2, sd = .5)
t1<- inv.logit(t6x)
t2x <- rnorm(500, mean = 0.8, sd = .3)
t2<- inv.logit(t7x)
t3x <- rnorm(500, mean = 0.8, sd = .2)
t3<- inv.logit(t8x)
t4x <- rnorm(500, mean = 0.8, sd = .2)
t4<- inv.logit(t9x)

B = data.frame(id=501:1000, trt='B',t0,t1,t2,t3,t4)
tC<-rbind(A,B)

model<-ar(tC, method="ols")
summary(model)
avgs<-data.frame(time=1:10,prop=model$x.mean[3:12])






