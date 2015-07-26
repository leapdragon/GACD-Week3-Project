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
6. Outputting both the combined dataset and the secondary dataset in a tidy format with labels preserved and a space separator

**Input/Execution Conditions**

The script requires the following in order to run and complete successfully:

1. Data set downloaded and unzipped into a single directory preserving the structure in the original ZIP file
2. Current working directory in R set to this directory

**Output Generated**

The script creates two files upon exit:

1. Mean_and_Std_Complete.txt — The combined dataset, with human-readable labels affixed
2. Mean_and_Std_Summary.txt — The summary dataset, showing mean values for each combination of subject, activity, and variable

## Data Format: Mean_and_Std_Complete.txt

This file has the following columns:

- **"Subject" (column 1):** The unique subject (identified by an integer) that generated the data
- **"Activity" (column 2):** The name of the activity in which the subject was engaged, using the human-readable values in activity_labels.txt (in original ZIP)
- **Variables (columns 3-66):** Mean and standard deviation data subsetted from the variables outlined in features.txt (in original ZIP)

The variables in columns 3-66 share the following mappings to variables outlined in features.txt:

- **tBodyAccMeanX** -> tBodyAcc-mean()-X (in features.txt)
- **tBodyAccMeanY** -> tBodyAcc-mean()-Y (in features.txt)
- **tBodyAccMeanZ** -> tBodyAcc-mean()-Z (in features.txt)
- **tBodyAccStdX** -> tBodyAcc-std()-X (in features.txt)
- **tBodyAccStdY** -> tBodyAcc-std()-Y (in features.txt)
- **tBodyAccStdZ** -> tBodyAcc-std()-Z (in features.txt)
- **tGravityAccMeanX** -> tGravityAcc-mean()-X (in features.txt)
- **tGravityAccMeanY** -> tGravityAcc-mean()-Y (in features.txt)
- **tGravityAccMeanZ** -> tGravityAcc-mean()-Z (in features.txt)
- **tGravityAccStdX** -> tGravityAcc-std()-X (in features.txt)
- **tGravityAccStdY** -> tGravityAcc-std()-Y (in features.txt)
- **tGravityAccStdZ** -> tGravityAcc-std()-Z (in features.txt)
- **tBodyAccJerkMeanX** -> tBodyAccJerk-mean()-X (in features.txt)
- **tBodyAccJerkMeanY** -> tBodyAccJerk-mean()-Y (in features.txt)
- **tBodyAccJerkMeanZ** -> tBodyAccJerk-mean()-Z (in features.txt)
- **tBodyAccJerkStdX** -> tBodyAccJerk-std()-X (in features.txt)
- **tBodyAccJerkStdY** -> tBodyAccJerk-std()-Y (in features.txt)
- **tBodyAccJerkStdZ** -> tBodyAccJerk-std()-Z (in features.txt)
- **tBodyGyroMeanX** -> tBodyGyro-mean()-X (in features.txt)
- **tBodyGyroMeanY** -> tBodyGyro-mean()-Y (in features.txt)
- **tBodyGyroMeanZ** -> tBodyGyro-mean()-Z (in features.txt)
- **tBodyGyroStdX** -> tBodyGyro-std()-X (in features.txt)
- **tBodyGyroStdY** -> tBodyGyro-std()-Y (in features.txt)
- **tBodyGyroStdZ** -> tBodyGyro-std()-Z (in features.txt)
- **tBodyGyroJerkMeanX** -> tBodyGyroJerk-mean()-X (in features.txt)
- **tBodyGyroJerkMeanY** -> tBodyGyroJerk-mean()-Y (in features.txt)
- **tBodyGyroJerkMeanZ** -> tBodyGyroJerk-mean()-Z (in features.txt)
- **tBodyGyroJerkStdX** -> tBodyGyroJerk-std()-X (in features.txt)
- **tBodyGyroJerkStdY** -> tBodyGyroJerk-std()-Y (in features.txt)
- **tBodyGyroJerkStdZ** -> tBodyGyroJerk-std()-Z (in features.txt)
- **tBodyAccMagMean** -> tBodyAccMag-mean() (in features.txt)
- **tBodyAccMagStd** -> tBodyAccMag-std() (in features.txt)
- **tGravityAccMagMean** -> tGravityAccMag-mean() (in features.txt)
- **tGravityAccMagStd** -> tGravityAccMag-std() (in features.txt)
- **tBodyAccJerkMagMean** -> tBodyAccJerkMag-mean() (in features.txt)
- **tBodyAccJerkMagStd** -> tBodyAccJerkMag-std() (in features.txt)
- **tBodyGyroMagMean** -> tBodyGyroMag-mean() (in features.txt)
- **tBodyGyroMagStd** -> tBodyGyroMag-std() (in features.txt)
- **tBodyGyroJerkMagMean** -> tBodyGyroJerkMag-mean() (in features.txt)
- **tBodyGyroJerkMagStd** -> tBodyGyroJerkMag-std() (in features.txt)
- **fBodyAccMeanX** -> fBodyAcc-mean()-X (in features.txt)
- **fBodyAccMeanY** -> fBodyAcc-mean()-Y (in features.txt)
- **fBodyAccMeanZ** -> fBodyAcc-mean()-Z (in features.txt)
- **fBodyAccStdX** -> fBodyAcc-std()-X (in features.txt)
- **fBodyAccStdY** -> fBodyAcc-std()-Y (in features.txt)
- **fBodyAccStdZ** -> fBodyAcc-std()-Z (in features.txt)
- **fBodyAccJerkMeanX** -> fBodyAccJerk-mean()-X (in features.txt)
- **fBodyAccJerkMeanY** -> fBodyAccJerk-mean()-Y (in features.txt)
- **fBodyAccJerkMeanZ** -> fBodyAccJerk-mean()-Z (in features.txt)
- **fBodyAccJerkStdX** -> fBodyAccJerk-std()-X (in features.txt)
- **fBodyAccJerkStdY** -> fBodyAccJerk-std()-Y (in features.txt)
- **fBodyAccJerkStdZ** -> fBodyAccJerk-std()-Z (in features.txt)
- **fBodyGyroMeanX** -> fBodyGyro-mean()-X (in features.txt)
- **fBodyGyroMeanY** -> fBodyGyro-mean()-Y (in features.txt)
- **fBodyGyroMeanZ** -> fBodyGyro-mean()-Z (in features.txt)
- **fBodyGyroStdX** -> fBodyGyro-std()-X (in features.txt)
- **fBodyGyroStdY** -> fBodyGyro-std()-Y (in features.txt)
- **fBodyGyroStdZ** -> fBodyGyro-std()-Z (in features.txt)
- **fBodyAccMagMean** -> fBodyAccMag-mean() (in features.txt)
- **fBodyAccMagStd** -> fBodyAccMag-std() (in features.txt)
- **fBodyBodyAccJerkMagMean** -> fBodyBodyAccJerkMag-mean() (in features.txt)
- **fBodyBodyAccJerkMagStd** -> fBodyBodyAccJerkMag-std() (in features.txt)
- **fBodyBodyGyroMagMean** -> fBodyBodyGyroMag-mean() (in features.txt)
- **fBodyBodyGyroMagStd** -> fBodyBodyGyroMag-std() (in features.txt)
- **fBodyBodyGyroJerkMagMean** -> fBodyBodyGyroJerkMag-mean() (in features.txt)
- **fBodyBodyGyroJerkMagStd** -> fBodyBodyGyroJerkMag-std() (in features.txt)

## Data Format: Mean_and_Std_Summary.txt

This file has the following columns:

- **"Subject" (column 1):** The unique subject (identified by an integer) that generated the data
- **"Activity" (column 2):** The activity in which the subject was engaged for the supplied variable, using the human-readable values in activity_labels.txt (in original ZIP)
- **"Variable" (column 3):** The variable for which the mean has been calculated (refer to variable names above for mappings to features.txt)
- **"MeanValue" (column 4):** The mean value for all measurements in the test and train datasets for this subject, activity, and variable

The file is sorted first by subject and then by activity.

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
10. More "R-Friendly" column names are created from these strings by replacing "-" and "()" characters, then assigned to their respective columns.
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
