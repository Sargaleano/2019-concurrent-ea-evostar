library(reshape2)
library(ggplot2)
library(ggthemes)

data <- read.csv('individual.csv',header=F)
data.v2 <- melt(data,id.vars=c("V1") )
evaluations <- data.frame(bits=data.v2$V1,evaluations=data.v2$value )
ggplot(evaluations,aes(x=bits,y=evaluations,group=bits))+geom_boxplot()+ scale_y_log10()+theme_tufte()+labs(x="Bits",y="Evaluations",title="Concurrent individually concurrent evolutionary algorithm")

