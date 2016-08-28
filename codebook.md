#Codebook
This is Getting and Cleaning Data course project codebook.

##Raw data
The raw data is the sensor signals (accelerometer and gyroscope) data acquired from Samsung smartphone. A full description can be found here:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  
Here are the data for the project:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
Refer to `features_info.txt` for the description of the all variables. 

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

##Code book  
This is the codebook for the tidy data, this part is modified based on `features_info.txt`

==========================================================================================================

   subjectID

----------------------------------------------------------------------------------------------------------
Unique identifier for experiment subject  
   1..30; Storage mode: integer

==========================================================================================================

   activity

----------------------------------------------------------------------------------------------------------
description of the six activities performed  
   Storage mode: integer
   Factor with 6 levels

        Values and labels    N    Percent 
                                          
    1 'LAYING'             1944   18.9     
    2 'SITTING'            1777   17.3     
    3 'STANDING'           1906   18.5     
    4 'WALKING'            1722   16.7     
    5 'WALKING_DOWNSTAIRS' 1406   13.7     
    6 'WALKING_UPSTAIRS'   1544   15.0    
==========================================================================================================

   activityID

----------------------------------------------------------------------------------------------------------
Unique identifier for activity  
   1..6; Storage mode: integer  

==========================================================================================================

Feature Selection 

----------------------------------------------------------------------------------------------------------
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAccXYZ: the body linear acceleration on the x/y/z axis of the phone  
tGravityAccXYZ: the body angular velocity on the x/y/z axis of the phone  
tBodyAccJerkXYZ: the jerk of the body linear acceleration on the x/y/z axis of the phone  
tBodyGyroXYZ: the body gyroscope signal on the x/y/z axis of the phone  
tBodyGyroJerkXYZ: the jerk of the body gyroscope signal on the x/y/z axis of the phone  
tBodyAccMag: the magnitude of the body linear acceleration  
tGravityAccMag: the magnitude of the body angular velocity  
tBodyAccJerkMag: the magnitude of the jerk of the body linear acceleration  
tBodyGyroMag: the magnitude of the body gyroscope signal  
tBodyGyroJerkMag: the magnitude of the jerk of the body gyroscope signal  
fBodyAccXYZ: the fourier transform of the body linear acceleration on the x/y/z axis of the phone  
fBodyAccJerkXYZ: the fourier transform of the jerk of the body linear acceleration on the x/y/z axis of the phone  
fBodyGyroXYZ: the fourier transform of the body gyroscope signal on the x/y/z axis of the phone  
fBodyAccMag: the fourier transform of the magnitude of the body linear acceleration  
fBodyAccJerkMag: the fourier transform of the magnitude of the jerk of the body linear acceleration  
fBodyGyroMag: the fourier transform of the magnitude of the body gyroscope signal  
fBodyGyroJerkMag: the fourier transform of the magnitude of the jerk of the body gyroscope signal  

The set of variables that were estimated from these signals are: 

Mean: Mean value  
Std: Standard deviation  
MeanFreq: Weighted average of the frequency components to obtain a mean frequency  
