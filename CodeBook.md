## Project Wk4: The data linked to from the course website represent data 
## collected from the accelerometers from the Samsung Galaxy S smartphone. 
## A full description is available at the site where the data was obtained:
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
## Here are the data for the project:
##  
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
##
## I have created one R script called wk4Project.R that does the following.
## 
## 1 Merges the training and the test sets to create one data set.
## 2 Extracts only the measurements on the mean and standard deviation for each 
## measurement. 
## 3 Uses descriptive activity names to name the activities in the
## data set 
## 4 Appropriately labels the data set with descriptive variable names.
## 5 From the data set in step 4, I created a second, independent tidy data set 
## with the average of each variable for each activity and each subject. This 
## file is called tidy.txt

## My R file shows how I downloaded and named the data file and noted the 
## download date.

## I Unziped dataset to directory called data where I used list.files() verify
## the unzipped files in the directory. Top level folder is UCI HAR Dataset
## I then defined the path for the data and creating a list of files which shows
## 28 dataFiles

## Then I read the data into R to start the actual project analysis
## starting with training read table -- data path, folder, file
## next reading the test data 
## then read in the variable and activity description data

## The Data read into R were:

## training Subject Data - "subject_train.txt"
## x Training Data "X_train.txt"
## y Train Data "y_train.txt"
## test Subject Data "subject_test.txt"
## x Test Data "X_test.txt"
## Y Test Data "y_test.txt"
## variable Name "features.txt"
## activity Labels "activity_labels.txt"

## Initial I combined the data without change the column names, however, it was
## hard to determine the correct columns so changing column names first and then
## combined the data. First the Test, then Training, and subject. Finally, 
## I combined all in one dataset

## I looked at the data str(xCombo), str(yCombo), str(subjectCombo), 
## str(fullCombo), head(xCombo),head(yCombo),head(subjectCombo),
## tail(fullCombo)shows that Subject Id and Activity ID were added as columns
## View(fullCombo) list lets you see all the column names, last two subjectId 
## and activityId

## For reference, I created a subset or list of column names to help with next 
## question


## Next created Code to extract only the measurements on the mean and standard 
## deviation for each measurement. 

## first subset the mean and standard deviation. Note that I was getting an 
## error message "Error in fix.by(by.x, x) : 'by' must specify a uniquely valid
## column" so I made sure all subsets are set as data frames.

## The initial code is a logical class but now set as data frame apply to the 
## which is applied to the fullCombo data and to complete used activity names 

## The reviewed the results str(meanStdActNames), View(meanStdActNames)

## I then created a New tidy set and checked to see if this is what you expected
## str(tidyData), View(tidyData)

## looked good, so i wrote it to a file
## write.table(tidyData, file = "Tidy.txt", row.names = FALSE)

