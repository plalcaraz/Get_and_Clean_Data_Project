##  Code Book: Simplified and summarized version of the Human Activity Recognition Using Smartphones Data Set 
===================

January 25th, 2015. Prepared by P. L. Alcaraz

### Objectives

This Code Book is part of the Project for the Coursera R-programming course: Getting and Cleaning Data.
The objective is to describe the data and the transformations carried out to create the tidyData set.

The Readme.md file explains the details of the code.

## Original Data:

All the data used to generate the tidyData set comes from the data in :


https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


The web of the project is:


http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


## Data

* The first column: SUBJECT, values 1-30, type numeric. Represents the subject of the experiment. (No units)
* The second  column: ACTIVITIES, values 1-6, type factor. Represent the kind of activity that the subject was performing:("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING") (No units)
* Column 3-81: The following explanation is given by the original authors about the features shown in the data:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
These signals were used to estimate variables of the feature vector for each pattern:  '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The features that has been analiyzed are:

* tBodyAcc-XYZ  
* tGravityAcc-XYZ 
* tBodyAccJerk-XYZ 
* tBodyGyro-XYZ 
* tBodyGyroJerk-XYZ 
* tBodyAccMag 
* tGravityAccMag 
* tBodyAccJerkMag 
* tBodyGyroMag 
* tBodyGyroJerkMag 
* fBodyAcc-XYZ 
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

From the original set of features, 561, we have just taken the variables: mean() and std(). Following the explanation of the authors the variables begining with t are in the time domain and those beginning with f are in
the frequency domain, so the units for each are probable "s" and "Hz".

To generate our tidyData set we have calculate for each subject and activity the mean of the selected features.
