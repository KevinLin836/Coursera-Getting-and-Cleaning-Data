# README
# Peer-graded Assignment: Getting and Cleaning Data Course Project

This repository is Kevin Lin's submission for the Getting and Cleaning Data Course Project. The following describes the files and the data set used in the completion of the project. 

## Dataset
The data used in this project was obtained from [Human Activity Recognition Using Smartphones Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Files
- 'run_analysis.R' collects, cleans, and analyzes the data through 5 steps: 
    - Merge training and test data sets into one large data set 
    - Extract only the measurements that involve mean or standard deviation 
    - Rename the activity names done by each subject
    - Rename the variables with appropriately descriptive labels 
    - Create a second data set with the average of each variable for each activity and subject

- 'CodeBook.md' contains the transformations performed onto the dataset by 'run_analysis.R' and describes the variables used in the r script. 

- 'Tidy_Data.txt' is the final data set exported by the r script, containing the average of each variable for each activity and each subject. 
