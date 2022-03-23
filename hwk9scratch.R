#hwk9
#simulate data for 1st trial
simDataNaB<-function(mu1=.5,mu2=.35,mu3=.35, mu4=.35,sd1=.1,sd2=.1,sd3=.1, sd4=.1) {
  library(ggplot2)
  library(boot)
  library(partsm)
  library(tidyverse)
  t0x <- round(rnorm(500, mean = mu1, sd = sd1))
  propmort<-sum(t0x)/500
  A = data.frame(id = 1:500,trt='0', t0x, propmort)
  t0x <- round(rnorm(500, mean = mu2, sd = sd2))
  propmort<-sum(t0x)/500
  B = data.frame(id=501:1000, trt='0.25',t0x, propmort)
  t0x <- round(rnorm(500, mean = mu3, sd = sd3))
  propmort<-sum(t0x)/500
  C = data.frame(id = 1001:1500,trt='1', t0x, propmort)
  t0x <- round(rnorm(500, mean = mu4, sd = sd4))
  propmort<-sum(t0x)/500
  D = data.frame(id=1501:2000, trt='4',t0x, propmort)
  NaB<-rbind(A,B,C,D)
  mutate(NaB,Mort=sum(t0x)/2000)
  return(NaB)
}
#simulate data for second trial 

simDataC<-function(mu1=.3,mu2=.6,mu3=.7,sd1=.2,sd2=.1,sd3=.1) {
  library(ggplot2)
  library(boot)
  library(partsm)
  library(tidyverse)
  t0x <- round(rnorm(500, mean = mu1, sd = sd1))
  propmort<-sum(t0x)/500
  A = data.frame(id = 1:500,trt='0', t0x, propmort)
  t0x <- round(rnorm(500, mean = mu2, sd = sd2))
  propmort<-sum(t0x)/500
  B = data.frame(id=501:1000, trt='0.25',t0x,propmort)
  t0x <- round(rnorm(500, mean = mu3, sd = sd3))
  propmort<-sum(t0x)/500
  C = data.frame(id = 1001:1500,trt='1', t0x,propmort)
  Cr<-rbind(A,B,C)
  return(Cr)
}
NaB<-simDataNaB()

Cr<-simDataC()

ggplot(Cr,aes(x=trt,y=t0x, fill=propmort))+geom_bar(stat='identity')
ggplot(NaB,aes(x=trt,y=t0x, fill=propmort))+geom_bar(stat='identity')
