# Load data, order Z and plot
colony<-read.csv("2.1_colony_run.csv")
colony$Z<-factor(colony$Z,c("None","Low","Medium","High"))
attach(colony)

par(oma=c(6,2,2,2))
boxplot(Count~X*Z,las=2)

# Analysis of Variance
colony.aov<-aov(Count~X*Z)
print(summary(colony.aov))

# Calculate group means
colony.means<-tapply(Count,list(Z,X),mean)
print(colony.means)
barplot(colony.means,beside=TRUE)
detach(colony)