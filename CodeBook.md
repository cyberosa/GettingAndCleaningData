VARIABLES
subjectID: an integer defining the subject who performed the activity for each window sample. Its range is from 1 to 30. 

activity: a string describing the type of activity performed by the subject. There are only 6 types of activities: 1 WALKING
            2 WALKING_UPSTAIRS
            3 WALKING_DOWNSTAIRS
            4 SITTING
            5 STANDING
            6 LAYING

79 different features related with mean or standard deviation measures:
 tBodyAcc-mean()-X
 tBodyAcc-mean()-Y
 tBodyAcc-mean()-Z
 tBodyAcc-std()-X
 tBodyAcc-std()-Y
 tBodyAcc-std()-Z
 tGravityAcc-mean()-X
 tGravityAcc-mean()-Y
 tGravityAcc-mean()-Z
 tGravityAcc-std()-X
 tGravityAcc-std()-Y
 tGravityAcc-std()-Z
 tBodyAccJerk-mean()-X
 tBodyAccJerk-mean()-Y
 tBodyAccJerk-mean()-Z
 tBodyAccJerk-std()-X
 tBodyAccJerk-std()-Y
 tBodyAccJerk-std()-Z
 tBodyGyro-mean()-X
 tBodyGyro-mean()-Y
 tBodyGyro-mean()-Z
 tBodyGyro-std()-X
 tBodyGyro-std()-Y
 tBodyGyro-std()-Z
 tBodyGyroJerk-mean()-X
 tBodyGyroJerk-mean()-Y
 tBodyGyroJerk-mean()-Z
 tBodyGyroJerk-std()-X
 tBodyGyroJerk-std()-Y
 tBodyGyroJerk-std()-Z
 tBodyAccMag-mean()
 tBodyAccMag-std()
 tGravityAccMag-mean()
 tGravityAccMag-std()
 tBodyAccJerkMag-mean()
 tBodyAccJerkMag-std()
 tBodyGyroMag-mean()
 tBodyGyroMag-std()
 tBodyGyroJerkMag-mean()
 tBodyGyroJerkMag-std()
 fBodyAcc-mean()-X
 fBodyAcc-mean()-Y
 fBodyAcc-mean()-Z
 fBodyAcc-std()-X
 fBodyAcc-std()-Y
 fBodyAcc-std()-Z
 fBodyAccJerk-mean()-X
 fBodyAccJerk-mean()-Y
 fBodyAccJerk-mean()-Z
 fBodyAccJerk-std()-X
 fBodyAccJerk-std()-Y
 fBodyAccJerk-std()-Z
 fBodyAccJerk-meanFreq()-X
 fBodyAccJerk-meanFreq()-Y
 fBodyAccJerk-meanFreq()-Z
 fBodyGyro-mean()-X
 fBodyGyro-mean()-Y
 fBodyGyro-mean()-Z
 fBodyGyro-std()-X
 fBodyGyro-std()-Y
 fBodyGyro-std()-Z
 fBodyGyro-meanFreq()-X
 fBodyGyro-meanFreq()-Y
 fBodyGyro-meanFreq()-Z
 fBodyAccMag-mean()
 fBodyAccMag-std()
 fBodyAccMag-meanFreq()
 fBodyBodyAccJerkMag-mean()
 fBodyBodyAccJerkMag-std()
 fBodyBodyAccJerkMag-meanFreq()
 fBodyBodyGyroMag-mean()
 fBodyBodyGyroMag-std()
 fBodyBodyGyroMag-meanFreq()
 fBodyBodyGyroJerkMag-mean()
 fBodyBodyGyroJerkMag-std()
 fBodyBodyGyroJerkMag-meanFreq()

DATA
The values were extracted from these different text files:
 -- "subject_train.txt" and "subject_test.txt" for the subjects.
 -- "y_train.txt", "y_test.txt" and "activity_labels.txt" for the activities.
 -- "X_train.txt" and "X_test.txt" for the measured features.

TRANSFORMATIONS
1. For each of the above variables the data from the train and test sets were merged in a unique data set. Resulting in three different data sets: "subjects", "activities" and "classifiedSets".
2. The total number of observations is 10299, which we take as a reference to check the number of rows in all variables.
3. The data frame containing the activity labels is named as "activityLabels" and contains only 6 rows. 
3. The names of the columns are renamed to give a more descriptive meaning:
  -- "subjectID"" is used to name the integer describing the subject.
  -- "activityID"" or "activityDescription are used in intermediate data frames, but in the final data frame 
     the name "activity.
4. The data frame containing the activities, "activities", is modified to include the description of the activities, by using the information of the "activityLabels" data frame.
5. The data set containing all the features, "classifiedSets" is filtered to contain only measures of mean or standard deviations.
6. The data set containing all the features, "classifiedSets", is transformed to have all data as numbers instead of characters.
7. The three data frames: "subjects", "activities" and "classifiedData" are combined in a final data frame called "finalData"  
8. A new tidy data frame is generated "meanData" with the mean of each variable/featured for each activity and subject.