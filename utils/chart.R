library(reshape2)
library(ggplot2)
library(ggthemes)

data.8 <- read.csv('../data/8generations.csv')
data.32 <- read.csv('../data/32generations.csv')

ggplot(data.8,aes(x=Threads,y=Evaluations,group=Threads))+geom_boxplot()+scale_x_log10()+theme_tufte()+labs(x="Threads",y="Evaluations",title="Generation gap = 8")
ggplot(data.32,aes(x=Threads,y=Evaluations,group=Threads))+geom_boxplot()+scale_x_log10()+theme_tufte()+labs(x="Threads",y="Evaluations",title="Generation gap = 8")
