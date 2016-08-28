# Read the data into R (already downloaded to local folders)
library(dplyr)
setwd("/Users/liweifu/Documents/DataScience/CleaningData/UCI HAR Dataset")
feature <- read.table("features.txt")
activity <- read.table("activity_labels.txt")
subtest <- read.table("./test/subject_test.txt")
x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subtrain <- read.table("./train/subject_train.txt")
x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")

# 1. Merges the training and the test sets to create one data set
test_data <- cbind(subtest, x_test, y_test)
train_data <- cbind(subtrain, x_train, y_train)
uci_merge <- rbind(test_data, train_data)
names(uci_merge) <- c("subjectID", as.character(feature$V2), "activityID")

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# Keeping id and activity field
uci_merge_sub <- uci_merge[,c(1, grep("mean|std", names(uci_merge)), 563)]

# 3. Uses descriptive activity names to name the activities in the data set
# Merge activity_labels data
uci_merge1 <- merge(uci_merge_sub, activity, by.x = "activityID", by.y = "V1")

# 4. Appropriately labels the data set with descriptive variable names.
# Variable names has already be relabeled in step 1
# rename activity label column
names(uci_merge1)[names(uci_merge1) == "V2"] <- "activity"
# remove parentheses
names(uci_merge1) <- gsub("\\(\\)", "", names(uci_merge1))
names(uci_merge1) <- gsub("-", "", names(uci_merge1))
names(uci_merge1) <- gsub("mean", "Mean", names(uci_merge1))
names(uci_merge1) <- gsub("std", "Std", names(uci_merge1))

# 5. From the data set in step 4, creates a second, independent tidy data set 
#with the average of each variable for each activity and each subject.
tidyData <- group_by(uci_merge1, subjectID, activity) %>% summarise_each(funs(mean))

# save the table to text file
write.table(tidyData, file = "tidyData.txt", row.names=FALSE)