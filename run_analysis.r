## run_analysis.r

library(plyr)

# Read measurements, activity labels, and subject labels for test & train observations
test <- read.table("UCI HAR Dataset/test/X_test.txt", colClasses = "numeric")
testLables <- read.table("UCI HAR Dataset/test/y_test.txt", colClasses = "integer")
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt", colClasses = "integer")
train <- read.table("UCI HAR Dataset/train/X_train.txt", colClasses = "numeric")
trainLabels <- read.table("UCI HAR Dataset/train/y_train.txt", colClasses = "integer")
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt", colClasses = "integer")

# Read descriptive names for activity labels and features
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
featureLables <- read.table("UCI HAR Dataset/features.txt")

# Replace variable names with feature labels
names(test) <- featureLables$V2
names(train) <- featureLables$V2

# Add activity labels and subject id as new variables to datasets
test$Activity <- factor(testLables$V1, levels=activityLabels$V1, labels=activityLabels$V2)
test$Subject <- testSubjects$V1
train$Activity <- factor(trainLabels$V1, levels=activityLabels$V1, labels=activityLabels$V2)
train$Subject <- trainSubjects$V1

# Merge datasets
merged <- rbind(train, test)

# Find which columns in the data frame have "std()" or "mean()" in their variable names
# (produces integer vector). Also spare Activity and Subject columns that we added before.
keepTheseColumns <- grep("std\\()|mean\\()|^Activity$|^Subject$", names(merged))

# Keep only wanted columns
filtered <- merged[, keepTheseColumns]

# Create tidy data set with only means (data grouped by Subject and Activity)
means <- ddply(filtered, c("Subject", "Activity"), numcolwise(mean))

# Write data file
write.table(means, "tidy.txt", row.names=FALSE)