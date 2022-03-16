#compbio lab 3.16.22
library(boot)
#2hy simulate data
#save time: write code before u have data
#baseline for comparisons: check assumptions in your data
#test new stats techniques

#
g1<-rnorm(n=20,mean=2,sd=1)
hist(g1)
g2<-rnorm(n=20,mean=5,sd=1)
g3<-rnorm(n=20, mean=2,sd=3)
hist(g2)
hist(g3)
#start with constant slope, intercept 0, x is predictor 
b1<-1
#normally distributed predictive variable
x<-rnorm(n=20)
y<-b1*x

#add intercept
b0<-2
y<-b0+b1*x
#abundance/count data
#use round to remove decimals
abund1<-round(rnorm(n=20, mean=50,sd=10))
hist(abund1)
#poisson
abund2<-rpois(n=20,lambda=3)
barplot(table(abund2))
#loglink fx
#adding a covariate term to account for nonrandom effects
#first create our lambdas 
pre.lambda<-b0+b1*x
#use inverse log to make lambdas positive
lambda<-exp(pre.lambda)
abund3<-rpois(n=20, lambda=lambda)
hist(abund3)
probs<-rbeta(n=20,shape=1,shape2=1)
occ1<-rbinom(n=20,size=1,prob=probs)
occ1
#opt2 occupancy with a covariate
#similar to above
pre.probs<b0+b1*x
print(pre.probs)
#convert to 0-1 scale (so no)
psi<-inv.logit(pre.probs)
