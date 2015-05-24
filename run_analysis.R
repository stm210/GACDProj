#GACD 
#Project 1
#Code should be run from directory containing 'UCI HAR Dataset' folder

#Part 1: Merge Trainging and Test data sets
#Test
x_test <- read.table("UCI HAR Dataset/test/X_test.txt",sep="")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt",sep="")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt",sep="")

#Train
x_train <- read.table("UCI HAR Dataset/train/X_train.txt",sep="")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt",sep="")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt",sep="")
