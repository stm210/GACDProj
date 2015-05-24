---
title: "CodeBook"
output: html_document
---

This file describes
1. Variables
2. Data
3. Transformations
in the process to create the tidy data set.


1. Variables

Subject_Number
-identifies the individual who generated the data
-takes values 1 through 30, as there were 30 participants, age

Activity_Desc
-identifies which activity the data relates to, ie what action was being monitored
-6 distinct activities were monitored: WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING

Measures
-561 additional columns are time and frequency domain variables


2. Data

Data is pulled from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
Tables used in this analysis include:
UCI HAR Dataset/activity_labels.txt
UCI HAR Dataset/features.txt
UCI HAR Dataset/test/subject_test.txt
UCI HAR Dataset/test/X_test.txt
UCI HAR Dataset/test/y_test.txt
UCI HAR Dataset/train/subject_train.txt
UCI HAR Dataset/train/X_test.txt
UCI HAR Dataset/train/y_test.txt


3.Transformations

Test data is concatenated with test data.
Training data is concatenated with training data.
New aggregated test and new aggregated training data is then aggregated.
Activity descriptions are assigned based on the activity number, 
subjects remain anonymous and IDed by subject number.

For the 561 types of measurements,
mean is taken for each Subject and Activity combination.

This data is written to tidydata.txt in the currect working directory.
