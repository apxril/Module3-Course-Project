

library(plyr)
library(data.table)

# Step 1: Merge the training and test sets to create one data set

#read data

x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")

subject_train <- read.table("train/subject_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")

subject_test <- read.table("test/subject_test.txt")

#merge data

x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

# Step 2: Extract only the measurements on the mean and standard deviation for each measurement

features <- read.table("features.txt")
features_mean_std <- grep("-(mean|std)\\(\\)", features[, 2])
x <- x[, features_mean_std]
names(x) <- features[features_mean_std, 2]

# Step 3: Use descriptive activity names to name the activities in the data set

activities <- read.table("activity_labels.txt")[y[, 1], 2]
names(y) <- "Activity"

# Step 4: Appropriately label the data set with descriptive variable names

names(subject) <- "Subject"
Data1 <- cbind(x, x, subject)

# Step 5: Create a second, independent tidy data set with the average of each variable for each activity and each subject

Data2 <- aggregate(. ~subject + activities, Data1, mean)
write.table(Data2, "tidyData.txt", row.name=FALSE)