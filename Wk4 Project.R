## Project Wk4: The data linked to from the course website represent data 
## collected from the accelerometers from the Samsung Galaxy S smartphone. 
## A full description is available at the site where the data was obtained:
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
## Here are the data for the project:
##  
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
##
## You should create one R script called run_analysis.R that does the following.
## 
## 1 Merges the training and the test sets to create one data set.
## 2 Extracts only the measurements on the mean and standard deviation for each 
## measurement. 
## 3 Uses descriptive activity names to name the activities in the
## data set 
## 4 Appropriately labels the data set with descriptive variable names.
## 5 From the data set in step 4, creates a second, independent tidy data set with
## the average of each variable for each activity and each subject.

setwd("~/R learning/NewProject/Datasciencecoursera_/datacleanup/projectwk4")
library(dplyr)
library(readr)

fileURL<- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

dir.create("~/R learning/NewProject/Datasciencecoursera_/datacleanup/projectwk4/data") ## creates the directory

filePath = "~/R learning/NewProject/Datasciencecoursera_/datacleanup/projectwk4"

## download and name the file. Note for MACs you need to define method as "curl" 
## for https urls
download.file(fileURL,destfile =  "~/R learning/NewProject/Datasciencecoursera_/datacleanup/projectwk4/Dataset.zip", method = "curl")
list.files(filePath)

## important to know the date you downloaded as the data can change 
wk4dataset <- date()
wk4dataset


## Unzip dataset to data directory
unzip("~/R learning/NewProject/Datasciencecoursera_/datacleanup/projectwk4/Dataset.zip",exdir = "~/R learning/NewProject/Datasciencecoursera_/datacleanup/projectwk4/data")

## to see if file unzipped in directory list files

list.files("~/R learning/NewProject/Datasciencecoursera_/datacleanup/projectwk4/data")

## should see the UCI HAR Dataset
## now define the path for the data and creating a list of files

pathData = file.path("~/R learning/NewProject/Datasciencecoursera_/datacleanup/projectwk4/data", "UCI HAR Dataset")
#create a file which has the 28 file names
dataFiles = list.files(pathData, recursive=TRUE)
#show the files, should see 28
dataFiles


## now we need to read the data into R to start the actual project analysis
## starting with training read table -- data path, folder, file
trainSubjectData<- read.table(file.path(pathData, "train", "subject_train.txt"))
xTrainData<- read.table(file.path(pathData,"train", "X_train.txt"))
yTrainData<- read.table(file.path(pathData,"train", "y_train.txt"))
## you can View() data to see if it looks like what you expect

## now reading the test data 
testSubjectData<- read.table(file.path(pathData, "test", "subject_test.txt"))
xTestData<- read.table(file.path(pathData,"test", "X_test.txt"))
yTestData<- read.table(file.path(pathData,"test", "y_test.txt"))
## you can View() data to see if it looks like what you expect

## now read the variable and activity description data
variableName<- read.table(file.path(pathData,"features.txt"))
activityLabels<- read.table(file.path(pathData,"activity_labels.txt"))

## looked at the Combo data below and hard to determine the correct columns
## so changing column names first and then combining

## Create names to the Train Data
colnames(xTrainData) = variableName[,2]
colnames(yTrainData) = "activityId"
colnames(trainSubjectData) = "subjectId"

## Column names to the test data
colnames(xTestData) = variableName[,2]
colnames(yTestData) = "activityId"
colnames(testSubjectData) = "subjectId"

## column names in the activitylabels data

colnames(activityLabels)<- c("activityId", "activity")

## merge the testing, training data, subject data respectively
xCombo<- rbind(xTrainData,xTestData)
yCombo<- rbind(yTrainData,yTestData)
subjectCombo <- rbind(trainSubjectData, testSubjectData)

## Combine all data into one dataset
fullCombo<- cbind(xCombo,subjectCombo,yCombo)

## look at the data
str(xCombo)
str(yCombo)
str(subjectCombo)
str(fullCombo)
head(xCombo)
head(yCombo)
head(subjectCombo)
tail(fullCombo)  ## shows that Subject Id and Activity ID were added as columns
View(fullCombo)  ## list lets you see all the column names, last two subjectId and activityId

## to get a subset or list of column names to help with next question
colNamesFC = colnames(fullCombo)
View(colNamesFC)


## Code to extract only the measurements on the mean and standard deviation for 
## each measurement. 

## first subset the mean and standard deviation. Note that I was getting an 
## error message "Error in fix.by(by.x, x) : 'by' must specify a uniquely valid
## column" so I made sure all subsets are set as data frames

meanStd = as.data.frame(grepl("activityId" , colNamesFC) | grepl("subjectId" , 
                                                         colNamesFC) 
                | grepl("mean.." , colNamesFC) | grepl("std.." , colNamesFC))

## this is typically a logical class but now set as data frame apply to the 
## fullCombo data

meanStdData <- as.data.frame(fullCombo[ , meanStd == TRUE])

## to complete using activity names 

meanStdActNames = merge.data.frame(x=meanStdData, y=activityLabels,by ="activityId", all.x= TRUE)


## look to see what the results are
str(meanStdActNames)
View(meanStdActNames)

library(tidyr)

## Create a New tidy set 
meanStdData$subjectId <- as.factor(meanStdData$subjectId)
tidyData <- aggregate(. ~subjectId + activityId, meanStdData, mean)
tidyData <- tidyData[order(tidyData$subjectId,tidyData$activityId),]

## check to see if this is what you expected
str(tidyData)
View(tidyData)

## looks good, write to file
write.table(tidyData, file = "Tidy.txt", row.names = FALSE)

