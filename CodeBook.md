---
title: "CodeBook"
output:
  word_document: default
  pdf_document: default
---

The run_analysis.R script collects and cleans a data set through 5 different steps. The data was obtained from:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Actions performed on data:
- Merge training and test data sets into one large data set (563 variables and 10299 observations)
- Extract only the measurements that involve mean or standard deviation (88 variables and 10299 observations)
- Rename the activity names done by each subject
- Rename the variables with appropriately descriptive labels 
- Create a second data set named *Tidy_Data.txt* with the average of each variable for each activity and subject

## Variables in Code
- features: variable assigned the data in *features.txt*
- activitylabels: variable assigned the data in *activity_labels.txt*
- x_test: variable assigned the data in *X_test.txt*
- x_train: variable assigned the data in *X_train.txt*
- y_test: variable assigned the data in *y_test.txt*
- y_train: variable assigned the data in *y_train.txt*
- subject_test: variable assigned the data in *subject_test.txt*
- subject_train: variable assigned the data in *subject_train.txt*
- X: Merged table from x_test and x_train using **rbind()**
- Y: Merged table from y_test and y_train using **rbind()**
- Subject: Merged table from subject_test and subject_train using **rbind()**
- MergedDF: Merged table from X, Y, Subject using **cbind()** (10299 rows, 88 columns)
- FilteredDF: Filtered table from MergedDF containing only mean and standard deviation variables (10299 rows, 88 columns)
- Tidy_data: Summarized table with the means of each variable for each activity and subject (180 rows, 88 columns)

