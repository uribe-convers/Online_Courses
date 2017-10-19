#=====Lecture 10 r code: linear models
metals <- read.table("Data//metals.txt", header=T)
head(metals, n=3)
table(metals$Site)  #how many samples from each site
tapply(X=metals$Fe, INDEX=metals$Site, FUN=mean)

#now run the ANOVA model 
plot(Fe ~ Site, data=metals)  #try the default plot
Fe.aov <- aov(Fe~Site, data=metals)
summary(Fe.aov)

#alternative method of running ANOVA
Fe.lm <- lm(Fe~Site, data=metals)
anova(Fe.lm)
summary(Fe.lm) #more output from lm()

#Tukeys honest significant difference test
Fe.aov <- aov(Fe~Site, data=metals)
TukeyHSD(Fe.aov)
plot(TukeyHSD(Fe.aov))

#Tests
table(metals$Site)

#=======In-class exercise 1
metals <- read.table("Data//metals.txt", header=T)
Fe.lm <- lm(Fe~Site, data=metals)
names(Fe.lm)  #find out how to get the residuals
Fe.lm$residuals

#use a qq-plot to see if it is normal
qqnorm(Fe.lm$residuals)
qqline(Fe.lm$residuals) 

library(MASS) 
#Kolmogorov-Smirnov test
sigma <- summary(Fe.lm)$sigma
?ks.test

#here the ... means parameters of cumulative distribution function
#i.e. pnorm(mean=0, sd=sigma)
ks.test(x=Fe.lm$residuals, y=pnorm, mean=0, sd=sigma)

#shapiro test
shapiro.test(Fe.lm$residuals) 

#equal group variances?
boxplot(metals$Fe~metals$Site)
boxplot(Fe~Site, data=metals)

#Bartlett's test
bartlett.test(metals$Fe, metals$Site)  

#Fligner test
fligner.test(metals$Fe, metals$Site) 

#Conclusion: 
#cannot reject assumption of normality, 
#or assumption of equal variance

#=========ANCOVA/linear regression
marmot <- read.table("Data//marmot.txt", header=T)
head(marmot)

#interaction plots
interaction.plot(x.factor=marmot$loc, trace.factor=marmot$type, 
                 response=marmot$len, trace.label = "Type",
                 xlab = "Location", lwd=2,  
                 ylab = "Mean of Marmot Whistle Length")

#plot with different colors for different threat types
plot(marmot$dist, marmot$len, xlab = "Distance from challenge", 
     ylab = "Length of whistles", type = "n")  #"n" means "do not plot"!
points(marmot$dist[marmot$type == "Dog"], 
       marmot$len[marmot$type == "Dog"],pch = 17, col = "blue")
points(marmot$dist[marmot$type == "Human"],
       marmot$len[marmot$type == "Human"],pch = 18, col = "red")
points(marmot$dist[marmot$type == "RCPlane"], 
       marmot$len[marmot$type == "RCPlane"], pch = 19, col = "green")
legend("bottomleft", bty = 'n', levels(marmot$type), 
       col = c("blue", "red", "green"), pch = 17:19)

#model with interactions
interactionModel <- lm(len ~ loc + type*dist, data=marmot)
interactionModel
summary(interactionModel)

#components of the summary output stored in a list
names(interactionModel)


#what the formula of the call was
interactionModel$call

#ANOVA partial f-test
interactionModel <- lm(len ~ loc + type*dist, data=marmot)
nonInteractionModel <- lm(len ~ loc + type + dist, data = marmot)
anova(nonInteractionModel,interactionModel)

#=============Hands-on exercise 2
AIC(nonInteractionModel, interactionModel)
#or one at a time
AIC(nonInteractionModel)
AIC(interactionModel)

logLik(nonInteractionModel)
logLik(interactionModel)

n <- nrow(marmot)  #number of data points

#number of fitted coefficients PLUS variance (+1)
#that is the number of parameters in the model
#also logLik returns "df" which is number of pars
p1 <- length(nonInteractionModel$coefficients) + 1 
p2 <- length(interactionModel$coefficients) + 1 
p1
p2
AIC.nonIM <- -2*logLik(nonInteractionModel)+2*p1
AIC.IM <- -2*logLik(interactionModel)+2*p2
AIC.nonIM
AIC.IM  #lower AIC = better model
   
#AIC corrected
AICc.nonIM <- -2*logLik(nonInteractionModel)+
   2*p1*(n/(n-p1-1))
AICc.IM <- -2*logLik(interactionModel)+
   2*p2*(n/(n-p2-1))
AICc.nonIM
AICc.IM  #lower AIC = better model

#still favor the model with the interaction term
#since it has lower AICc


#=========checking model assumptions
plot(interactionModel)
plot(interactionModel, which=2)

#confidence intervals for parameters
round(confint(interactionModel),6)

# example making predictions

( newobs <- data.frame(rep = c(3, 1), dist = c(10, 13), type = rep("Dog", 2), loc = rep("A", 2)) )

predict(interactionModel, newobs, interval = "confidence")
predict(interactionModel, newobs, interval = "prediction")



