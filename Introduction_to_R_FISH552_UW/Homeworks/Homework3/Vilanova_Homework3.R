# FISH 552  - Introduction to R programming - Fall 2013
# Homework 3
# Name: Emilio Vilanova
# Student ID: 1324780

#######################################################################

# Q1a) Readind in three data sets
# R code
colNames <- c("Year", "spawners", "recruits",
              "catch","fishMortality")
mack.black <- read.table("http://ram.biology.dal.ca/ftp/pub/sr/MACKBLACK.dat",
                         na.strings = ".", col.names = colNames)
mack.nafo <- read.table("http://ram.biology.dal.ca/ftp/pub/sr/MACK2-6.dat",
                        na.strings = ".", col.names = colNames)
mack.ices <- read.table("http://ram.biology.dal.ca/ftp/pub/sr/MACKWS.dat",
                        na.strings = ".", col.names = colNames)

#Q1b)
# R code
mack.partial <- merge(mack.black, mack.nafo, by="Year", suffixes=c(".black",".nafo"))

#Q1c)
# R code
mack <- merge(mack.partial, mack.ices, by="Year")

#Q1d)
# R code
names(mack)[10:13] <- c("spawners.ices","recruits.ices","catch.ices","fishMortality.ices")

#Q1e) Graph
# R code
matplot(mack[,1], mack[,c(2,6,10)],
        type = 'l', lty = 2,
        xlab = "Years", ylab = "Spawner Biomass (thousands of tons)",
        main = "Atlantic mackerel", ylim=c(0,3500))
legend("topleft",lty = 2, col = 1:3,
       c("Black Sea","NAFO","ICES"), bty='n')

#Q2a)
# R code
date <- seq(from = as.Date("2010/1/1"),to = as.Date("2010/6/30"), by = "day")
month <- months(date)
month <- factor(month, levels = unique(month), ordered = TRUE)
New_Means <- c(40, 42, 51, 55, 58, 62)
meanVector <- rep(New_Means, table(month))
temperature <- as.integer(rnorm( n = length(meanVector),
                          mean = meanVector, sd = 5))

# Q2b)
# R code
observedMeans <- tapply(temperature, month, mean)
New_Means - observedMeans
observedMeans
New_Means

#Q2c)
# R code
any(duplicated(temperature)) 
which(duplicated(temperature)) 

# Q2d)
# R code
date2 <- seq(from = as.Date("2010/1/1"),
            to = as.Date("2010/7/31"), by = "2 days")
condition <- factor(sample(c("sunny", "cloudy", "partcloudy"),
                           size = length(date), replace = TRUE))
wind_speed <- rnorm(n = length(date), mean = 5, sd = 3)
wind_speed[wind_speed < 0] <- 0
observations <- data.frame(date, condition, wind_speed)

#Q2e)
# R code
temperature <- data.frame(date=date, temperature=temperature, month=month)
weather = merge(temperature, observations, by = "date") 
head(weather)

# Q2f)
# R code
tapply(weather$temperature, weather$condition, range)
table(weather$condition)