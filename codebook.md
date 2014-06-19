==================================================================
CODEBOOK
========
========

This codebook corresponds to the run_analysis.R file.
The codebok was created by Jennie Murack.

THE DATASET
===========
===========


Created by:
===========
Human Activity Recognition Using Smartphones Dataset
Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws


Downloaded from:
===============
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
on 6/17/2014

Data collection procedures:
===========================
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

Pre-Processing:
==============

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. 
The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. 
From each window, a vector of features was obtained by calculating variables from the time and frequency domain. . 
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

For each record it is provided:
==============================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


DATA PROCESSING:
===============
===============

Variables from the X_train and x_test files were included in the analysis if they included any type of mean or standard deviation measurement. 
A file of all training variables was created from subject_train, the subset of X_train variables, and y_train. 
Similarly, a file of all test variables was created from subject_test, the subset of X_test variables, and y_test.
These files were combined into one dataset called "all.data" that includes the subset of mean and standard deviation variables from both the training and test datasets. 
An additional column was added to "all.data" that listed the activity code number as a description of the activity, using the following codes:
1 WALKING

2 WALKING_UPSTAIRS

3 WALKING_DOWNSTAIRS

4 SITTING

5 STANDING

6 LAYING


From the "all.data" dataset, a second dataset, "sum.data" was created that consists of the mean of all variables for each subject and for each type of activity.
The output from "sum.data" is a text file.

The variables in each dataset are described below.

Variables:
=========

Variables that begin with "f" have had a Fast Fourier Transform (FFT) applied to produce a frequency domain signal.
Variables that begin with "t" are time domain signals and were captured at a constant rate of 50 HZ.

"all.data"
	
