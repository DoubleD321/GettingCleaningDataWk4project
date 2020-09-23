## 1 Merges the training and the test sets to create one data set.

  Data element    :     Source 
trainSubjectData  :  "subject_train.txt"
xTrainData        :  "X_train.txt"
yTrainData        :  "y_train.txt
testSubjectData   :  "subject_test.txt"
xTestData         :  "X_test.txt"
yTestData         :  "y_test.txt"
variableName      :  "features.txt
activityLabels    :  "activity_labels.txt"

## merge the testing, training data, subject data respectively
xCombo  :   Combines x training data (xTrainData) and x test data (xTestData)
yCombo  :   Combines y training data (yTrainData) and y test data (yTestData)
subjectCombo  : Combines the Training subject data (trainSubjectData) and 
                the Test subject data (testSubjectData)

## Combine all data into one dataset
fullCombo : puts all train, test, and subject data together (xCombo,subjectCombo
            ,yCombo)



## 2 Extracts only the measurements on the mean and standard deviation for each 
## measurement. 

colNamesFC  : a list of column names from the fullCombo data set
meanStd     : a logical formula returning TRUE FALSE if "mean" or "std" are part
              of column name
meanStdData : creates a subset containing mean and standard deviation columns
              by applying the meanStd logical formula where TRUE

## 3 Uses descriptive activity names to name the activities in the
## data set
## 4 Appropriately labels the data set with descriptive variable names.
## set 

variableName    : sets the variable names from the "features.txt" file
activityLabels  : sets the six activity labels using the "activity_labels.txt" 
                  file

## Create names to the Train Data
colnames(xTrainData) : applies variable names to columns
colnames(yTrainData) : applies the name "activityId" to the column
colnames(trainSubjectData) : applies the name "subjectId" to the column

## Column names to the test data
colnames(xTestData) : applies variable naems to the columns
colnames(yTestData) : applies the name "activityId" to the column
colnames(testSubjectData) : applies the name "subjectId" to the column

## column names in the activitylabels data
colnames(activityLabels): applies the names "activityId", "activity" to columns

## More descriptive column names
Original  :  Replacement
'Acc'     : "Acceleration"
'GyroJerk': "AngularAcceleration"
'Gyro'    : "AngularSpeed"
'Mag'     : "Magnitude"
'^t'      : "TimeDomain."
'^f'      : "FrequencyDomain."
'\\.mean' : ".Mean"
'\\.std'  : ".StandardDeviation"
'Freq\\.' : "Frequency."
'Freq$'   : "Frequency"

## 5 From the data set in step 4, I created a second, independent tidy data set 
## with the average of each variable for each activity and each subject. This 
## file is called tidy.txt

tidyData  : Groups meanStdActNames dataset by activity, activityId, subjectId
            calculates the average (aka mean) for each measure
