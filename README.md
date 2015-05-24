---
title: "README"
output: html_document
---

This READ ME relates to "run_analysis.R"
Script requires that is in the same directory as the 'UCI HAR Dataset' folder
from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


Script is organized into 5 parts:

1: Import necessarry files into R objects
- uses read.table() to create 8 R objects from .txt files
- uses names() to rename several columns for easier reference / understanding
- cbind() and rbind() are used to concatenate test with test and trainging then trainign, then rbind() those data sets together


2: Extract only the measurement for mean and standard dev for each measurement
- use apply() with 'mean' and 'sd' to calc the average and standard deviation values
- not used elsewhere


3: Uses descriptive activity names to rename the activities in the data set
- uses which()
- based on the activity number, changes the activity value to be the "texty" description corresponding to the number from the activity_labels.txt file


4: Labels the data set with descriptive variable names
- uses while {}
- using names from features.txt, loops through the columns and assigns the measurement name to the column in the newly created data set


5: From data set in step 4, creates independent tidy data set with the average of each variable for each activity and subject combination
- uses aggregate() and a for loop to calc the average value for each column, for each subject and activity combination
- uses write.table() to print to tidydata.txt



