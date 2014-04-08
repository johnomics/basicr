# Load data
colony.files<-dir(pattern="Counts.csv")
colony<-data.frame()
for (cf in colony.files) {
  colony<-rbind(colony,read.csv(cf))
}
colony$Z<-factor(colony$Z,c("None","Low","Medium","High"))

nruns<-length(colony.files)
Run<-rep(1:nruns,each=nrow(colony)/nruns)
colony<-cbind(Run,colony)

# Plot
par(oma=c(8,2,2,2))
boxplot(Count~X*Z*Run,colony,las=2)

# Analysis of Variance
colony.aov<-aov(Count~X*Z*Run,colony)
print(summary(colony.aov))

# Calculate group means
colony.means<-tapply(colony$Count,list(colony$Z,colony$X,colony$Run),mean)
print(colony.means)

#barplot(colony.means,beside=TRUE) # Why doesn't this work?
