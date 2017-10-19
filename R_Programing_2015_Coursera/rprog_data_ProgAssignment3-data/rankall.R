rankall <- function(outcome, num = "best") {
        data<-read.csv("outcome-of-care-measures.csv", header = TRUE, stringsAsFactor=FALSE, na.string="Not Available") #reads in data, keeps columns as numeric, and transforms "Not Available" to NAs
        
        #Check to see if state is in the data
        #if(state %in% data$State){
                #print("Valid State")
        #}else if(!state %in% data$State){
        #        stop("invalid state")
        #}
        
        #Check to see if outcome is in the data
        
        sickness<-c("heart attack","heart failure", "pneumonia")
        if(outcome %in% sickness){
                #print("Valid Outcome")
        }else if(!outcome %in% sickness){
                stop("invalid outcome")
        }
        
        #Set sickness based on outcome
        if(outcome=="heart attack") {
                sick<-data.frame(hospital=data$Hospital.Name, state=data$State, Mortality=data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
                #sick<-data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
        }else if(outcome=="heart failure"){
                sick<-data.frame(hospital=data$Hospital.Name, state=data$State, Mortality=data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
                #sick<-data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
        }else if(outcome=="pneumonia"){
                sick<-data.frame(hospital=data$Hospital.Name, state=data$State, Mortality=data$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
                #sick<-data$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
        }
        
        d<-order(sick$Mortality, sick$hospital, na.last = NA) #order data by outcome, na.last=NA gets rid off the 'NA' so that they are not in the last place and 'worst' works
        dd<-sick[d,] #subsets using the ordered/index vector 'd'
        s<-as.factor(dd$state) #creates a vector with the states as vectors to splt data by state
        w<-split(dd,s) #splits data by state. Now you have 54 lists, one for each state
        
        lapply(w,head) #shows the first values of each state
        b<-lapply(w, function(x) head(x, n=1))  #shows the first value of each state, which can be used to subset for the 'best' hospital
        ss<-lapply(w, function (x) num<-nrow(x)) #getting how many rows are in each of the 54 lists to use latter to subset the 'worst' hospital
        
        
        ## Matt: this is where I need your help! 
        
        #I was able to order the data by mortality and by state using lapply. So now I have 54 lists (by state) with ordered data
        #What I can't do is to extract the nth hospital for each state and put all those data into a data frame with two columns (hospital and state)
                   
                
        #### for my previous assignment I used this if statement to set the 'best' and 'worst' place in my list, but it was only one list!
        
        #Set 'num', aka the specified ranking for a hospital
        
        if(num=="best"){
                num<-1
        }else if(num=="worst"){
                #num<-nrow(w) #Original way when it was just one list
                num<-lapply(w, function (x) nrow(x)) #trying to do the same with lapply, it works on the console but not here...
        }       
                
        
        #Need to show the n ranked hospital for every state, where n==num. 
        #Must be able to understand 'best' and 'worst', which I think I figured 
        #out in the if statement above.
        
        ## RESULTS need to be a data frame with two columns (hospital and state)
        ## where the nth hospital for each state, based on ranking within state, are shown.
        
        result<-data.frame(hospital='the nth hospital determined by the variable num', state='the corresponding state for the hospital')
        
        
        
        ## For each state, find the hospital of the given rank
        ## Return a data frame with the hospital names and the
        ## (abbreviated) state name
}