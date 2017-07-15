#Reading th csv File
customer=read.csv("Customer Fix.csv")

str(customer)
summary(customer)

######remove coloumns
customer = customer[-c( 2,3)]
summary(customer)
#########Plots#########
#plot( table(customer$Customer_ID) , table(customer$Customer_Type) , xlab = "Customer" , ylab = "Customer type")

##Histogram
#hist(customer$Customer_Type , xlab = "Customer_Type" ,ylab = "Frequency" , main = "Histogram of type of customer" )
barplot(table(customer$Customer_Type))

#install.packages("DMwR")
library(DMwR)
#install.packages("caret")
library(caret)
#install.packages("dplyr")
library(dplyr)
### customer$Customer_ID <- as.factor(customer$Customer_ID)

customer=customer[ -c(2,3,4,5) ]
str(customer)
summary(customer)
preproc <- preProcess(customer)
custNorm <- predict(preproc, customer)
summary(custNorm)
custNorm=scale(customer)
summary(custNorm)

set.seed(5000)
clustKMC <- kmeans(custNorm, centers = 3)

table(custKMC$cluster)
install.packages("cluster")
install.packages("fpc")
library(fpc)
library(cluster)
plotcluster(custNorm, clustKMC$cluster)
clusplot(custNorm, clustKMC$cluster, color=TRUE, shade=TRUE, 
         labels=2, lines=0)
normcluster1 <- subset(custNorm, custKMC$cluster == 1)
summary(normcluster1)
cluster1=unscale(normcluster1,custNorm)
summary(cluster1)

normcluster2 <- subset(custNorm, custKMC$cluster == 2)
summary(normcluster2)
cluster2=unscale(normcluster2,custNorm)
summary(cluster2)

normcluster3 <- subset(custNorm, custKMC$cluster == 3)
summary(normcluster3)
cluster3=unscale(normcluster3,custNorm)
summary(cluster3)

 