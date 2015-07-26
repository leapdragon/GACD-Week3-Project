## run_analysis.R — Manipulations and Codebook

run_analysis.R is a script for cleaning up and performing several manipulations on the following dataset:

*Human Activity Recognition Using Smartphones Dataset<br />
Version 1.0<br />
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip*

The manipulations in question are:

1. Unifying the "test" and "train" datasets
2. Reducing the dataset to contain only mean and standard deviation data
3. Creating textual labels for activities represented
4. Adding column names for the preserved data in the combined dataset
5. Creating a secondary dataset that summarizes the data (as a mean) on a per-subject, per-activity, per-variable basis
6. Outputting both the combined dataset and the final required dataset ("Step 5") in a tidy format with labels preserved and a space separator

**Input/Execution Conditions**

The script requires the following in order to run and complete successfully:

1. Data set downloaded and unzipped into a single directory preserving the structure in the original ZIP file
2. Current working directory in R set to this directory
3. "plyr" and "reshape2" libraries installed and available for loading via library()

**Output Generated**

The script creates two files upon exit:

1. Mean_and_Std_Summary.txt — The final tidy dataset of means, showing mean values for each combination of subject, activity, and variable
2. Mean_and_Std_Complete.txt — The intermediate (combined) dataset, with human-readable labels affixed

## Data Format: Mean_and_Std_Summary.txt

This is the final "TIDY" dataset (required in "Step 5") showing the MEAN value of all MEAN or STANDARD DEVIATION measurements for a given subject, activity, and variable. It has the following columns:

- **"Subject" (column 1):** The unique subject (identified by an integer) that generated the data
- **"Activity" (column 2):** The activity in which the subject was engaged for the supplied variable, using the human-readable values in activity_labels.txt (in original ZIP)
- **"Variable" (column 3):** The variable for which the mean has been calculated (refer to variable names below for meanings and mappings to features.txt)
- **"MeanValue" (column 4):** The mean value for all measurements in the test and train datasets for this subject, activity, and variable (note that in some cases, this means that the value is a mean of means, e.g. for TimeBodyAccelerationMeanX, this value is the mean of *each* of potentially many TimeBodyAccelerationMeanX values for a given subject and activity)

The file is sorted first by subject and then by activity.

THE MEANINGS OF EACH VARIABLE ARE OUTLINED BELOW. NOTE THAT ALL INPUT DATA IS NORMALIZED WITH RANGE [-1,1] MEANING THAT THEY ARE UNITLESS:

