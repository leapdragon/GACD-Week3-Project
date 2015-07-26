####### INITIAL REQUIREMENT: Script must be run with setwd() to directory containing unzipped data

library(plyr)
library(reshape2)

####
####
#### FIRST TASK: STEPS 1-4
#### Generate a combined, cleaned data set containing only means and standard deviations
#### With readable, easily manipulatable activity and column names
####
#### Output is written to: Mean_and_Std_Complete.txt in cwd
####
####

# Load all the data

test.data <- read.csv( "test/X_test.txt", header = FALSE, sep = "" )
test.subjects <- read.csv( "test/subject_test.txt", header = FALSE )
test.activities <- read.csv( "test/y_test.txt", header = FALSE )
train.data <- read.csv( "train/X_train.txt", header = FALSE, sep = "" )
train.subjects <- read.csv( "train/subject_train.txt", header = FALSE )
train.activities <- read.csv( "train/y_train.txt", header = FALSE )

# Bind in the subject subject column (1) and the activity column (2)

test.complete <- cbind( test.subjects, test.activities, test.data )
train.complete <- cbind( train.subjects, train.activities, train.data )

# Combine the data sets

data.complete <- rbind( test.complete, train.complete )

# Set the first couple of column names

colnames( data.complete )[ 1 ] = "Subject"
colnames( data.complete )[ 2 ] = "Activity"

# Read in the (already descriptive) activity names

activities <- read.csv( "activity_labels.txt", sep = "", header = FALSE )
activities$V2 <- as.character( activities$V2 )

# Read in the (already descriptive) variable names

varnames <- read.csv( "features.txt", sep = "", header = FALSE )
varnames$V2 <- as.character( varnames$V2 )

# Extract only the columns for means and standard deviations

varnames.selected <- varnames[ grep( "mean\\(\\)|std\\(\\)", varnames$V2), ]
varnames.selected$V2 <- as.character( varnames.selected$V2 )

# Now, loop through the activities list and set the values in the combined data frame according to the list

for( a_index in 1:nrow( activities ) ) {
	data.complete$Activity[ data.complete$Activity == activities[ a_index, 1 ] ] <- activities$V2[ a_index ]
}

# Now just gather the columns for the means and standard deviations and add them to a new data set

data.new <- cbind( data.complete$Subject, data.complete$Activity )
colnames( data.new ) <- cbind( "Subject", "Activity" )

for( c_index in 1:nrow( varnames.selected ) ) {
	data.new <- cbind( data.new, data.complete[ as.numeric( varnames.selected$V1[ c_index ] ) + 2 ] )

	# We rename the columns as we add them, modifying names from features.txt to make them more "R-friendly"

	newname <- varnames.selected$V2[ c_index ]
	newname <- gsub( "std", "StdDeviation", newname )
	newname <- gsub( "mean", "Mean", newname )
	newname <- gsub( "-", "", newname )
	newname <- gsub( "\\(\\)", "", newname )
	newname <- gsub( "Acc", "Acceleration", newname )
	newname <- gsub( "Gyro", "Gyroscope", newname )
	newname <- gsub( "tBody", "TimeBody", newname )
	newname <- gsub( "fBody", "FrequencyBody", newname )
	newname <- gsub( "Mag", "Magnitude", newname )
	newname <- gsub( "tGravity", "TimeGravity", newname )
	colnames( data.new )[ c_index + 2 ] <- newname
}

# Now we write our first data file: merged test and train data, means and stddevs only, with descriptive
# activity and column names that are "R-friendly"

write.table(data.new, file = "Mean_and_Std_Complete.txt", row.names = FALSE )

# We now have our data file AND we have a frame called "data.new" containing the data set

####
####
#### SECOND TASK: STEP 5
#### Generate an independent, nicely-readable data set that summarizes (gives means of)
#### data by subject and activity
####
#### Output is written to: Mean_and_Std_Summary.txt in cwd
####
####

# First let's melt our data set so that we can get at, and present, the information quickly and efficiently

data.melted <- melt( data.new, id = c("Subject", "Activity" ) )

# Now, let's summarize the data set by variable, applying the mean to each one

data.summarized <- ddply( data.melted, c( "Subject", "Activity", "variable"), summarize, mean( value ) )

# Make some better column names

colnames( data.summarized ) <- c( "Subject", "Activity", "Variable", "MeanValue" )

# And now, format it more nicely (without quotes in final output) and sort it more nicely by subject

data.summarized$Subject <- as.numeric( data.summarized$Subject )
data.summarized <- arrange( data.summarized, Subject, Activity )

# And write our final result!

write.table( data.summarized, file = "Mean_and_Std_Summary.txt", row.names = FALSE )
