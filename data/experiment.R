setwd("~/Dropbox/courses/political_inquiry/data")

df<-read.csv("class_experiment.csv")



names(df)

df$y<-df[,22]
df$gender<-df[,16]
df$edu<-df[,17]

df$x<-gsub("^$|^ $", NA, df$Treatment.control)

sub<-subset(df, y<100)

model<-lm(y ~ x, data=df)

summary(model)

require(visreg)

visreg(model, xvar="x", ylab="Self-reported interest in politics")

require(plyr)

dt <- data.frame(age=rchisq(20,10),group=sample(1:2,20,rep=T))
ddply(df,~x,summarise,mean=mean(y),sd=sd(y), count=count(y))
