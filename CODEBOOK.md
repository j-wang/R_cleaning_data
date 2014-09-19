## Original, Pre-Analysis Data
Unmodified data found in UCI HAR Dataset is from UC Irvine's Machine Learning repository.
A mirror to this dataset (in the form it is used here), can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

## Transformations of UCI Data
1. Training and test set data have been combined into a single dataset
2. Subject labels, activity labels, and sensor readings have been combined into a single data frame.
3. Activity labels have been given descriptive names, instead of merely integer values.
4. Measures of variables other than mean and standard deviation have been removed.

## Variables
Variables in this dataset are from accelerometer and gyroscope 3-axial raw signals. From UCI's own description:

>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

And on the features:

> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.
>
>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).
>
>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

The specific variables produced by the run_analysis.R script (in R's environment as "all") are below.

#### Subject
Factor variable identifying individual subjects. 30 individuals in the experiment with ages ranging from 19-48 years of age.

#### Activity
Labeled factor variable identifying specific activity performed by the subject. Specific activities are:
* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

#### Sensor Variables
Each of these variables are the raw signals from sensors as described by UCI above. All variables are unitless, as they are normalized and bounded between [-1, 1].

To interpret the variables:

1. (t or f) the first letter indicates **t**ime or **f**requency.
2. (BodyAcc, GravityAcc, BodyAccJerk, BodyGyro...) Sensor output based on the above. On a most basic level, acceleration or gyro readings, broken up into "body" and "gravity" readings (separating out what movement is from the individual the Samsung phone is attached to, vs. gravitation). Jerk, JerkMag, etc. are modifications on this that are more specialized readings that measure jerk (as a movement) and Mag (magnitude).
3. (-mean() or -std()) mean or standard deviation reading
4. (-X or -Y or -Z) X, Y, or Z axis direction (as mentioned above, these are three-axis gyros and accelerometers.

The list below lists all sensor variables in the dataset:

* "tBodyAcc-mean()-X"
* "tBodyAcc-mean()-Y"
* "tBodyAcc-mean()-Z"
* "tBodyAcc-std()-X"
* "tBodyAcc-std()-Y"
* "tBodyAcc-std()-Z"
* "tGravityAcc-mean()-X"
* "tGravityAcc-mean()-Y"
* "tGravityAcc-mean()-Z"
* "tGravityAcc-std()-X"
* "tGravityAcc-std()-Y"
* "tGravityAcc-std()-Z"
* "tBodyAccJerk-mean()-X"
* "tBodyAccJerk-mean()-Y"
* "tBodyAccJerk-mean()-Z"
* "tBodyAccJerk-std()-X"
* "tBodyAccJerk-std()-Y"
* "tBodyAccJerk-std()-Z"
* "tBodyGyro-mean()-X"
* "tBodyGyro-mean()-Y"
* "tBodyGyro-mean()-Z"
* "tBodyGyro-std()-X"
* "tBodyGyro-std()-Y"
* "tBodyGyro-std()-Z"
* "tBodyGyroJerk-mean()-X"
* "tBodyGyroJerk-mean()-Y"
* "tBodyGyroJerk-mean()-Z"
* "tBodyGyroJerk-std()-X"
* "tBodyGyroJerk-std()-Y"
* "tBodyGyroJerk-std()-Z"
* "tBodyAccMag-mean()"
* "tBodyAccMag-std()"
* "tGravityAccMag-mean()"
* "tGravityAccMag-std()"
* "tBodyAccJerkMag-mean()"
* "tBodyAccJerkMag-std()"
* "tBodyGyroMag-mean()"
* "tBodyGyroMag-std()"
* "tBodyGyroJerkMag-mean()"
* "tBodyGyroJerkMag-std()"
* "fBodyAcc-mean()-X"
* "fBodyAcc-mean()-Y"
* "fBodyAcc-mean()-Z"
* "fBodyAcc-std()-X"
* "fBodyAcc-std()-Y"
* "fBodyAcc-std()-Z"
* "fBodyAccJerk-mean()-X"
* "fBodyAccJerk-mean()-Y"
* "fBodyAccJerk-mean()-Z"
* "fBodyAccJerk-std()-X"
* "fBodyAccJerk-std()-Y"
* "fBodyAccJerk-std()-Z"
* "fBodyGyro-mean()-X"
* "fBodyGyro-mean()-Y"
* "fBodyGyro-mean()-Z"
* "fBodyGyro-std()-X"
* "fBodyGyro-std()-Y"
* "fBodyGyro-std()-Z"
* "fBodyAccMag-mean()"
* "fBodyAccMag-std()"
* "fBodyBodyAccJerkMag-mean()"
* "fBodyBodyAccJerkMag-std()"
* "fBodyBodyGyroMag-mean()"
* "fBodyBodyGyroMag-std()"
* "fBodyBodyGyroJerkMag-mean()"
* "fBodyBodyGyroJerkMag-std()"
