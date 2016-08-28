# Getting-and-Cleaning-the-Assignment
This is the repository for Getting and Cleaning Data Course Project.
# Processing data with run_analysis.R
The data used for this project is acquired from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

* Download the given data and `run_analysis.R` file in local folder, unzip into R working directory
* Source the processing script  
```{r}
source("run_analysis.R")
```
* The script will generate a tidy data text file that meets the principles of tidy data in [Hadley Wickham’s Tidy Data paper](http://vita.had.co.nz/papers/tidy-data.pdf)
* Use the following code to read data `tidyData.txt` into R: 
```{r}
data <- read.table("tidyData.txt", header = TRUE) 
View(data)
```
The tidy data generates average of each variable for each activity and each subject, the `codebook.md` has the specific description of the contents.
