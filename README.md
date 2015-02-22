# GettingAndCleaningData
Course project repo

The data in this project were obtained from the 
Human Activity Recognition Using Smartphones Dataset Version 1.0, posted at 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
The experiments were performed at the Smartlab-Non Linear Complex Systems Laboratory
Scientists:Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto
www.smartlab.ws

In these experiments 30 subjects performed 6 activities each, recorded 
multiple times. The embedded accelerometer and gyroscope in Samsung Galaxy S II
smartphones were used to record sensor signals, with 180 fixed-width sliding
windows for each person and activity every time it was recorded.The data was randomly
split into training and test sets, but these were combined in our analysis, and
this split plays no role in our data tables. Further information about the original
data and experiments is given in the ReadMe.txt included in the above download. 

In the data given here, we have used the X-train and X-test files, for which the
data in each record (originally 180 sliding windows) have already been processed
by mean and standard deviation calculations.  The frequency data, which were 
calculated through Fourier transform, have been omited from our analysis.  

The R script calculates two data tables: Measurements and Measurement_Summary.
Measurements simply puts together the data from the X-files with labels giving the
subject (number from 1 to 30) and the activity, for each record.
Measurement_Summary gives the average, for each subject and each activity, of the
categories recorded in the X-files.



