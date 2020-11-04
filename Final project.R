AHA <- read.csv("~/Desktop/QTM100L/data/AHA_data.csv", comment.char="#")
#import the dataset AHA_data

#################
# Data Cleaning #

AHA$beds2<-AHA$beds
#Create a new version of beds called beds2 which represent a cleaned version of beds
AHA$beds2[AHA$beds==99999] <- NA
#Recode entries equal to 99999 of beds2 to NA
summary(AHA$beds2)

AHA$patdays2<-AHA$patdays
#Create a new version of patdays called patdays2 which represent a cleaned version of patdays
AHA$patdays2[AHA$patdays==0] <- NA
#Recode entries equal to 0 of patdays2 to NA
summary(AHA$patdays2)

AHA$MAPP192<-AHA$MAPP19
#Create a new version of MAPP19 called MAPP192 which represent a cleaned version of MAPP19
AHA$MAPP19==99
#identify implausible observation in beds
table(AHA$MAPP19)
#to see the level of MAPP19
AHA$MAPP192[AHA$MAPP19=="1"]<-"no"
AHA$MAPP192[AHA$MAPP19=="2"]<-"yes"
#Re-code all values of MAPP192 to be "no" where MAPP19 is "1" and
#all values of MAPP192 to be "yes" where MAPP19 is "2"

table(AHA$type)
#It's good.

###############################
# Create dichotomized variable#

AHA$bedsCategory<-factor(NA,levels=c("small size","big size"))
#Create new variable for grossrev category
AHA$bedsCategory[AHA$beds2<189]<-"small size"
AHA$bedsCategory[AHA$beds2>=189]<-"big size"
#Assign values of beds category

#########
# test1 #
#Samples collected randomly.
#Each observations are independent.
#Since N>40, assume normal distribution.
#Conditions satisfied for t test.
#Use one-sample t-test for the correlation between total days patients spent
#in hospital and bed number.
#The data were gathered using randomization.
#The observations are independent.
#The population means of y at different values of x have a straight-line relationship with x.
hist(rstandard(m1))
# The population values of y at each value of x follow a normal distribution 
#(nearly normal residuals) with the same standard deviation (𝜎) at each x value
#Assumptions satisfied for valid inferences.
m1=lm(AHA$beds2~AHA$patdays2)
#Calculate a linear model for the correlation between bed numbers and total days patients in hospital
#Store the result into object m1
summary(m1)
#See the result of the linear model
confint(m1)
#Obtain confidence interval for the regression coefficient
#For the estimation of the slope, since p=2e-16<0.05, and the confidence interval is
#(0.00353,0.00368), which doesn't contian 0, we can conclude that the slope is significantly
#different than 0, and there is a correlation between total days patients spent in hospital
#and bed number.
plot(AHA$beds2~AHA$patdays2,
     main="Association between bed numbers and total days patients spent in hospital",
     xlab="Total days patients spent in hospital",
     ylab="Bed numbers")
#Produce a scatterplot for the association between bed numbers and total days patients spent in hospital
abline(m1)
#adds regression line estimated from m1 to scatterplot
#Since the line suggest a positive correlation, we could conclude that there is a positive
#correlation between bed numbers and total days patients spent in hospital.

