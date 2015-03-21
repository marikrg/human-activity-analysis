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
  
####1. Merging the test and training sets
  
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
  
####2. Setting meaninful names  

The features_info.txt file is read to get information about the accelerometer features. There are 561 observations of 2 variables. The first variable is an int list with sequence values from 1 to 561. The second variable is a character list that describes each measurement variable.
These meaningful names are being assigned as names for the measurement data set created on previous step:

```text
'data.frame':	10299 obs. of  561 variables:
 $ tBodyAcc-mean()-X                   : num  0.289 0.278 0.28 0.279 0.277 ...
 $ tBodyAcc-mean()-Y                   : num  -0.0203 -0.0164 -0.0195 -0.0262 -0.0166 ...
 $ tBodyAcc-mean()-Z                   : num  -0.133 -0.124 -0.113 -0.123 -0.115 ...
   [list output truncated]
```
  
####3. Extracting the mean and standard deviation variables 
In this step, only the mean and standard deviation for each measurement observation will remain. All variables that don't match 'mean()' and 'std()' are being removed. Now the data set has 10299 observations of 66 variables:

```text
'data.frame':	10299 obs. of  66 variables:
 $ tBodyAcc-mean()-X          : num  0.289 0.278 0.28 0.279 0.277 ...
 $ tBodyAcc-mean()-Y          : num  -0.0203 -0.0164 -0.0195 -0.0262 -0.0166 ...
 $ tBodyAcc-mean()-Z          : num  -0.133 -0.124 -0.113 -0.123 -0.115 ...
   [list output truncated]
```

### Working with the activity set
  
####1. Merging the test and trainning activity sets

There are two files with activity data, Y_train.txt and Y_test.txt.
The first one has a data set with 7352 observations and the second one has a data set with 2947 observations. Both sets have only one variable.
This files are read and then the method rbind is called to join vertically the two data sets, creating a set with 10299 observations of one variable.

```text
'data.frame':	10299 obs. of  1 variable:
 $ V1: int  5 5 5 5 5 5 5 5 5 5 ...
```

####2. Using descriptive activity names

The activities_label.txt file is read to obtain the activity labels. An ID-label map is created and for each activity observation the activity number is replaced by the activity label.

```text
'data.frame':	10299 obs. of  1 variable:
 $ activityName: chr  "STANDING" "STANDING" "STANDING" "STANDING" ...
```

### Working with the subject set
  
####1. Merging the test and trainning subject sets

There are two files with subject data, subject_train.txt and subject_test.txt.
The first one has a data set with 7352 observations and the second one has a data set with 2947 observations. Both sets have only one variable.
This files are read and then the method rbind is called to join vertically the two data sets, creating a set with 10299 observations of one variable.

```text
'data.frame':	10299 obs. of  1 variable:
 $ subject: int  1 1 1 1 1 1 1 1 1 1 ...
``` 

### Creating the tidy data set

####1. Merging the data

The data created on the previous steps are merged using the cbind function:

```text
'data.frame':	10299 obs. of  68 variables:
 $ subject                    : int  1 1 1 1 1 1 1 1 1 1 ...
 $ activityName               : chr  "STANDING" "STANDING" "STANDING" "STANDING" ...
 $ tBodyAcc-mean()-X          : num  0.289 0.278 0.28 0.279 0.277 ...
    [list output truncated]
```

####2. Creating the tidy data set 

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