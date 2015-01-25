
## Getting & Cleaning Data Course Project
## Script to load the data that has previously been download from the url:
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## This script assumes that the file has been unzipped and that the script user will run it from the folder:UCI HAR Dataset


## Load dplyr libraries 
library(dplyr)

## 1. Load the relevant data from the files:
##  1.1 Load the test set
test_measures   = read.table("./test/X_test.txt")
test_activities = read.table("./test/y_test.txt")
test_subject    = read.table("./test/subject_test.txt") 
##  1.1 Load the train set
train_measures   = read.table("./train/X_train.txt")
train_activities = read.table("./train/y_train.txt")
train_subject    = read.table("./train/subject_train.txt") 
##  1.2 Load the list of features Names
featuresNames = read.table("features.txt")

## 2. Create a single data frame
##  2,1 Join Activities and Subject columns with theis respective measures
test_measures<-cbind(test_subject,test_activities,test_measures)
train_measures<-cbind(train_subject,train_activities,train_measures)
##  2.2 Join the two sets using row bind
singleData<-rbind(test_measures,train_measures)
##  2.3 Create a feature names char vector and assign it to the columns in singleData
cfeatureNames<-c("SUBJECT", "ACTIVITIES",as.character(featuresNames$V2))
##  2.4 Name the singleData data frame using the cfeaturesNames
names(singleData)<-cfeatureNames

## 3. Uses descriptive activity names to name the activities in the data set
##  3.1 Convert Activities column into a factor and assign levels
singleData$ACTIVITIES <- factor(singleData$ACTIVITIES)
levels(singleData$ACTIVITIES)<-c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")

## 4. Creation of the tidy data set
##  4.1 Extracts only the measurements on the mean and standard deviation for each measurement. We use a regular expression function
## grep and we 
meanStdData<-singleData[,c(1,2,grep("mean|std",names(singleData)))]
##  4.1 Arrange the meanStdData by SUBJECT
meanStdData<-arrange(meanStdData,SUBJECT)
##  4.3 Calculate the average of each variable for each activity and each subject
tidyData <-aggregate(meanStdData[,-(1:2)], by = meanStdData[c("SUBJECT","ACTIVITIES")],FUN=mean, na.rm=TRUE)
tidyData<-arrange(tidyData,SUBJECT)
write.table(tidyData,file = "tidyData.txt",row.name=FALSE )