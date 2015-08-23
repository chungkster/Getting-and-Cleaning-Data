CodeBook.md
===============
Original source
---------------
This dataset comes from the "Human Activity Recognition Using Smartphones Data Set" avaiable here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

About Raw Data
---------------

Please refer to the website above on how the data was originally gathered and what methods were used.

Instruction # 2 says "Extracts only the measurements on the mean and standard deviation for each measurement."
I have subsetted the data to included all variables showing a mean or standard deviation.

_Triaxial variables have been grouped together to shorten the list_

* "subject" - Subject ID numbers from 1 through 30
* "activity" - 6 possibilities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING                                    
* "TimeBodyAccelerometer-mean()-X", "TimeBodyAccelerometer-mean()-Y", "TimeBodyAccelerometer-mean()-Z"
* TimeBodyAccelerometer-std()-X", "TimeBodyAccelerometer-std()-Y", "TimeBodyAccelerometer-std()-Z"                 
* "TimeGravityAccelerometer-mean()-X", "TimeGravityAccelerometer-mean()-Y", "TimeGravityAccelerometer-mean()-Z"
* "TimeGravityAccelerometer-std()-X", "TimeGravityAccelerometer-std()-Y", "TimeGravityAccelerometer-std()-Z"              
* "TimeBodyAccelerometerJerk-mean()-X", "TimeBodyAccelerometerJerk-mean()-Y", "TimeBodyAccelerometerJerk-mean()-Z"
* "TimeBodyAccelerometerJerk-std()-X", "TimeBodyAccelerometerJerk-std()-Y", "TimeBodyAccelerometerJerk-std()-Z"             
* "TimeBodyGyroscope-mean()-X", "TimeBodyGyroscope-mean()-Y", "TimeBodyGyroscope-mean()-Z"
* "TimeBodyGyroscope-std()-X", "TimeBodyGyroscope-std()-Y", "TimeBodyGyroscope-std()-Z"                     
* "TimeBodyGyroscopeJerk-mean()-X", "TimeBodyGyroscopeJerk-mean()-Y", "TimeBodyGyroscopeJerk-mean()-Z"
* "TimeBodyGyroscopeJerk-std()-X", "TimeBodyGyroscopeJerk-std()-Y", "TimeBodyGyroscopeJerk-std()-Z"                 
* "TimeBodyAccelerometerMagnitude-mean()"
* "TimeBodyAccelerometerMagnitude-std()"          
* "TimeGravityAccelerometerMagnitude-mean()"
* "TimeGravityAccelerometerMagnitude-std()"       
* "TimeBodyAccelerometerJerkMagnitude-mean()"
* "TimeBodyAccelerometerJerkMagnitude-std()"      
* "TimeBodyGyroscopeMagnitude-mean()"
* "TimeBodyGyroscopeMagnitude-std()"              
* "TimeBodyGyroscopeJerkMagnitude-mean()"
* "TimeBodyGyroscopeJerkMagnitude-std()"          
* "FrequencyBodyAccelerometer-mean()-X", "FrequencyBodyAccelerometer-mean()-Y", "FrequencyBodyAccelerometer-mean()-Z"
* "FrequencyBodyAccelerometer-std()-X", "FrequencyBodyAccelerometer-std()-Y", "FrequencyBodyAccelerometer-std()-Z"            
* "FrequencyBodyAccelerometerJerk-mean()-X", "FrequencyBodyAccelerometerJerk-mean()-Y", "FrequencyBodyAccelerometerJerk-mean()-Z"
* "FrequencyBodyAccelerometerJerk-std()-X", "FrequencyBodyAccelerometerJerk-std()-Y", "FrequencyBodyAccelerometerJerk-std()-Z"        
* "FrequencyBodyGyroscope-mean()-X", "FrequencyBodyGyroscope-mean()-Y", "FrequencyBodyGyroscope-mean()-Z"
* "FrequencyBodyGyroscope-std()-X", "FrequencyBodyGyroscope-std()-Y", "FrequencyBodyGyroscope-std()-Z"                
* "FrequencyBodyAccelerometerMagnitude-mean()"
* "FrequencyBodyAccelerometerMagnitude-std()"     
* "FrequencyBodyAccelerometerJerkMagnitude-mean()"
* "FrequencyBodyAccelerometerJerkMagnitude-std()" 
* "FrequencyBodyGyroscopeMagnitude-mean()"
* "FrequencyBodyGyroscopeMagnitude-std()"         
* "FrequencyBodyGyroscopeJerkMagnitude-mean()"
* "FrequencyBodyGyroscopeJerkMagnitude-std()"     

What Happens When I Run run_analysis.R?
---------------
* The script downloads a zip from [file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
* It then unzips it to your working directory.
* Text files in the unzipped folder are read into memory.
* Everything is combined together into one dataset.
* Only the columns containing mean() or std() in their labels are kept.
* Activity is changed from integers to descriptive names.
* Each label is renamed to be more descriptive.
* tidydata.txt is output to the working directory as a result.


Resulting File
---------------
A file called tidy.txt will be created and saved in the working directory upon running run_analysis.R

About the Code Book
-------------------
The CodeBook.md file explains the transformations performed and the resulting data and variables.