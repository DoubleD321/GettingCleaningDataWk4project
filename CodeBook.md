## 1 Merges the training and the test sets to create one data set.

## fullCombo : combines the combined x y and subject data into one data set


## 2 Extracts only the measurements on the mean and standard deviation for each 
## measurement. 

## colNamesFC : a list of column names from the fullCombo data set
## meanStd : a logical formula returning TRUE FALSE if "mean" or "std" are part
## of column name
## meanStdData : creates a subset containing mean and standard deviation columns
## by applying the meanStd logical formula where TRUE

## 3 Uses descriptive activity names to name the activities in the
## data set
## 4 Appropriately labels the data set with descriptive variable names.
## set 
## (Note: column names updated in the individual datasets before
## before combining into one dataset)

## variableName : sets the variable names from the "features.txt" file
## activityLabels : sets the six activity labs using the "activity_labels.txt" file

## Create names to the Train Data
## colnames(xTrainData) : applies variable names to columns
## colnames(yTrainData) : applies the name "activityId" to the column
## colnames(trainSubjectData) : applies the name "subjectId" to the column

## Column names to the test data
## colnames(xTestData) : applies variable naems to the columns
## colnames(yTestData) : applies the name "activityId" to the column
## colnames(testSubjectData) : applies the name "subjectId" to the column

## column names in the activitylabels data
## colnames(activityLabels): applies the names "activityId", "activity" to columns


## 5 From the data set in step 4, I created a second, independent tidy data set 
## with the average of each variable for each activity and each subject. This 
## file is called tidy.txt

## tidyData : tidy data set with the average (mean) of each variable for each 
## activity and subject


