# Load data, order Z and plot
colony<-read.csv("2.1_colony_trial.csv")
colony$Z<-factor(colony$Z,c("None","Low","Medium","High"))
attach(colony)
plot(Count~Z)

# Analysis of Variance
colony.aov<-aov(Count~Z)
print(summary(colony.aov))

#mean(colony[Z=="None",]$Count)
#mean(colony[Z=="Low",]$Count)
#mean(colony[Z=="Medium",]$Count)
#mean(colony[Z=="High",]$Count)

#for (z in levels(Z)) {
#    print(mean(colony[Z==z,]$Count))
#}

# Calculate group means
colony.means<-tapply(Count,Z,mean)
print(colony.means)
barplot(colony.means)
detach(colony)