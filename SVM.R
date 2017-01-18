load(url("http://www.stanford.edu/~hastie/ElemStatLearn/datasets/ESL.mixture.rda"))
names(ESL.mixture)
rm(x,y)
attach(ESL.mixture)

#Lets generate some data in two dimensions, and make them a little separated.

set.seed(10111)
x=matrix(rnorm(40),20,2)
y=rep(c(-1,1),c(10,10))
x[y==1,]=x[y==1,]+1
plot(x,col=y+3,pch=19)

#Now we will load the package `e1071` which contains the `svm` function we will use. We then compute the fit. Notice that we have to specify a `cost` parameter, which is a tuning parameter. 

library(e1071)
dat=data.frame(x,y=as.factor(y))
svmfit=svm(y~.,data=dat,kernel="linear",cost=10,scale=FALSE)
print(svmfit)
plot(svmfit,dat)


###### will update on the complete analysis soon ###
