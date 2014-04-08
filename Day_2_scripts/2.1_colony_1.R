# Load data, order Z and plot
colony<-read.csv("2.1_colony_trial.csv")
colony$Z<-factor(colony$Z,c("None","Low","Medium","High"))
plot(Count~Z,colony)

# Analysis of Variance
colony.aov<-aov(Count~Z,colony)
print(summary(colony.aov))

#mean(colony[colony$Z=="None",]$Count)
#mean(colony[colony$Z=="Low",]$Count)
#mean(colony[colony$Z=="Medium",]$Count)
#mean(colony[colony$Z=="High",]$Count)

#for (z in levels(colony$Z)) {
#    print(mean(colony[colony$Z==z,]$Count))
#}

# Calculate group means
colony.means<-tapply(colony$Count,colony$Z,mean)
print(colony.means)
barplot(colony.means)