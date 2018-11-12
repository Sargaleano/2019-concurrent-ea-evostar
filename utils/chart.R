library(reshape2)
library(ggplot2)
library(ggthemes)

data.8 <- read.csv('data/8generations.csv')
data.16 <- read.csv('data/16generations.csv')
data.32 <- read.csv('data/32generations.csv')
data.64 <- read.csv('data/64generations.csv')

ggplot(data.8,aes(x=Threads,y=Evaluations,group=Threads))+geom_boxplot()+scale_x_log10()+theme_tufte()+labs(x="Threads",y="Evaluations",title="Generation gap = 8")
ggplot(data.32,aes(x=Threads,y=Evaluations,group=Threads))+geom_boxplot()+scale_x_log10()+theme_tufte()+labs(x="Threads",y="Evaluations",title="Generation gap = 8")

data <- data.frame(generations=c(rep(8,length(data.8$Time)),
                                 rep(16,length(data.16$Time)),
                                 rep(32,length(data.32$Time)),
                                 rep(64,length(data.64$Time))),
                   time=c(data.8$Time,data.16$Time,data.32$Time,data.64$Time),
                   evaluations=c(data.8$Evaluations,data.16$Generations,data.32$Evaluations,data.64$Generations))

ggplot(data,aes(x=evaluations,y=time,color=generations))+scale_color_brewer(palette="Set1")+geom_point()+theme_tufte()+labs(x="Evaluations",y="Time",title="Evaluations vs Time per generation gap")

data$generations = as.factor(data$generations)
ggplot(data,aes(x=generations,y=evaluations,group=generations))+geom_boxplot()+theme_tufte()+labs(title="Evaluations vs generation gap")
ggplot(data,aes(x=generations,y=time,group=generations))+geom_boxplot()+theme_tufte()+labs(title="Time vs generation gap")

data$avg.eval = data$evaluations/data$time
ggplot(data,aes(x=generations,y=avg.eval,group=generations))+geom_boxplot()+theme_tufte()+labs(title="Time vs generation gap")