#########
# test2 #
result<-chisq.test(AHA$bedsCategory,AHA$type,correct=F)
result$expected
#Perform chi-square to assess the association between bedsCategory and organization type
#Store the result of the chi-square test as an object
#All expected cell counts are at least 5, so conditions are satisfied for valid inference.
chisq.test(AHA$bedsCategory,AHA$type,correct=F)
#Perform the chi-squared t-test
#Since p=8.705e-06<0.05, we have significant evidence to conclude that there is a 
#relationship between hospital size and organization type. 
beds_type<-table(AHA$bedsCategory,AHA$type)
beds_type
#Store the table of bedsCategory and type into a variable beds_type
addmargins(beds_type)
prop.table(beds_type)
#See the proportions
prop.test(c(182,217),c(309,483),correct=F)
#Since p=0.000125<0.05, we have enough evidence to conclude that hospitals owned by
#church are more likely to have big size than those owned by for-profit organizations.
prop.test(c(182,758),c(309,1315),correct=F)
#Since p=0.6871>0.05, we don't have enough evidence to conclude that hospitals owned by
#church organization are more or less likely to have big size than those owned by non-profit organizations.
prop.test(c(182,159),c(309,305),correct=F)
#Since p=0.0915>0.05, we don't have enough evidence to conclude that hospitals owned by
#non-profit organization are more or less likely to have big size than those owned by state.
prop.test(c(217,758),c(483,1315),correct=F)
#Since p=1.613e-06<0.05, we have enough evidence to conclude that hospitals owned by
#for-profit organizations are less likely to have big size than those owned by non-profit organizations.
prop.test(c(217,159),c(483,305),correct=F)
#Since p=0.04862<0.05, we have enough evidence to conclude that hospitals owned by
#for-profit organizations are less likely to have big size than those owned by state.
prop.test(c(758,159),c(1315,305),correct=F)
#Since p=0.08016>0.05, we don't have enough evidence to conclude that hospitals owned by non-profit organizations are
#more or less likely to have big size than those owned by state.

##########
# test 3 #
#Samples are randomly selected.
#Observations are independent of each other.
#Since there are over 30 entries, we could assume normal distribution.
#Assumptions satisfied for valid inferences.
t.test(AHA$beds2~AHA$MAPP192,var.equal=FALSE)
#Perform two-sample t test for the relationship between bed numbers and the presence of a rural referral center
#Since p=8.453e-06<0.05, and the mean of hospitals with a rural referral center is larger than those without,
#we have significant evidence to conclude that the true mean bed numbers for hospitals
#with rurual referral center is larger than those without a rural referral center.

####################################
# Calculate results for Appendix A #
install.packages("Rmisc")
library(Rmisc)
summarySE(data=AHA,measurevar="beds2",groupvars="bedsCategory",na.rm=T)
summarySE(data=AHA,measurevar="beds2",na.rm=T)
#Use summary to find the mean and standard deviations of total days patients spent in hospital for hospitals of
#small and big size

beds_rural<-table(AHA$bedsCategory,AHA$MAPP192)
#Store the table of bedsCategory and type into a variable beds_type
addmargins(prop.table(beds_rural))
#See the proportions

beds_type<-table(AHA$bedsCategory,AHA$type)
#Store the table of bedsCategory and type into a variable beds_type
addmargins(prop.table(beds_type))
#See the proportions

###########
# table 2 #
m1=lm(AHA$beds2~AHA$patdays2)
#Calculate a linear model for the correlation between bed numbers and total days patients in hospital
#Store the result into object m1
summary(m1)
#See the result of the linear model
confint(m1)
#Calculate the 95% confidence interval for m1

###########
# table 3 #
chisq.test(AHA$bedsCategory,AHA$type,correct=F)
#Perform the chi-squared t-test
smallsub<-subset(AHA,bedsCategory=="small size")
addmargins(table(smallsub$type))
#Create a subset of small size hospital
#Create a table to see small hispitals' distribution by organization type
bigsub<-subset(AHA,bedsCategory=="big size")
addmargins(table(bigsub$type))
prop.table(AHA$type~AHA$bedsCategory)
#Create a subset of small size hospital
#Create a table to see big hispitals' distribution by organization type

###########
# table 4 #
t.test(AHA$beds2~AHA$MAPP192,var.equal=FALSE)
#Perform two-sample t test for the relationship between bed numbers
#and the presence of a rural referral center
summarySE(data=AHA,measurevar="beds2",groupvars="MAPP192",na.rm=T)

#########
# plots #

plot(AHA$beds2,AHA$patdays2,
     xlab="total days patients spent in hospital",
     ylab="number of beds")
#Create a scatterplot of total days patients spent in hospital and bed number

barplot(table(AHA$type,AHA$bedsCategory),beside=T,
        xlab = "hospital size",
        ylab = "Number of beds",
        args.legend = list(x = "topright",inset=c(0,0)))
#Create a barplot of bed category and MAPP192

boxplot(AHA$beds2~AHA$MAPP192,
        xlab = "the presence of rural referral center",
        ylab = "Number of beds")
#Create a boxplot of beds2 by groups of MAPP192
