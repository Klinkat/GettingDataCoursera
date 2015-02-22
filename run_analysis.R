
#==========================================================
#        SCRIPT TO MERGE, SUBSET AND SUMMARIZE DATA 

#    Human Activity Recognition Using Smartphones Dataset
#==========================================================
        
library(dplyr)

## ======= TEST SET ================
## load data
subject <- read.table("test/subject_test.txt")  # factor label subjects
activity <- read.table("test/y_test.txt")       # factor label activity
features <- read.table("test/X_test.txt")       # feature vector data frame

## retrieve and add colnames to feature vector df
names <- read.table("features.txt", header=FALSE, sep =" ")
namesVector <- as.vector(names$V2)
namesVector <- sub("\\()","",namesVector)       # removes "()" 
colnames(features)<- namesVector

# change activity levels to discriptive names
activity <- as.factor(activity[,1])
levels(activity)<- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", 
                     "SITTING", "STANDING", "LAYING")

# add subject and activity factors as columns to feature vetor df
colnames(subject)<-"subject"
testSet <- cbind(subject,activity,features)

## ======= TRAINING SET ================
## load data
subject2 <- read.table("train/subject_train.txt") # factor label subjects
activity2 <- read.table("train/y_train.txt")    # factor label activity
features2 <- read.table("train/X_train.txt")    # feature vector data frame

# change activity levels to discriptive names
activity2 <- as.factor(activity2[,1])
levels(activity2)<- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", 
                      "SITTING", "STANDING", "LAYING")

# add subject and activity factors as columns to feature vetor df
trainSet <- cbind(subject2,activity2,features2)

## ========= TIDY MERGED SET ============
# merge test and train set row-wise
colnames(trainSet)<-colnames(testSet)
set <- rbind(testSet,trainSet)

set <- set[,]   
# Note to the reviewer ;o)
# If I dont do this, plyr select() complains: "Error: found duplicated column name"
# I know it is not very professional, it does not even make sense to me,
# since I suspect that plyr has problems with symbols in the colnames.
# But hey, it works and it is a very easy fix!

# subset variables with "mean" and "std" in colname
setMeanStd <- select(set,activity,subject,contains("mean"),contains("std"))

# group and summarize data by factor levels of $subject and $activity
# calculate a mean for each group
setGroup <-group_by(setMeanStd,subject, activity)
setTable <- summarise_each(setGroup,funs(mean))

# save and view summary table
write.table(setTable, "ActivityRecognition.txt",row.name=FALSE)
ActRec <- read.table("ActivityRecognition.txt", header = TRUE)
View(ActRec)