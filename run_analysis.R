library(dplyr)

compressedfolder <- "getdata_projectfiles_UCI HAR Dataset"
if (!file.exists(compressedfolder)) {
    url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(url, compressedfolder)
}

if (!file.exists("UCI HAR Dataset")) {
    unzip(compressedfolder)
}

# read all of the data 
features <- read.table("./UCI HAR Dataset/features.txt", 
                       col.names = c("n", "features"))
activitylabels <- read.table("./UCI HAR Dataset/activity_labels.txt",
                             col.names = c("num", "activity"))
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Merge the training and the test sets to create one data set.
X <- rbind(x_train, x_test) ; colnames(X) <- features$features
Y <- rbind(y_train, y_test) ; colnames(Y) <- "activitycode"
Subject <- rbind(subject_train, subject_test) ; colnames(Subject) <- "subjects"

MergedDF <- cbind(Subject, Y, X)

# Extracts only the measurements on the mean and standard deviation for each measurement.
FilteredDF <- select(MergedDF, subjects, activitycode, 
                     contains("mean"), contains("std"))

# Uses descriptive activity names to name the activities in the data set
FilteredDF$activitycode <- activitylabels[FilteredDF$activitycode, 2]

# Appropriately labels the data set with descriptive variable names.
colnames(FilteredDF) <- gsub("[(][)]", "", colnames(FilteredDF))
colnames(FilteredDF) <- gsub("Acc", "Acclerometer", colnames(FilteredDF))
colnames(FilteredDF) <- gsub("-mean()", "Mean", colnames(FilteredDF))
colnames(FilteredDF) <- gsub("^t", "Time", colnames(FilteredDF))
colnames(FilteredDF) <- gsub("tBody", "TimeBody", colnames(FilteredDF))
colnames(FilteredDF) <- gsub("Gyro", "Gyroscope", colnames(FilteredDF))
colnames(FilteredDF) <- gsub("^f", "Frequency", colnames(FilteredDF))
colnames(FilteredDF) <- gsub("Mag", "Magnitude", colnames(FilteredDF))
colnames(FilteredDF) <- gsub("-std", "StandardDeviation", colnames(FilteredDF))
colnames(FilteredDF) <- gsub("-Freq", "Frequency", colnames(FilteredDF))
colnames(FilteredDF) <- gsub("-", "_", colnames(FilteredDF))

# From the data set in step 4, creates a second, independent tidy data set with 
# the average of each variable for each activity and each subject.
Tidy_data <- FilteredDF %>% group_by(subjects, activitycode) %>% 
    summarise_all(funs(mean))

write.table(Tidy_data,"Tidy_Data.txt", row.names = FALSE)
