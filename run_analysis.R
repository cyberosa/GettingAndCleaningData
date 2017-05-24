# Merge the training and test data sets into one, always in the same order
# first the train data and second the test data

# function to read the description of an activity given its ID
getActivityDescription <- function(labels,id){
    return(labels[id,"activityDescription"])
}

run_analysis <- function(){
    library(plyr)
    library(dplyr)
    library(stringr)
    library(tidyr)
    # ***************************** STEP 1 ********************************
    # read  the subjects
    subjectTrain <- read.table("./train/subject_train.txt",sep = "\t")
    subjectTest <- read.table("./test/subject_test.txt",sep = "\t")
    subjects <- rbind(subjectTrain,subjectTest)
    subjects <- rename(subjects,c(V1 = "subjectID"))
    
    # data sets
    setTraining <- read.table("./train/X_train.txt",sep="\t",strip.white=TRUE)
    setTest <- read.table("./test/X_test.txt",sep="\t",strip.white=TRUE)
    sets <- rbind(setTraining,setTest)
    # Remove factors
    charSets <- data.frame(lapply(sets, as.character), stringsAsFactors=FALSE)
    # Remove extra white spaces
    charSets <- data.frame(sapply(charSets,function(x){gsub("\\s+", " ",x)}))
    # Create the different columns for each feature/variable
    classifiedSets <- separate(charSets,V1,into = paste("V", 1:561), sep = " ", extra = "merge")
    
    # ***************************** STEP 3 AND 4 ********************************
    # read the activities table for test and train and merge them
    labelsTest <- read.table("./test/y_test.txt",sep="\t")
    labelsTrain <- read.table("./train/y_train.txt",sep="\t")
    activities <- rbind(labelsTrain,labelsTest)
    activities <- rename(activities,c(V1 = "activityID"))
    # read the activity labels
    activityLabels <- read.table("./activity_labels.txt",sep="\t",stringsAsFactors=FALSE)
    # let's separate the id of the description
    list <- strsplit(activityLabels$V1," ")
    activityLabels <- ldply(list)
    # give appropriate column names
    colnames(activityLabels) <- c("activityID","activityDescription")
    # transform the id chars into numbers
    activityLabels$activityID <- parse_number(activityLabels$activityID)
    # Add the activity description to the activities data frame based 
    # in the information from the activityLabels data frame
    activities <- mutate(activities, description=getActivityDescription(activityLabels,activities$activityID))
    
    # ***************************** STEP 2 AND 4 ********************************
    # feature names, length = 561
    columnNames <- read.table("./features.txt",sep="\t",stringsAsFactors=FALSE)
    # remove the initial numbers
    columnNames <- data.frame(sapply(columnNames,function(x){gsub("^([0-9])* ","",x)}))
    
    # name with a descriptive name (from columnNames data frame) each column of the classifiedSets
    classifiedSets <- setNames(classifiedSets,columnNames[,1])
    
    # select only the columns witn mean and standard deviation information
    classifiedSets <- classifiedSets[(grep(("mean|std"),colnames(classifiedSets)))]

    # parse the float numbers
    classifiedSets <- data.frame(lapply(classifiedSets, as.numeric))
    
    # add to the final data set the column with the subjects and the column with the activities
    finalData <- cbind(cbind(subjects,activities$description),classifiedSets)
    colnames(finalData)[2] <- "activity"
    
    # ***************************** STEP 5 ********************************
    groupedData <- group_by(finalData, activity,subjectID)
    meanData <- summarize_each(groupedData,funs(mean))
    write.table(meanData,file="./MeanData.txt",row.names = FALSE)
}

