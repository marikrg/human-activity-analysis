# Human Activity Analysis

## Introduction

This project aims on creating a tidy data set to downstream analysis.

The original data set is from experiments made with a group of 30 volunteers. Each person performed six activities wearing a smartphone Samsung Galaxy S II on the waist. The data was collected using the smartphone accelerometer.

The performed activities were walking, walking upstairs, walking downstairs, sitting, standing and laying.

These are five steps to create the tidy data set:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## The project

### run_analysis.R
The script [run_analysis.R](https://github.com/marikrg/human-activity-analysis/blob/master/run_analysis.R) is responsible for doing the analysis, collecting, working with, and cleaning a data set. As result, we have a tidy data to downstream analysis.

### file_reader.R
The script [file_reader.R](https://github.com/marikrg/human-activity-analysis/blob/master/file_reader.R) reads the text files.

### Codebook.md

[Codebook.md](https://github.com/marikrg/human-activity-analysis/blob/master/Codebook.md) has information about the variables in the data set not contained in the tidy data, the summary choices made and the experimental study design used.

## Running the script:

1. Download the file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Unzip the content in the project directory
3. Set the project directory as the working directory
4. Run the command ```source('./file_reader.R')``` and ```source('./run_analysis.R')```
5. Run the function ```runAnalysis()```

## The tidy data

Calling the function ```runAnalysis()``` the tidy data generated is saved on a text file named tidy_data.txt in the working directory.
