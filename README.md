GettingAndCleaningData
======================


Running run_analysis.R should complete the following
   
1)  Merges the training and the test sets to create one data set.
2)  Extracts only the measurements on the mean and standard deviation for each measurement. 
3)  Uses descriptive activity names to name the activities in the data set
4)  Appropriately labels the data set with descriptive variable names. 
5)  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


Repository contents
====================

*README.md, this file.

*CodeBook.md, contains a list of the variables produced by run_analysis.R

*run_analysis.R - The R script that produces the tidydata.txt file

Running run_analysis.R
===============================

1) Download run_analysis.R to a working directory

2) Run run_analysis.R
--1) Use the command source("run_analysis.R") or run it another way.
--2) It will download and unzip into your current working directory a folder called "UCI HAR Dataset."
--3) A new file called tidydata.txt will be created in your working directory.

Activity of run_analysis.R
====================================
The description below follows the comments found in the script.

###Download the file from the internet into the working directory.
*Save the downloaded zip file as data.zip.
*Unzip the file

###Set the path
*filepath - Variable to store the "UCI HAR Dataset" folder.

###Read in all necessary Data from files
*activityTest - Variable containing data from Y_test.txt
*activityTrain - Variable containing data from Y_train.txt
*featuresTest - Variable containing data from X_test.txt
*featuresTrain - Variable containing data from X_train.txt
*subjectTrain - Variable containing data from subject_train.txt
*subjectTest - Variable containing data from subject_test.txt
*featuresNames - Variable containing data from features.txt

###Get Data from files and rbind test and train together into one set
*data - Variable containing the final concatenated result of the six test and train variables above.

###Use grep to get any feature names that contain mean() or std()
*data - results in a subsetted data set.

####Get the descriptions from activity_labels.txt
*Read in the file activity_labels.txt
*Name the first column "activity"
*data - merge into this variable by "activity"

###drop column activity and rename the new column to activity
*Make activity column in data NULL.
*Rename the last column, which is unnamed, "activity" to replace the dropped column

###Use gsub to replace abbreviated matches with full length words
*Replaced:
1)t at the beginning with Time
2)f at the beginning with Frequency
3)any occurence of Acc with Accelerometer
4)any occurence of Acc with Accelerometer
5)any occurence of Mag with Magnitude
6)any occurence of BodyBody with Body

###get the mean for each subject for each of the six possible activities
*Use aggregate function to compute the mean
*Move subject and activity to the left of the table
*Write the data to tidydata.txt in the working directory.