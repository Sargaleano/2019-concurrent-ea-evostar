library(reshape2)
library(ggplot2)
library(ggthemes)

data <- read.csv('../data/8generations.csv')

ggplot(data,aes(x=Threads,y=Evaluations,group=Threads))+geom_boxplot()+scale_x_log10()+theme_tufte()+labs(x="Threads",y="Evaluations",title="Generation gap = 8")