Variable Name | Original Variable (features.txt) | Description 
------------- | ------------- | ------------- 
TimeBodyAccelerationMeanX | tBodyAcc-mean()-X | Body Acceleration Mean for the X axis (Time Domain)
TimeBodyAccelerationMeanY | tBodyAcc-mean()-Y | Body Acceleration Mean for the Y Axis (Time Domain)
TimeBodyAccelerationMeanZ | tBodyAcc-mean()-Z | Body Acceleration Mean for the Z axis (Time Domain)
TimeBodyAccelerationStdDeviationX | tBodyAcc-std()-X | Body Acceleration Standard Deviation for the X axis (Time Domain)
TimeBodyAccelerationStdDeviationY | tBodyAcc-std()-Y | Body Acceleration Standard Deviation for the Y Axis (Time Domain)
TimeBodyAccelerationStdDeviationZ | tBodyAcc-std()-Z | Body Acceleration Standard Deviation for the Z axis (Time Domain)
TimeGravityAccelerationMeanX | tGravityAcc-mean()-X | Gravity Acceleration Mean for the X axis (Time Domain)
TimeGravityAccelerationMeanY | tGravityAcc-mean()-Y | Gravity Acceleration Mean for the Y Axis (Time Domain)
TimeGravityAccelerationMeanZ | tGravityAcc-mean()-Z | Gravity Acceleration Mean for the Z axis (Time Domain)
TimeGravityAccelerationStdDeviationX | tGravityAcc-std()-X | Gravity Acceleration Standard Deviation for the X axis (Time Domain)
TimeGravityAccelerationStdDeviationY | tGravityAcc-std()-Y | Gravity Acceleration Standard Deviation for the Y Axis (Time Domain)
TimeGravityAccelerationStdDeviationZ | tGravityAcc-std()-Z | Gravity Acceleration Standard Deviation for the Z axis (Time Domain)
TimeBodyAccelerationJerkMeanX | tBodyAccJerk-mean()-X | Body Acceleration Jerk Mean for the X axis (Time Domain)
TimeBodyAccelerationJerkMeanY | tBodyAccJerk-mean()-Y | Body Acceleration Jerk Mean for the Y Axis (Time Domain)
TimeBodyAccelerationJerkMeanZ | tBodyAccJerk-mean()-Z | Body Acceleration Jerk Mean for the Z axis (Time Domain)
TimeBodyAccelerationJerkStdDeviationX | tBodyAccJerk-std()-X | Body Acceleration Jerk Standard Deviation for the X axis (Time Domain)
TimeBodyAccelerationJerkStdDeviationY | tBodyAccJerk-std()-Y | Body Acceleration Jerk Standard Deviation for the Y Axis (Time Domain)
TimeBodyAccelerationJerkStdDeviationZ | tBodyAccJerk-std()-Z | Body Acceleration Jerk Standard Deviation for the Z axis (Time Domain)
TimeBodyGyroscopeMeanX | tBodyGyro-mean()-X | Body Gyroscope Mean for the X axis (Time Domain)
TimeBodyGyroscopeMeanY | tBodyGyro-mean()-Y | Body Gyroscope Mean for the Y Axis (Time Domain)
TimeBodyGyroscopeMeanZ | tBodyGyro-mean()-Z | Body Gyroscope Mean for the Z axis (Time Domain)
TimeBodyGyroscopeStdDeviationX | tBodyGyro-std()-X | Body Gyroscope Standard Deviation for the X axis (Time Domain)
TimeBodyGyroscopeStdDeviationY | tBodyGyro-std()-Y | Body Gyroscope Standard Deviation for the Y Axis (Time Domain)
TimeBodyGyroscopeStdDeviationZ | tBodyGyro-std()-Z | Body Gyroscope Standard Deviation for the Z axis (Time Domain)
TimeBodyGyroscopeJerkMeanX | tBodyGyroJerk-mean()-X | Body Gyroscope Jerk Mean for the X axis (Time Domain)
TimeBodyGyroscopeJerkMeanY | tBodyGyroJerk-mean()-Y | Body Gyroscope Jerk Mean for the Y Axis (Time Domain)
TimeBodyGyroscopeJerkMeanZ | tBodyGyroJerk-mean()-Z | Body Gyroscope Jerk Mean for the Z axis (Time Domain)
TimeBodyGyroscopeJerkStdDeviationX | tBodyGyroJerk-std()-X | Body Gyroscope Jerk Standard Deviation for the X axis (Time Domain)
TimeBodyGyroscopeJerkStdDeviationY | tBodyGyroJerk-std()-Y | Body Gyroscope Jerk Standard Deviation for the Y Axis (Time Domain)
TimeBodyGyroscopeJerkStdDeviationZ | tBodyGyroJerk-std()-Z | Body Gyroscope Jerk Standard Deviation for the Z axis (Time Domain)
TimeBodyAccelerationMagnitudeMean | tBodyAccMag-mean() | Body Acceleration Magnitude Mean (Time Domain)
TimeBodyAccelerationMagnitudeStdDeviation | tBodyAccMag-std() | Body Acceleration Magnitude Standard Deviation (Time Domain)
TimeGravityAccelerationMagnitudeMean | tGravityAccMag-mean() | Gravity Acceleration Magnitude Mean (Time Domain)
TimeGravityAccelerationMagnitudeStdDeviation | tGravityAccMag-std() | Gravity Acceleration Magnitude Standard Deviation (Time Domain)
TimeBodyAccelerationJerkMagnitudeMean | tBodyAccJerkMag-mean() | Body Acceleration Jerk Magnitude Mean (Time Domain)
TimeBodyAccelerationJerkMagnitudeStdDeviation | tBodyAccJerkMag-std() | Body Acceleration Jerk Magnitude Standard Deviation (Time Domain)
TimeBodyGyroscopeMagnitudeMean | tBodyGyroMag-mean() | Body Gyroscope Magnitude Mean (Time Domain)
TimeBodyGyroscopeMagnitudeStdDeviation | tBodyGyroMag-std() | Body Gyroscope Magnitude Standard Deviation (Time Domain)
TimeBodyGyroscopeJerkMagnitudeMean | tBodyGyroJerkMag-mean() | Body Gyroscope Jerk Magnitude Mean (Time Domain)
TimeBodyGyroscopeJerkMagnitudeStdDeviation | tBodyGyroJerkMag-std() | Body Gyroscope Jerk Magnitude Standard Deviation (Time Domain)
FrequencyBodyAccelerationMeanX | fBodyAcc-mean()-X | Body Acceleration Mean for the X axis (Frequency Domain)
FrequencyBodyAccelerationMeanY | fBodyAcc-mean()-Y | Body Acceleration Mean for the Y Axis (Frequency Domain)
FrequencyBodyAccelerationMeanZ | fBodyAcc-mean()-Z | Body Acceleration Mean for the Z axis (Frequency Domain)
FrequencyBodyAccelerationStdDeviationX | fBodyAcc-std()-X | Body Acceleration Standard Deviation for the X axis (Frequency Domain)
FrequencyBodyAccelerationStdDeviationY | fBodyAcc-std()-Y | Body Acceleration Standard Deviation for the Y Axis (Frequency Domain)
FrequencyBodyAccelerationStdDeviationZ | fBodyAcc-std()-Z | Body Acceleration Standard Deviation for the Z axis (Frequency Domain)
FrequencyBodyAccelerationJerkMeanX | fBodyAccJerk-mean()-X | Body Acceleration Jerk Mean for the X axis (Frequency Domain)
FrequencyBodyAccelerationJerkMeanY | fBodyAccJerk-mean()-Y | Body Acceleration Jerk Mean for the Y Axis (Frequency Domain)
FrequencyBodyAccelerationJerkMeanZ | fBodyAccJerk-mean()-Z | Body Acceleration Jerk Mean for the Z axis (Frequency Domain)
FrequencyBodyAccelerationJerkStdDeviationX | fBodyAccJerk-std()-X | Body Acceleration Jerk Standard Deviation for the X axis (Frequency Domain)
FrequencyBodyAccelerationJerkStdDeviationY | fBodyAccJerk-std()-Y | Body Acceleration Jerk Standard Deviation for the Y Axis (Frequency Domain)
FrequencyBodyAccelerationJerkStdDeviationZ | fBodyAccJerk-std()-Z | Body Acceleration Jerk Standard Deviation for the Z axis (Frequency Domain)
FrequencyBodyGyroscopeMeanX | fBodyGyro-mean()-X | Body Gyroscope Mean for the X axis (Frequency Domain)
FrequencyBodyGyroscopeMeanY | fBodyGyro-mean()-Y | Body Gyroscope Mean for the Y Axis (Frequency Domain)
FrequencyBodyGyroscopeMeanZ | fBodyGyro-mean()-Z | Body Gyroscope Mean for the Z axis (Frequency Domain)
FrequencyBodyGyroscopeStdDeviationX | fBodyGyro-std()-X | Body Gyroscope Standard Deviation for the X axis (Frequency Domain)
FrequencyBodyGyroscopeStdDeviationY | fBodyGyro-std()-Y | Body Gyroscope Standard Deviation for the Y Axis (Frequency Domain)
FrequencyBodyGyroscopeStdDeviationZ | fBodyGyro-std()-Z | Body Gyroscope Standard Deviation for the Z axis (Frequency Domain)
FrequencyBodyAccelerationMagnitudeMean | fBodyAccMag-mean() | Body Acceleration Magnitude Mean (Frequency Domain)
FrequencyBodyAccelerationMagnitudeStdDeviation | fBodyAccMag-std() | Body Acceleration Magnitude Standard Deviation (Frequency Domain)
FrequencyBodyBodyAccelerationJerkMagnitudeMean | fBodyBodyAccJerkMag-mean() | Body Acceleration Jerk Magnitude Mean (Frequency Domain)
FrequencyBodyBodyAccelerationJerkMagnitudeStdDeviation | fBodyBodyAccJerkMag-std() | Body Acceleration Jerk Magnitude Standard Deviation (Frequency Domain)
FrequencyBodyBodyGyroscopeMagnitudeMean | fBodyBodyGyroMag-mean() | Body Body Gyroscope Magnitude Mean (Frequency Domain)
FrequencyBodyBodyGyroscopeMagnitudeStdDeviation | fBodyBodyGyroMag-std() | Body Body Gyroscope Magnitude Standard Deviation (Frequency Domain)
FrequencyBodyBodyGyroscopeJerkMagnitudeMean | fBodyBodyGyroJerkMag-mean() | Body Body Gyroscope Jerk Magnitude Mean (Frequency Domain)
FrequencyBodyBodyGyroscopeJerkMagnitudeStdDeviation | fBodyBodyGyroJerkMag-std() | Body Body Gyroscope Jerk Magnitude Standard Deviation (Frequency Domain)

