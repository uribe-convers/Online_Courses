rankhospital <- function(state, outcome, num = "best") {
        data<-read.csv("outcome-of-care-measures.csv", header = TRUE, stringsAsFactor=FALSE, na.string="Not Available") #reads in data, keeps columns as numeric, and transforms "Not Available" to NAs
        
               
        #Check to see if state is in the data
        if(state %in% data$State){
                #print("Valid State")
        }else if(!state %in% data$State){
                stop("invalid state")
        }
        
        #Check to see if outcome is in the data
        
        sickness<-c("heart attack","heart failure", "pneumonia")
        if(outcome %in% sickness){
                #print("Valid Outcome")
        }else if(!outcome %in% sickness){
                stop("invalid outcome")
        }
        
        #Set sickness based on outcome
        if(outcome=="heart attack") {
                sick<-data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
        }else if(outcome=="heart failure"){
                sick<-data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
        }else if(outcome=="pneumonia"){
                sick<-data$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
        }
        
        data_ordered_by_sick<-(data[order(sick, data$Hospital.Name, na.last = NA),]) #order data by outcome, na.last=NA gets rid off the 'NA' so that they are not in the last place and 'worst' works
        l<-data_ordered_by_sick$State==state #Creates a logical vector where TRUE is only for the state chosen
        data_by_state<-data_ordered_by_sick[l,] #substes ordered data by state using the logical vector
        
        #Set 'num', aka the specified ranking for a hospital
        if(num=="best"){
                num<-1
        }else if(num=="worst"){
                num<-nrow(data_by_state)
        }
        
        data_by_state$Hospital.Name[num] #Shows results
        
}

## Return hospital name in that state with the given rank
