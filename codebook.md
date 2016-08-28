#Codebook
This is Getting and Cleaning Data course project codebook.

##Raw data
The raw data is the sensor signals (accelerometer and gyroscope) data acquired from Samsung smartphone. A full description can be found here:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  
Here are the data for the project:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##Processed data
The analysis follows the steps below:  
* Merge the columns of test data and training data seperately with `cbind()`; merge the rows of test and training data with `rbind()`. 
The resulting data is a 10299 x 563 table.   
* Apply the descriptive labels of variables according to `features.txt`, also change the `subject_id` and `activity_id` column.   
* Using `grep("mean|std" ...)` to extract only the measurements on the mean and standard deviation for each measurement, this includes function mean(), std(), meanFreq(). 
The meanFreq() is included as it is the average of the frequency mesurement.   
* Merge `activity_labels.txt` data as the descriptive activity names to name the activities in the data set.  
* Appropriately labels the data set with descriptive variable names, the steps includes: 
	 * rename activity label column
	 * remove parentheses and dashes: `gsub("\\(\\)", "", ...)`, `gsub("-", "", ...)`
	 * capitalize `mean` and `std`: `gsub("mean", "Mean", ...)`, `gsub("std", "Std", ...)`
* From the previous resulting data set, creates a second, independent tidy data set with the average of each variable 
for each activity and each subject. Here use the `group_by` function from `dplyr` package, then summarize the average value of all veriables with `summarise_each`  
* Write the tidy data into text file with `write.table`.
