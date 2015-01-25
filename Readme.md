##  GETTING AND CLEANING DATA COURSE PROJECT
===================

January 25th, 2015. Prepared by P. L. Alcaraz

### Introduction

This repository holds the project of the course: Getting and Cleaning Data from Coursera. This course is part of the Data Science specialization

The repository has on script: run_analysis.R

This script needs the data found in [here] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Overview.

1. Download the data from the link and unzipped.
2. Copy the script run_analysis.R into the folder UCI HAR Dataset, created after unzipping the data.
3. Run script either from the console of from R.
4. A tidyData.txt is created as a result of running the script.


### Objectives and Assumptions

The objective is to describe the R script "run_analysis.R".

The script is commented and the objective of every line is explained. The different steps try to follow the indications given in the instructions of the course

The code assumes that any possible user is in possesion of the data. Thus, no automatic data downloading is performed by the code. 
This assumption allows us to have a simple code that performs the task of cleaning and summirizing the data asked by the exercise.


### Original Data

The data processed by run_analysis.R has been provided by UC Irvine Machine Learning Repository,
especifically from:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The link to download the original data can be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The script run_analysis.R assumes that the user has unzipped the code. After unzipping the code, a folder named "UCI HAR Dataset" is created.
The script need to be inside this folder in order to run properly.

Within the folder UCI HAR Dataset there are another two folders test and train. The code in the cript only needs the following data files:
* "./test/X_test.txt": Set of data of the test subjects
* "./test/y_test.txt": Activities associated with the observations in X_test
* "./test/subject_test.txt": Subject performing the activities in y_test
* "./train/X_train.txt":Data for the training set. 
* "./train/y_train.txt":Activities associated with the observations in X_train
* "./train/subject_train.txt":Subject performing the activities in y_train
* "features.txt"


### 1. STEP: LOAD DATA
Load into different data frames the files mentioned previouly.
* Data frame test_measures contains the data of the test set
* Data frame test_activities contains the activities associated with test_measures
* Data frame test_subject contains the subject associated with test_measures and test_activities
* Data frame train_measures   contains the data of the train set
* Data frame train_activities contains the activities associated with train_measures
* Data frame train_subject contains the subject associated with train_measures and train_activities
* Data frame featuresNames contains the column names of the data within test_measures and train_measures

### 2. STEP: MERGE DATA
* Use cbind to merge the data frame with the measurements with the data frames containing information of the activities and the subjects.
* Use rbind to join the train and test data frames.
* Label the columns of the join data set using the featuresNames and adding the labels "SUBJECT" and "ACTIVITIES" to the additional columns

### 3. STEP: DESCRIBE ACTIVITIES
* Transform the ACTIVITIES column into a factor and associate the levels: ("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")

### 4. STEP: CREATE THE TIDYDATA SET
* Use regular expresion over the join data set to subset only the features with mean and std in its name
* Use aggregate to calculate the mean for each subject and activity.
* Arrange the data set to order by subject, ascending.


