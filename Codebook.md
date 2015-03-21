#Code Book

Getting and cleaning data aims on creating a tidy data set to downstream analysis.

## The original data set

The obtained dataset has been randomly partitioned into two sets. 70% of the volunteers was selected for generating the training data and 30% the test data. 

The dataset includes the following files:
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

## Getting and cleaning the data

These are the steps to collect, work with, and clean the original data set creating a tidy data set:
  
### Working with the training set
  
####Merging the test and training sets
  
There are two files with measurement data, X_train.txt and X_test.txt.
The first one has a data set with 7352 observations and the second has a data set with 2947 observations. Both sets have 561 variables.
This files are read and then the method rbind is called to join vertically the two data sets, creating a set with 10299 observations of 561 variables.
At this point, the data frame's variable names aren't friendly:

```text
'data.frame':  10299 obs. of  561 variables:
 $ V1  : num  0.289 0.278 0.28 0.279 0.277 ...
 $ V2  : num  -0.0203 -0.0164 -0.0195 -0.0262 -0.0166 ...
 $ V3  : num  -0.133 -0.124 -0.113 -0.123 -0.115 ...
  [list output truncated]
```
  
####Setting meaninful names  

The features_info.txt file is read to get information about the accelerometer features. There are 561 observations of 2 variables. The first variable is an int list with sequence values from 1 to 561. The second variable is a character list that describes each measurement variable.
These meaningful names are being assigned as names for the measurement data set created on previous step:

```text
'data.frame':	10299 obs. of  561 variables:
 $ tBodyAcc-mean()-X                   : num  0.289 0.278 0.28 0.279 0.277 ...
 $ tBodyAcc-mean()-Y                   : num  -0.0203 -0.0164 -0.0195 -0.0262 -0.0166 ...
 $ tBodyAcc-mean()-Z                   : num  -0.133 -0.124 -0.113 -0.123 -0.115 ...
   [list output truncated]
```
  
####Extracting the mean and standard deviation variables 
In this step, only the mean and standard deviation for each measurement observation will remain. All variables that don't match 'mean()' and 'std()' are being removed. Now the data set has 10299 observations of 66 variables:

```text
'data.frame':	10299 obs. of  66 variables:
 $ tBodyAcc-mean()-X          : num  0.289 0.278 0.28 0.279 0.277 ...
 $ tBodyAcc-mean()-Y          : num  -0.0203 -0.0164 -0.0195 -0.0262 -0.0166 ...
 $ tBodyAcc-mean()-Z          : num  -0.133 -0.124 -0.113 -0.123 -0.115 ...
   [list output truncated]
```

### Working with the activity set
  
####Merging the test and trainning activity sets

There are two files with activity data, Y_train.txt and Y_test.txt.
The first one has a data set with 7352 observations and the second one has a data set with 2947 observations. Both sets have only one variable.
This files are read and then the method rbind is called to join vertically the two data sets, creating a set with 10299 observations of one variable.

```text
'data.frame':	10299 obs. of  1 variable:
 $ V1: int  5 5 5 5 5 5 5 5 5 5 ...
```

####Using descriptive activity names

The activities_label.txt file is read to obtain the activity labels. An ID-label map is created and for each activity observation the activity number is replaced by the activity label.

```text
'data.frame':	10299 obs. of  1 variable:
 $ activityName: chr  "STANDING" "STANDING" "STANDING" "STANDING" ...
```

### Working with the subject set
  
####Merging the test and trainning subject sets

There are two files with subject data, subject_train.txt and subject_test.txt.
The first one has a data set with 7352 observations and the second one has a data set with 2947 observations. Both sets have only one variable.
This files are read and then the method rbind is called to join vertically the two data sets, creating a set with 10299 observations of one variable.

```text
'data.frame':	10299 obs. of  1 variable:
 $ subject: int  1 1 1 1 1 1 1 1 1 1 ...
``` 

### Creating the tidy data set

####Merging the data

The data created on the previous steps are merged using the cbind function:

```text
'data.frame':	10299 obs. of  68 variables:
 $ subject                    : int  1 1 1 1 1 1 1 1 1 1 ...
 $ activityName               : chr  "STANDING" "STANDING" "STANDING" "STANDING" ...
 $ tBodyAcc-mean()-X          : num  0.289 0.278 0.28 0.279 0.277 ...
    [list output truncated]
```

