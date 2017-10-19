#=====Lecture 7 r code
help.search("logarithm")
apropos("log")
help("log")
?log

#load data
speciesCode <- read.csv("data//speciesCode.csv")
speciesData <- read.csv("data//speciesData.csv")
tripData <- read.csv("data//tripData.csv")
tripData$Date

#====tripData examination
head(tripData, n=3)
tripData$Date <- as.Date(tripData$Date)
( min.date <- min(tripData$Date) )      #start date
( max.date <- max(tripData$Date) )      #end date 
( range.date <- range(tripData$Date) )  #min and max dates
difftime(max.date, min.date)
hist(tripData$Date, breaks="months", col="grey") #hist for day data, see ??hist.date

#===longest time difference in data
#order the tripData by the Date column
tripData <- tripData[order(tripData$Date),] 
diff(c(1,2,4,5,6))

#=======In-class exercise 1
max(diff(tripData$Date))
maxgap <- which.max(diff(tripData$Date))
#edit(which.max)
#which(diff(tripData$Date)==max(diff(tripData$Date)))

tripData[256:262,"Date"] #test to see if gap somewhere here
maxgap
tripData[(maxgap-2):(maxgap+3),"Date"] #find dates
tripData[(maxgap-2):(maxgap+3),]       #get whole data set

#===visualizing trip dates
plot(x=tripData$Date, y=tripData$TotalMinutes/60, 
     type="h", ylim=c(0,5), xaxs="i", yaxs="i",
     xlab="Trip date", ylab="Trip length (hr)")

#===species code data
head(speciesCode, n=4)
head(speciesData, n=4)

#===most frequently caught species
speciesCounts <- table(speciesData$SpeciesCode)
speciesCounts
sort(speciesCounts)
temp <- speciesCounts[which.max(speciesCounts)]
temp
names(temp)
maxCode <- as.numeric(names(temp))
maxCode
maxCode <- as.numeric(names(speciesCounts[which.max(speciesCounts)]))
maxCode
max.spp <- speciesCode[speciesCode$SpeciesCode==maxCode,]
max.spp

#=====bocaccio dataset
grep("a", c("a","b","a","c","a","d"))
bocaccioRows <- grep("Bocaccio",speciesCode$Common)
speciesCode[bocaccioRows,]

bocaccioCode <- speciesCode[bocaccioRows, "SpeciesCode"]
names(speciesData)
bocaccioData <- subset(speciesData, 
      speciesData$SpeciesCode==bocaccioCode)
head(bocaccioData)

#merge with the trip data 
bocTrip <- merge(bocaccioData, tripData[,-1],
                 by.x="TripNum", by.y="SimplifiedTripNum")
head(bocTrip, n=4)

#=======In-class exercise 2
#==Q1
SebastesRows <- grep("Sebastes",speciesCode$Scientific)
SebastesRows
SebastesCode <- speciesCode[SebastesRows,"SpeciesCode"]
SebastesCode
sort(unique(SebastesCode))
names(speciesData)
x <- speciesData[speciesData$SpeciesCode %in% SebastesCode, 
                 "SpeciesCode"]
sort(unique(x))  #check this is a subset
SebastesData <- speciesData[speciesData$SpeciesCode %in% 
                               SebastesCode,]
head(SebastesData)
#==Q2
#Table of fates of rockfish by species code
table(SebastesData$SpeciesCode, SebastesData$Fate)
#Fate is a factor, convert to text to get rid of blank factor
table(SebastesData$SpeciesCode, as.character(SebastesData$Fate))

#==Q3
names(SebastesData)
#needs na.rm=T because of the NAs
tapply(SebastesData$Length, SebastesData$SpeciesCode, min)
tapply(SebastesData$Length, SebastesData$SpeciesCode, 
       min, na.rm=T)
tapply(SebastesData$Length, SebastesData$SpeciesCode, max, 
       na.rm=T)

#==Q4 advanced
#Table of fates of rockfish by common name
RockfishData <- merge(SebastesData, speciesCode,
                 by.x="SpeciesCode", by.y="SpeciesCode")
head(RockfishData)
nrow(RockfishData)  #check that the same number of rows still there!
nrow(SebastesData)  #check that the same number of rows still there!
#Common is a factor, retains all levels, must be converted to character to
#get it to only return the Sebastes values
table(as.character(RockfishData$Common), 
      as.character(RockfishData$Fate))