Column Number	Column Name				Description
1		Subject ID				ID number from the subject_train.txt and subject_test.txt files
2		"tBodyAcc-mean()-X"			Mean body acceleration signal for the X axis
3		"tBodyAcc-mean()-Y"			Mean body acceleration signal for the Y axis
4		"tBodyAcc-mean()-Z"			Mean body acceleration signal for the Z axis
5		"tBodyAcc-std()-X"			Standard deviation of the body acceleration signal for the X axis
6		"tBodyAcc-std()-Y"			Standard deviation of the body acceleration signal for the Y axis
7		"tBodyAcc-std()-Z"			Standard deviation of the body acceleration signal for the Z axis
8		"tGravityAcc-mean()-X"			Mean gravity acceleration signal for the X axis
9		"tGravityAcc-mean()-Y"			Mean gravity acceleration signal for the Y axis
10		"tGravityAcc-mean()-Z"			Mean gravity acceleration signal for the Z axis
11		"tGravityAcc-std()-X"			Standard deviation of the gravity acceleration signal for the X axis
12		"tGravityAcc-std()-Y"			Standard deviation of the gravity acceleration signal for the Y axis
13		"tGravityAcc-std()-Z"			Standard deviation of the gravity acceleration signal for the Z axis
14		"tBodyAccJerk-mean()-X"			Mean of the body linear acceleration derived in time for the X axis
15		"tBodyAccJerk-mean()-Y"			Mean of the body linear acceleration derived in time for the Y axis
16		"tBodyAccJerk-mean()-Z"			Mean of the body linear acceleration derived in time for the Z axis
17		"tBodyAccJerk-std()-X"			Standard deviation of the body linear acceleration derived in time for the X axis
18		"tBodyAccJerk-std()-Y"			Standard deviation of the body linear acceleration derived in time for the Y axis
19		"tBodyAccJerk-std()-Z"			Standard deviation of the body linear acceleration derived in time for the Z axis
20		"tBodyGyro-mean()-X"			Mean of the gyroscope signal for the X axis
21		"tBodyGyro-mean()-Y"			Mean of the gyroscope signal for the Y axis
22		"tBodyGyro-mean()-Z"			Mean of the gyroscope signal for the Z axis
23		"tBodyGyro-std()-X"			Standard deviation of the gyroscope signal for the X axis
24		"tBodyGyro-std()-Y"			Standard deviation of the gyroscope signal for the Y axis
25		"tBodyGyro-std()-Z"			Standard deviation of the gyroscope signal for the Z axis
26		"tBodyGyroJerk-mean()-X"		Mean of the angular velocity derived in time for the X axis
27		"tBodyGyroJerk-mean()-Y"		Mean of the angular velocity derived in time for the Y axis
28		"tBodyGyroJerk-mean()-Z"		Mean of the angular velocity derived in time for the Z axis
29		"tBodyGyroJerk-std()-X"			Standard deviation of the angular velocity derived in time for the X axis
30		"tBodyGyroJerk-std()-Y"			Standard deviation of the angular velocity derived in time for the Y axis
31		"tBodyGyroJerk-std()-Z"			Standard deviation of the angular velocity derived in time for the Z axis
32		"tBodyAccMag-mean()"			Mean of the magnitude of the 3-dimensional signal for body acceleration
33		"tBodyAccMag-std()"			Standard deviation of the magnitude of the 3-dimensional signal for body acceleration
34		"tGravityAccMag-mean()"			Mean of the magnitude of the 3-dimensional signal for gravity acceleration
35		"tGravityAccMag-std()"			Standard deviation of the magnitude of the 3-dimensional signal for gravity acceleration
36		"tBodyAccJerkMag-mean()"		Mean of the magnitude of the 3-dimensional signal for body linear acceleration derived in time
37		"tBodyAccJerkMag-std()"			Standard deviation of the magnitude of the 3-dimensional signal for body linear acceleration derived in time
38		"tBodyGyroMag-mean()"			Mean of the magnitude of the 3-dimensional signal for the gyroscope signal
39		"tBodyGyroMag-std()"			Standard deviation of the magnitude of the 3-dimensional signal for gyroscope signal
40		"tBodyGyroJerkMag-mean()"		Mean of the magnitude of the 3-dimensional signal for angular velocity derived in time
41		"tBodyGyroJerkMag-std()"		Standard deviation of the magnitude of the 3-dimensional signal for angular velocity derived in time
42		"fBodyAcc-mean()-X"			Mean body acceleration frequency domain signal for the X axis
43		"fBodyAcc-mean()-Y"			Mean body acceleration frequency domain signal for the Y axis
44		"fBodyAcc-mean()-Z"			Mean body acceleration frequency domain signal for the Z axis
45		"fBodyAcc-std()-X"			Standard deviation of the body acceleration frequency domain signal for the X axis
46		"fBodyAcc-std()-Y"			Standard deviation of the body acceleration frequency domain signal for the Y axis
47		"fBodyAcc-std()-Z"			Standard deviation of the body acceleration frequency domain signal for the Z axis
48		"fBodyAcc-meanFreq()-X"			Weighted average of the frequency components to obtain a mean frequency of the body acceleration frequency domain signal for the X axis.
49		"fBodyAcc-meanFreq()-Y"			Weighted average of the frequency components to obtain a mean frequency of the body acceleration frequency domain signal for the Y axis.
50		"fBodyAcc-meanFreq()-Z"			Weighted average of the frequency components to obtain a mean frequency of the body acceleration frequency domain signal for the Z axis.
51		"fBodyAccJerk-mean()-X"			Mean of the body linear acceleration frequency domain derived in time for the X axis
52		"fBodyAccJerk-mean()-Y"			Mean of the body linear acceleration frequency domain derived in time for the Y axis
53		"fBodyAccJerk-mean()-Z"			Mean of the body linear acceleration frequency domain derived in time for the Z axis
54		"fBodyAccJerk-std()-X"			Standard deviation of the body linear acceleration frequency domain derived in time for the X axis
55		"fBodyAccJerk-std()-Y"			Standard deviation of the body linear acceleration frequency domain derived in time for the Y axis
56		"fBodyAccJerk-std()-Z"			Standard deviation of the body linear acceleration frequency domain derived in time for the Z axis
57		"fBodyAccJerk-meanFreq()-X"		Weighted average of the frequency components to obtain a mean frequency of the body linear acceleration frequency domain derived in time for the X axis
58		"fBodyAccJerk-meanFreq()-Y"		Weighted average of the frequency components to obtain a mean frequency of the body linear acceleration frequency domain derived in time for the Y axis
59		"fBodyAccJerk-meanFreq()-Z"		Weighted average of the frequency components to obtain a mean frequency of the body linear acceleration frequency domain derived in time for the Z axis
60		"fBodyGyro-mean()-X"			Mean of the gyroscope frequency domain signal for the X axis
61		"fBodyGyro-mean()-Y"			Mean of the gyroscope frequency domain signal for the Y axis
62		"fBodyGyro-mean()-Z"			Mean of the gyroscope frequency domain signal for the Z axis
63		"fBodyGyro-std()-X"			Standard deviation of the gyroscope frequency domain signal for the X axis
64		"fBodyGyro-std()-Y"			Standard deviation of the gyroscope frequency domain signal for the Y axis
65		"fBodyGyro-std()-Z"			Standard deviation of the gyroscope frequency domain signal for the Z axis
66		"fBodyGyro-meanFreq()-X"		Weighted average of the frequency components to obtain a mean frequency of the gyroscope frequency domain signal for the X axis
67		"fBodyGyro-meanFreq()-Y"		Weighted average of the frequency components to obtain a mean frequency of the gyroscope frequency domain signal for the Y axis
68		"fBodyGyro-meanFreq()-Z"		Weighted average of the frequency components to obtain a mean frequency of the gyroscope frequency domain signal for the Z axis
69		"fBodyAccMag-mean()"			Mean of the magnitude of the 3-dimensional frequency domain signal for body acceleration
70		"fBodyAccMag-std()"			Standard deviation of the magnitude of the 3-dimensional frequency domain signal for body acceleration
71		"fBodyAccMag-meanFreq()"		Weighted average of the frequency components to obtain a mean frequency of the magnitude of the 3-dimensional frequency domain signal for body acceleration
72		"fBodyBodyAccJerkMag-mean()"		Mean of the magnitude of the 3-dimensional frequency domain signal for body linear acceleration derived in time
73		"fBodyBodyAccJerkMag-std()"		Standard deviation of the magnitude of the 3-dimensional frequency domain signal for body linear acceleration derived in time
74		"fBodyBodyAccJerkMag-meanFreq()"	Weighted average of the frequency coponents to obtain a mean frequency of the magnitude of the 3-dimensional frequency domain signal for body linear acceleration derived in time
75		"fBodyBodyGyroMag-mean()"		Mean of the magnitude of the 3-dimensional frequency domain signal for the gyroscope signal
76		"fBodyBodyGyroMag-std()"		Standard deviation of the magnitude of the 3-dimensional frequency domain signal for the gyroscope signal
77		"fBodyBodyGyroMag-meanFreq()"		Weighted average of the frequency components to obtain a mean frequency of the magnitude of the 3-dimensional frequency domain signal for the gyroscope signal
78		"fBodyBodyGyroJerkMag-mean()"		Mean of the magnitude of the 3-dimensional frequency domain signal for angular velocity derived in time
79		"fBodyBodyGyroJerkMag-std()"		Standard deviation of the magnitude of the 3-dimensional frequency domain signal for angular velocity derived in time
80		"fBodyBodyGyroJerkMag-meanFreq()"	Weighted average of the frequency components to obtain a mean frequency of the magnitude of the 3-dimensional frequency domain signal for angular velocity derived in time
81		"angle(tBodyAccMean,gravity)"		Angle between the average body acceleration signals in the signal window and the gravity acceleration signal
82		"angle(tBodyAccJerkMean),gravityMean)"	Angle between the average body acceleration signals in the signal window for body linear acceleration derived in time and gravity signals
83		"angle(tBodyGyroMean,gravityMean)"	Angle between the average body acceleration signals in the signal window for gyroscope signals and the gravity signals
84		"angle(tBodyGyroJerkMean,gravityMean)"	Angle between the average body acceleration signals in the signal window for angular velocity derived in time and gravity signals 
85		"angle(X,gravityMean)"			Angle between the X axis and the average gravity signals in the signal window
86		"angle(Y,gravityMean)"			Angle between the Y axis and the average gravity signals in the signal window
87		"angle(Z,gravityMean)"			Angle between the Z axis and the average gravity signals in the signal window
88		"Activity"				The code for the activity the subject was doing
89		"Activity.name"				The name of the activity that corresponds to the code in "Activity"