####Creating the tidy data set 

The tidy data set with the average of each variable for each activity and each subject is created calling the function ```aggregate(data, by=list(activity = data$activityName, subjectId=data$subject), mean)```. This function aggregates the data grouping by activity name and subject. It also applys the mean function for the variables in each group. 

The final result is a tidy data set with 180 observations of 68 variables:

```text
'data.frame':	180 obs. of  68 variables:
 $ activity                   : chr  "LAYING" "SITTING" "STANDING" "WALKING" ...
 $ subjectId                  : int  1 1 1 1 1 1 2 2 2 2 ...
 $ tBodyAcc-mean()-X          : num  0.222 0.261 0.279 0.277 0.289 ...
    [list output truncated]
```

After creating the tidy data set, the result is saved on file tidy_data.txt in the working directory.

## The tidy data

The tidy data has 68 variables, which are:

````text
 [1] "activity"                    "subject"                     "tBodyAcc-mean()-X"           "tBodyAcc-mean()-Y"          
 [5] "tBodyAcc-mean()-Z"           "tBodyAcc-std()-X"            "tBodyAcc-std()-Y"            "tBodyAcc-std()-Z"           
 [9] "tGravityAcc-mean()-X"        "tGravityAcc-mean()-Y"        "tGravityAcc-mean()-Z"        "tGravityAcc-std()-X"        
