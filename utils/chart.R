library(reshape2)
library(ggplot2)
library(ggthemes)

data.8 <- read.csv('../data/8generations.csv')
data.32 <- read.csv('../data/32generations.csv')

ggplot(data.8,aes(x=Threads,y=Evaluations,group=Threads))+geom_boxplot()+scale_x_log10()+theme_tufte()+labs(x="Threads",y="Evaluations",title="Generation gap = 8")
ggplot(data.32,aes(x=Threads,y=Evaluations,group=Threads))+geom_boxplot()+scale_x_log10()+theme_tufte()+labs(x="Threads",y="Evaluations",title="Generation gap = 8")

data <- data.frame(generations=c(rep(8,length(data.8$Time)),rep(32,length(data.32$Time))),time=c(data.8$Time,data.32$Time),evaluations=c(data.8$Evaluations,data.32$Evaluations))
ggplot(data,aes(x=evaluations,y=time,color=generations))+geom_point()+theme_tufte()+labs(x="Evaluations",y="Time",title="Evaluations vs Time per generation gap")

ggplot(data,aes(x=generations,y=evaluations,group=generations))+geom_boxplot()+theme_tufte()+labs(title="Evaluations vs generation gap")
ggplot(data,aes(x=generations,y=time,group=generations))+geom_boxplot()+theme_tufte()+labs(title="Time vs generation gap")
