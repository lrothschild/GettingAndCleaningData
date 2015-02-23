Code Book


The R script calculates two data tables: Measurements and Measurement_Summary.
Measurements simply puts together the data from the X-files with labels giving the
subject (number from 1 to 30) and the activity, for each record.
Measurement_Summary gives the average, for each subject and each activity, of the
categories recorded in the X-files. I have excluded the frequency data, which have been 
obtained via a Fourier transform.

Measurements and Measurement_Summary are obtained by the “run_analysis.R” script by the
following steps:

1. Read in “X_train.txt” and “X_test.tx” as dplyr tables, “tr” and “ts”, with 561 columns

2. Bind the files by row, with tr on top.  The resulting file is called tr_ts.

3. Retain only the first 256 columns, eliminating the frequency variables.

4. Read in the first 256 columns of the file “features.txt” into a vector “features”

5. Clean up “features” by eliminating the numbers and the annoying “()”

6. Add “features” as column names to “tr_ts”

7. Form a data table, “measMean”, of all columns from “tr_ts” with names containing "mean"

8. Form a data table, “measSD”, of all columns from “tr_ts” with names containing “std”

9. Bind the two data tables, “measMean” and “measSD” by column into table "meas”.

10. Read in activity columns “y_train.txt”, and “y_test.txt” and row bind as “act”

11. Define a function “num_to_act” to replace numbers by activity names

12. Use lapply with “num_to_act” to replace numbers in table “act”

12. Read in subject columns, train and test, and row bind them as “sub”

13. Column bind the tables "sub","act" and "meas" into final table “Measurements"

14. “MeasurementSummary” is created from “Measurements” using the dplyr function
    “summarise_each” with function “mean” and grouping by Subject and Activity.


Column Names:

Subj:  Number from 1 to 30 identifying the subject of each recording

Activity: Name of activity performed by subject during recording

The rest of the column names are taken from the original files with the initial numbers
and “()” removed. However, in “MeasurementSummary” the columns represent the average
over all the measurements for a given subject and activity.  The following explanation is copied from “features info.txt” included in the original files:

“The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.” 

“Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).” 

These are the column names used here:

tBodyAcc-mean-X

tBodyAcc-mean-Y

tBodyAcc-mean-Z

tGravityAcc-mean-X

tGravityAcc-mean-Y

tGravityAcc-mean-Z

tBodyAccJerk-mean-X

tBodyAccJerk-mean-Y

tBodyAccJerk-mean-Z

tBodyGyro-mean-X

tBodyGyro-mean-Y

tBodyGyro-mean-Z

tBodyGyroJerk-mean-X

tBodyGyroJerk-mean-Y

tBodyGyroJerk-mean-Z

tGravityAccMag-mean

tBodyAccJerkMag-mean

tBodyGyroMag-mean

tBodyGyroJerkMag-mean

tBodyAcc-std-X

tBodyAcc-std-Y

tBodyAcc-std-Z

“tGravityAcc-std-X

tGravityAcc-std-Y

tGravityAcc-std-Z

tBodyGyro-std-X

tBodyGyro-std-Y

tBodyGyro-std-Z

tBodyGyroJerk-std-X

tBodyGyroJerk-std-Y

tBodyGyroJerk-std-Z

tBodyAccMag-std

tGravityAccMag-std

tBodyAccJerkMag-std

tBodyGyroMag-std

tBodyGyroJerkMag-std








