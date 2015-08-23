library(plyr);

#Download the file from the internet into the working directory
internetFile <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(internetFile,destfile="data.zip",method="internal")
unzip(zipfile="data.zip")

#Set the path
filePath <- "UCI HAR Dataset"

#1. INSTRUCTIONS: Merges the training and the test sets to create one data set.
#Read in all necessary Data from files
activityTest  <- read.table(file.path(filePath , "test" , "Y_test.txt" ), header = FALSE)
activityTrain <- read.table(file.path(filePath, "train", "Y_train.txt"), header = FALSE)
featuresTest  <- read.table(file.path(filePath, "test" , "X_test.txt" ), header = FALSE)
featuresTrain <- read.table(file.path(filePath, "train", "X_train.txt"), header = FALSE)
subjectTrain <- read.table(file.path(filePath, "train", "subject_train.txt"), header = FALSE)
subjectTest  <- read.table(file.path(filePath, "test" , "subject_test.txt"), header = FALSE)
featuresNames <- read.table(file.path(filePath, "features.txt"), head=FALSE)

#Get Data from files and rbind test and train together into one set
activity <- rbind(activityTrain, activityTest)
names(activity) <- c("activity")

features <- rbind(featuresTrain, featuresTest)
names(features) <- featuresNames$V2

subject <- rbind(subjectTrain, subjectTest)
names(subject) <-c("subject")

data <- cbind(activity, subject, features)

#2. INSTRUCTIONS: Extracts only the measurements on the mean and standard deviation for each measurement.
#Use grep to get any feature names that contain mean() or std()
subFeaturesNames <- featuresNames$V2[grep("mean\\(\\)|std\\(\\)", featuresNames$V2)]
selectedNames <- c(as.character(subFeaturesNames), "subject", "activity" )
data <- subset(data,select=selectedNames)

#3. INSTRUCTIONS: Uses descriptive activity names to name the activities in the data set
#Get the descriptions from activity_labels.txt
descriptiveName <- read.table(file.path(filePath, "activity_labels.txt"),header = FALSE)
colnames(descriptiveName) <- "activity"
data = merge(data,descriptiveName,by='activity',all.x=TRUE);

#drop column activity and rename the new column to activity
data$activity <- NULL
names(data)[ncol(data)] <- "activity"

#4. INSTRUCTIONS: Appropriately labels the data set with descriptive variable names.
#Use gsub to replace abbreviated matches with full length words
names(data) <- gsub("^t", "Time", names(data))
names(data) <- gsub("^f", "Frequency", names(data))
names(data) <- gsub("Acc", "Accelerometer", names(data))
names(data) <- gsub("Gyro", "Gyroscope", names(data))
names(data) <- gsub("Mag", "Magnitude", names(data))
names(data) <- gsub("BodyBody", "Body", names(data))

#5. INSTRUCTIONS: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#get the mean for each subject for each of the six possible activities
data2 <- aggregate(. ~subject + activity, data, mean)
data2 <- data2[order(data2$subject,data2$activity),]
write.table(data2, file = "tidydata.txt",row.name=FALSE)