[13] "tGravityAcc-std()-Y"         "tGravityAcc-std()-Z"         "tBodyAccJerk-mean()-X"       "tBodyAccJerk-mean()-Y"      
[17] "tBodyAccJerk-mean()-Z"       "tBodyAccJerk-std()-X"        "tBodyAccJerk-std()-Y"        "tBodyAccJerk-std()-Z"       
[21] "tBodyGyro-mean()-X"          "tBodyGyro-mean()-Y"          "tBodyGyro-mean()-Z"          "tBodyGyro-std()-X"          
[25] "tBodyGyro-std()-Y"           "tBodyGyro-std()-Z"           "tBodyGyroJerk-mean()-X"      "tBodyGyroJerk-mean()-Y"     
[29] "tBodyGyroJerk-mean()-Z"      "tBodyGyroJerk-std()-X"       "tBodyGyroJerk-std()-Y"       "tBodyGyroJerk-std()-Z"      
[33] "tBodyAccMag-mean()"          "tBodyAccMag-std()"           "tGravityAccMag-mean()"       "tGravityAccMag-std()"       
[37] "tBodyAccJerkMag-mean()"      "tBodyAccJerkMag-std()"       "tBodyGyroMag-mean()"         "tBodyGyroMag-std()"         
[41] "tBodyGyroJerkMag-mean()"     "tBodyGyroJerkMag-std()"      "fBodyAcc-mean()-X"           "fBodyAcc-mean()-Y"          
[45] "fBodyAcc-mean()-Z"           "fBodyAcc-std()-X"            "fBodyAcc-std()-Y"            "fBodyAcc-std()-Z"           
[49] "fBodyAccJerk-mean()-X"       "fBodyAccJerk-mean()-Y"       "fBodyAccJerk-mean()-Z"       "fBodyAccJerk-std()-X"       
[53] "fBodyAccJerk-std()-Y"        "fBodyAccJerk-std()-Z"        "fBodyGyro-mean()-X"          "fBodyGyro-mean()-Y"         
[57] "fBodyGyro-mean()-Z"          "fBodyGyro-std()-X"           "fBodyGyro-std()-Y"           "fBodyGyro-std()-Z"          
[61] "fBodyAccMag-mean()"          "fBodyAccMag-std()"           "fBodyBodyAccJerkMag-mean()"  "fBodyBodyAccJerkMag-std()"  
[65] "fBodyBodyGyroMag-mean()"     "fBodyBodyGyroMag-std()"      "fBodyBodyGyroJerkMag-mean()" "fBodyBodyGyroJerkMag-std()" 
```

The fist variable named activity is the activity that the person was performing, the second variable named subject is the person that was performing the activity in the experiment. The following columns are the measurement mean of each accelerometer feature for the given activity and person.

For example, this is the first row of the tidy data:

````text
'data.frame':  1 obs. of  68 variables:
 $ activity                   : chr "LAYING"
 $ subjectId                  : int 1
 $ tBodyAcc-mean()-X          : num 0.222
 $ tBodyAcc-mean()-Y          : num -0.0405
 $ tBodyAcc-mean()-Z          : num -0.113
 $ tBodyAcc-std()-X           : num -0.928
 $ tBodyAcc-std()-Y           : num -0.837
 $ tBodyAcc-std()-Z           : num -0.826
 $ tGravityAcc-mean()-X       : num -0.249
 $ tGravityAcc-mean()-Y       : num 0.706
 $ tGravityAcc-mean()-Z       : num 0.446
 $ tGravityAcc-std()-X        : num -0.897
 $ tGravityAcc-std()-Y        : num -0.908
 $ tGravityAcc-std()-Z        : num -0.852
 $ tBodyAccJerk-mean()-X      : num 0.0811
 $ tBodyAccJerk-mean()-Y      : num 0.00384
 $ tBodyAccJerk-mean()-Z      : num 0.0108
 $ tBodyAccJerk-std()-X       : num -0.958
 $ tBodyAccJerk-std()-Y       : num -0.924
 $ tBodyAccJerk-std()-Z       : num -0.955
 $ tBodyGyro-mean()-X         : num -0.0166
 $ tBodyGyro-mean()-Y         : num -0.0645
 $ tBodyGyro-mean()-Z         : num 0.149
 $ tBodyGyro-std()-X          : num -0.874
 $ tBodyGyro-std()-Y          : num -0.951
 $ tBodyGyro-std()-Z          : num -0.908
 $ tBodyGyroJerk-mean()-X     : num -0.107
 $ tBodyGyroJerk-mean()-Y     : num -0.0415
 $ tBodyGyroJerk-mean()-Z     : num -0.0741
 $ tBodyGyroJerk-std()-X      : num -0.919
 $ tBodyGyroJerk-std()-Y      : num -0.968
 $ tBodyGyroJerk-std()-Z      : num -0.958
 $ tBodyAccMag-mean()         : num -0.842
 $ tBodyAccMag-std()          : num -0.795
 $ tGravityAccMag-mean()      : num -0.842
 $ tGravityAccMag-std()       : num -0.795
 $ tBodyAccJerkMag-mean()     : num -0.954
 $ tBodyAccJerkMag-std()      : num -0.928
 $ tBodyGyroMag-mean()        : num -0.875
 $ tBodyGyroMag-std()         : num -0.819
 $ tBodyGyroJerkMag-mean()    : num -0.963
 $ tBodyGyroJerkMag-std()     : num -0.936
 $ fBodyAcc-mean()-X          : num -0.939
 $ fBodyAcc-mean()-Y          : num -0.867
 $ fBodyAcc-mean()-Z          : num -0.883
 $ fBodyAcc-std()-X           : num -0.924
 $ fBodyAcc-std()-Y           : num -0.834
 $ fBodyAcc-std()-Z           : num -0.813
 $ fBodyAccJerk-mean()-X      : num -0.957
 $ fBodyAccJerk-mean()-Y      : num -0.922
 $ fBodyAccJerk-mean()-Z      : num -0.948
 $ fBodyAccJerk-std()-X       : num -0.964
 $ fBodyAccJerk-std()-Y       : num -0.932
 $ fBodyAccJerk-std()-Z       : num -0.961
 $ fBodyGyro-mean()-X         : num -0.85
 $ fBodyGyro-mean()-Y         : num -0.952
 $ fBodyGyro-mean()-Z         : num -0.909
 $ fBodyGyro-std()-X          : num -0.882
 $ fBodyGyro-std()-Y          : num -0.951
 $ fBodyGyro-std()-Z          : num -0.917
 $ fBodyAccMag-mean()         : num -0.862
 $ fBodyAccMag-std()          : num -0.798
 $ fBodyBodyAccJerkMag-mean() : num -0.933
 $ fBodyBodyAccJerkMag-std()  : num -0.922
 $ fBodyBodyGyroMag-mean()    : num -0.862
 $ fBodyBodyGyroMag-std()     : num -0.824
 $ fBodyBodyGyroJerkMag-mean(): num -0.942
 $ fBodyBodyGyroJerkMag-std() : num -0.933
```