## Data Format: Mean_and_Std_Complete.txt

This intermediate file is the raw data before means are calculated for each subject, activity, and variable. It has the following columns:

- **"Subject" (column 1):** The unique subject (identified by an integer) that generated the data
- **"Activity" (column 2):** The name of the activity in which the subject was engaged, using the human-readable values in activity_labels.txt (in original ZIP)
- **Variables (columns 3-66):** Mean and standard deviation data subsetted from the variables outlined in features.txt (in original ZIP), named and with meanings as outlined above.

## Data Manipulations Performed

This section describes the operation(s) performed in order to arrive at the output data sets.

**Mean_and_Std_Complete.txt**

1. The files "text/X_test.txt" and "train/X_train.txt" are read into R.
2. Subjects and activities are similarly read from "test/subject_text.txt" and "test/y_test.txt" and from "train/subject_train.txt" and "train/y_train.txt"
3. The data in "test/subject_test.txt" and "test/y_test.txt" are inserted as the first two columns in the test data set.
4. The data in "train/subject_train.txt" and "train/y_train.txt" are inserted as the first two columns in the train data set.
5. These two data sets are then concatenated into a single, larger frame.
6. The integer values in the Activities column (from "test/y_test.txt" and "train/y_train.txt") are replaced with their text equivalents from "activity_labels.txt".
7. Data column meanings in the raw data sets are read from "features.txt"
8. A subset of these columns is identified by matching the meanings in "features.txt" with the text strings "mean()" and "std()" (indicating means and standard deviations, respectively).
9. The "Subject," "Activity," and identified mean and standard deviation columns are used to compose a new data frame containing just subjects, activities, and mean and standard deviation data.
10. More "R-Friendly" column names are created from these strings by removing "-" and "()" characters, and by substituting longer words for abbreviations, then assigned to their respective columns.
11. The data is written with column names, without row names, and using space (" ") as a field separator to: ./Mean_and_Std_Complete.txt.

**Mean_and_Std_Summary.txt**

1. The data set created for "Mean_and_Std_Complete.txt" is "melted" using melt() with the values of "Subject" and "Activity" as identifiers.
2. This data is summarized with "ddply" using mean() to generate the lone data value column.
3. The columns in this new data set are set to be named "Subject" "Activity" "Variable" and "MeanValue".
4. The data is written with column names, without row names, and using space (" ") as a field separator to: ./Mean_and_Std_Summary.txt.

## Usability for Evolving Data

Because the script relies on "features.txt" and "activity_labels.txt" rather than on hard codings, it should function correctly given the following conditions:

- All files names and paths in the dataset remain stable.
- "features.txt" is up-to-date with respect to data.
- "activity_labels.txt" is up-to-date with respect to data.
- Any mean or standard deviation values continue to be listed in "features.txt" using "mean()" and "std()" respectively.
