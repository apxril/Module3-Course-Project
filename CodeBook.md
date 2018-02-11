# Getting and Cleaning Data Code Book 

This md file describes the variables of the code inside `run_analysis.R`.

# Variables

# the data from the downloaded files.
* `x_train`
* `y_train`
* `x_test`
* `y_test`
* `subject_train`
* `subject_test`

# variables to merge to create one data set
* `x`
* `y` 
* `subject`


# features
* values consist of data from `x` and `y` 
* names consists of data from `features.txt` 
* `features_mean_std` consists of measurements on the mean and standard deviation for each measurement.

# tidyData
* `Data1` contains the data from `x`, `y` and `subject` that was merged
* `Data2` contains the average of the tidy data set of each variable for each subject and activity