"sum.data"

Column Number	Column Name				Description
1		Subject					ID number from the "all.data" file
2		Activity				The description of the activity that was being performed.
3		"tBodyAcc-mean()-X"			Mean body acceleration signal for the X axis
4		"tBodyAcc-mean()-Y"			Mean body acceleration signal for the Y axis
5		"tBodyAcc-mean()-Z"			Mean body acceleration signal for the Z axis
6		"tBodyAcc-std()-X"			Standard deviation of the body acceleration signal for the X axis
7		"tBodyAcc-std()-Y"			Standard deviation of the body acceleration signal for the Y axis
8		"tBodyAcc-std()-Z"			Standard deviation of the body acceleration signal for the Z axis
9		"tGravityAcc-mean()-X"			Mean gravity acceleration signal for the X axis
10		"tGravityAcc-mean()-Y"			Mean gravity acceleration signal for the Y axis
11		"tGravityAcc-mean()-Z"			Mean gravity acceleration signal for the Z axis
12		"tGravityAcc-std()-X"			Standard deviation of the gravity acceleration signal for the X axis
13		"tGravityAcc-std()-Y"			Standard deviation of the gravity acceleration signal for the Y axis
14		"tGravityAcc-std()-Z"			Standard deviation of the gravity acceleration signal for the Z axis
15		"tBodyAccJerk-mean()-X"			Mean of the body linear acceleration derived in time for the X axis
16		"tBodyAccJerk-mean()-Y"			Mean of the body linear acceleration derived in time for the Y axis
17		"tBodyAccJerk-mean()-Z"			Mean of the body linear acceleration derived in time for the Z axis
18		"tBodyAccJerk-std()-X"			Standard deviation of the body linear acceleration derived in time for the X axis
19		"tBodyAccJerk-std()-Y"			Standard deviation of the body linear acceleration derived in time for the Y axis
20		"tBodyAccJerk-std()-Z"			Standard deviation of the body linear acceleration derived in time for the Z axis
21		"tBodyGyro-mean()-X"			Mean of the gyroscope signal for the X axis
22		"tBodyGyro-mean()-Y"			Mean of the gyroscope signal for the Y axis
23		"tBodyGyro-mean()-Z"			Mean of the gyroscope signal for the Z axis
24		"tBodyGyro-std()-X"			Standard deviation of the gyroscope signal for the X axis
25		"tBodyGyro-std()-Y"			Standard deviation of the gyroscope signal for the Y axis
26		"tBodyGyro-std()-Z"			Standard deviation of the gyroscope signal for the Z axis
27		"tBodyGyroJerk-mean()-X"		Mean of the angular velocity derived in time for the X axis
28		"tBodyGyroJerk-mean()-Y"		Mean of the angular velocity derived in time for the Y axis
29		"tBodyGyroJerk-mean()-Z"		Mean of the angular velocity derived in time for the Z axis
30		"tBodyGyroJerk-std()-X"			Standard deviation of the angular velocity derived in time for the X axis
31		"tBodyGyroJerk-std()-Y"			Standard deviation of the angular velocity derived in time for the Y axis
32		"tBodyGyroJerk-std()-Z"			Standard deviation of the angular velocity derived in time for the Z axis
33		"tBodyAccMag-mean()"			Mean of the magnitude of the 3-dimensional signal for body acceleration
34		"tBodyAccMag-std()"			Standard deviation of the magnitude of the 3-dimensional signal for body acceleration
35		"tGravityAccMag-mean()"			Mean of the magnitude of the 3-dimensional signal for gravity acceleration
36		"tGravityAccMag-std()"			Standard deviation of the magnitude of the 3-dimensional signal for gravity acceleration
37		"tBodyAccJerkMag-mean()"		Mean of the magnitude of the 3-dimensional signal for body linear acceleration derived in time
38		"tBodyAccJerkMag-std()"			Standard deviation of the magnitude of the 3-dimensional signal for body linear acceleration derived in time
39		"tBodyGyroMag-mean()"			Mean of the magnitude of the 3-dimensional signal for the gyroscope signal
40		"tBodyGyroMag-std()"			Standard deviation of the magnitude of the 3-dimensional signal for gyroscope signal
41		"tBodyGyroJerkMag-mean()"		Mean of the magnitude of the 3-dimensional signal for angular velocity derived in time
42		"tBodyGyroJerkMag-std()"		Standard deviation of the magnitude of the 3-dimensional signal for angular velocity derived in time
43		"fBodyAcc-mean()-X"			Mean body acceleration frequency domain signal for the X axis
44		"fBodyAcc-mean()-Y"			Mean body acceleration frequency domain signal for the Y axis
45		"fBodyAcc-mean()-Z"			Mean body acceleration frequency domain signal for the Z axis
46		"fBodyAcc-std()-X"			Standard deviation of the body acceleration frequency domain signal for the X axis
47		"fBodyAcc-std()-Y"			Standard deviation of the body acceleration frequency domain signal for the Y axis
48		"fBodyAcc-std()-Z"			Standard deviation of the body acceleration frequency domain signal for the Z axis
49		"fBodyAcc-meanFreq()-X"			Weighted average of the frequency components to obtain a mean frequency of the body acceleration frequency domain signal for the X axis.
50		"fBodyAcc-meanFreq()-Y"			Weighted average of the frequency components to obtain a mean frequency of the body acceleration frequency domain signal for the Y axis.
51		"fBodyAcc-meanFreq()-Z"			Weighted average of the frequency components to obtain a mean frequency of the body acceleration frequency domain signal for the Z axis.
52		"fBodyAccJerk-mean()-X"			Mean of the body linear acceleration frequency domain derived in time for the X axis
53		"fBodyAccJerk-mean()-Y"			Mean of the body linear acceleration frequency domain derived in time for the Y axis
54		"fBodyAccJerk-mean()-Z"			Mean of the body linear acceleration frequency domain derived in time for the Z axis
55		"fBodyAccJerk-std()-X"			Standard deviation of the body linear acceleration frequency domain derived in time for the X axis
56		"fBodyAccJerk-std()-Y"			Standard deviation of the body linear acceleration frequency domain derived in time for the Y axis
57		"fBodyAccJerk-std()-Z"			Standard deviation of the body linear acceleration frequency domain derived in time for the Z axis
58		"fBodyAccJerk-meanFreq()-X"		Weighted average of the frequency components to obtain a mean frequency of the body linear acceleration frequency domain derived in time for the X axis
59		"fBodyAccJerk-meanFreq()-Y"		Weighted average of the frequency components to obtain a mean frequency of the body linear acceleration frequency domain derived in time for the Y axis
60		"fBodyAccJerk-meanFreq()-Z"		Weighted average of the frequency components to obtain a mean frequency of the body linear acceleration frequency domain derived in time for the Z axis
61		"fBodyGyro-mean()-X"			Mean of the gyroscope frequency domain signal for the X axis
62		"fBodyGyro-mean()-Y"			Mean of the gyroscope frequency domain signal for the Y axis
63		"fBodyGyro-mean()-Z"			Mean of the gyroscope frequency domain signal for the Z axis
64		"fBodyGyro-std()-X"			Standard deviation of the gyroscope frequency domain signal for the X axis
65		"fBodyGyro-std()-Y"			Standard deviation of the gyroscope frequency domain signal for the Y axis
66		"fBodyGyro-std()-Z"			Standard deviation of the gyroscope frequency domain signal for the Z axis
67		"fBodyGyro-meanFreq()-X"		Weighted average of the frequency components to obtain a mean frequency of the gyroscope frequency domain signal for the X axis
68		"fBodyGyro-meanFreq()-Y"		Weighted average of the frequency components to obtain a mean frequency of the gyroscope frequency domain signal for the Y axis
69		"fBodyGyro-meanFreq()-Z"		Weighted average of the frequency components to obtain a mean frequency of the gyroscope frequency domain signal for the Z axis
70		"fBodyAccMag-mean()"			Mean of the magnitude of the 3-dimensional frequency domain signal for body acceleration
71		"fBodyAccMag-std()"			Standard deviation of the magnitude of the 3-dimensional frequency domain signal for body acceleration
72		"fBodyAccMag-meanFreq()"		Weighted average of the frequency components to obtain a mean frequency of the magnitude of the 3-dimensional frequency domain signal for body acceleration
73		"fBodyBodyAccJerkMag-mean()"		Mean of the magnitude of the 3-dimensional frequency domain signal for body linear acceleration derived in time
74		"fBodyBodyAccJerkMag-std()"		Standard deviation of the magnitude of the 3-dimensional frequency domain signal for body linear acceleration derived in time
75		"fBodyBodyAccJerkMag-meanFreq()"	Weighted average of the frequency coponents to obtain a mean frequency of the magnitude of the 3-dimensional frequency domain signal for body linear acceleration derived in time
76		"fBodyBodyGyroMag-mean()"		Mean of the magnitude of the 3-dimensional frequency domain signal for the gyroscope signal
77		"fBodyBodyGyroMag-std()"		Standard deviation of the magnitude of the 3-dimensional frequency domain signal for the gyroscope signal
78		"fBodyBodyGyroMag-meanFreq()"		Weighted average of the frequency components to obtain a mean frequency of the magnitude of the 3-dimensional frequency domain signal for the gyroscope signal
79		"fBodyBodyGyroJerkMag-mean()"		Mean of the magnitude of the 3-dimensional frequency domain signal for angular velocity derived in time
80		"fBodyBodyGyroJerkMag-std()"		Standard deviation of the magnitude of the 3-dimensional frequency domain signal for angular velocity derived in time
81		"fBodyBodyGyroJerkMag-meanFreq()"	Weighted average of the frequency components to obtain a mean frequency of the magnitude of the 3-dimensional frequency domain signal for angular velocity derived in time
82		"angle(tBodyAccMean,gravity)"		Angle between the average body acceleration signals in the signal window and the gravity acceleration signal
83		"angle(tBodyAccJerkMean),gravityMean)"	Angle between the average body acceleration signals in the signal window for body linear acceleration derived in time and gravity signals
84		"angle(tBodyGyroMean,gravityMean)"	Angle between the average body acceleration signals in the signal window for gyroscope signals and the gravity signals
85		"angle(tBodyGyroJerkMean,gravityMean)"	Angle between the average body acceleration signals in the signal window for angular velocity derived in time and gravity signals 
86		"angle(X,gravityMean)"			Angle between the X axis and the average gravity signals in the signal window
87		"angle(Y,gravityMean)"			Angle between the Y axis and the average gravity signals in the signal window
88		"angle(Z,gravityMean)"			Angle between the Z axis and the average gravity signals in the signal window
