#GACD 
#Project 1
#Code should be run from directory containing 'UCI HAR Dataset' folder

#Part 1: Merge Trainging and Test data sets
#Create R objects form text files

curr_dir <- getwd()
setwd(paste(curr_dir, "/UCI HAR Dataset", sep =""))

xTest <- read.table("test/X_test.txt", sep="")
xTrain <- read.table("train/X_train.txt", sep="")
yTest <- read.table("test/y_test.txt", sep="")
yTrain <- read.table("train/y_train.txt", sep="")
subjTest <- read.table("test/subject_test.txt", sep="")
subjTrain <- read.table("train/subject_train.txt", sep="")
feat <- read.table("features.txt", sep="")
lab <- read.table("activity_labels.txt", sep="")

setwd(paste(curr_dir, sep =""))

#change col names for easier R code refs
names(yTest)[1] <- 'act_num'
names(yTrain)[1] <- 'act_num'
names(lab)[1] <- 'act_num'
names(lab)[2] <- 'act_desc'
names(feat)[1] <- 'feat_num'
names(feat)[2] <- 'feat_desc'
names(subjTest)[1] <- 'subj_num'
names(subjTrain)[1] <- 'subj_num'

#Merge test to test and train to train, then merge thopse together
dataTest<- cbind(subjTest, yTest, xTest)
dataTrain <- cbind(subjTrain, yTrain, xTrain)
dataComb <- rbind(dataTest, dataTrain)


#Part 2: Extract only meas on  mean and standard dev for each meas
# do anything else with this data set???
dataAvg <- apply(dataComb[3:563], 2, mean) 
dataStdev <- apply(dataComb[3:563], 2, sd) 
dataStats <- cbind(dataAvg, dataStdev) 

#Part 3: Descriptive Activity Names
# use merge instead??
dataComb$act_num[which(dataComb$act_num == 1)] <- 'Walking'
dataComb$act_num[which(dataComb$act_num == 2)] <- 'Walking Upstairs'
dataComb$act_num[which(dataComb$act_num == 3)] <- 'Walking Downstairs'
dataComb$act_num[which(dataComb$act_num == 4)] <- 'Sitting'
dataComb$act_num[which(dataComb$act_num == 5)] <- 'Standing'
dataComb$act_num[which(dataComb$act_num == 6)] <- 'Laying'

#Part 4: Label Data set with desc var names
#will need to loop... 

i <- 1  
j <- 3

while (j < 564) {
  newColName <- feat[i,2]  ##col2 = feat_desc
  names(dataComb)[j] <- paste(newColName)
  i = i + 1
  j = j + 1
}

rm(i)
rm(j)

#Part 5: Independent Tidy Data Set
#tried using ddply but don't understand enough

finData <- aggregate(dataComb[,3] ~ subj_num + act_num, data = dataComb, FUN = 'mean')

for (i in 4:ncol(dataComb)) {
  finData[,i] <- aggregate(dataComb[,i] ~ subj_num + act_num, data = dataComb, FUN = 'mean')[,3]
}

colnames(finData) <- colnames(dataComb)
names(finData)[1] <- 'Subject_Number'
names(finData)[2] <- 'Activity_Desc'

write.table(finData, 'tidydata.txt',  row.name = FALSE )
