# Human Activity Analysis

## Introduction

Getting and cleaning data aims on creating a tidy data set to downstream analysis.

The original data set is from experiments made with a group of 30 volunteers. Each person performed six activities (walking, walking upstairs, walking downstairs, sitting, standing and laying) wearing a smartphone (Samsung Galaxy S II) on the waist. The data data was collected from the accelerometers from the smartphone.

These are the steps to create the tidy data set:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Running the script:

1. Download the data file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzip the content of the zip in the project directory.
2. Set the project directory as the working directory, e.g. ```setwd('('~/projects/human-activity-analysis/')````
3. Run the function ```runAnalysis()````