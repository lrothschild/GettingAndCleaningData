library(dplyr)
# Read in X_train.txt and X_test.txt as dplyr tables with 561 columns
file_tr<-"UCI HAR Dataset/train/X_train.txt"
file_ts<-"UCI HAR Dataset/test/X_test.txt"
tr<-tbl_df(read.fwf(file_tr,widths=rep(c(16),561)))
ts<-tbl_df(read.fwf(file_ts,widths=rep(c(16),561)))
#rbind the files with tr on top, remove tr,ts
tr_ts<-bind_rows(tr,ts)
rm(tr,ts)
##eliminate the rows of frequency calculations
tr_ts<-select(tr_ts,V1:V265)
# Read in the first 265 columns of the file features.txt,make into vector
ffile<-"UCI HAR Dataset/features.txt"
features=readLines(ffile)
features<-unlist(features)
features<-features[1:265]
#remove "()" and number from each feature
features<-unlist(lapply(features,rmv<-function(x)gsub('\\(\\)',"",x)))
features<-unlist(lapply(features,rmvNum<-function(x) sub('.* ',"",x)))
#add features as column names to tr_ts
colnames(tr_ts)<-features
tr_ts<-tbl_df(tr_ts)
rm(features,ffile)
#form data table of columns with names containing "mean"
measMean<-select(tr_ts,contains("mean"))
#form data table of columns with names containing "std"
measStd<-select(tr_ts,contains("std"))
##cbind the two data tables, call it "meas"
meas<-tbl_df(bind_cols(measMean,measStd))
rm(measMean,measStd,tr_ts)
# We need to add the activity and subject columns
# Read in activity column
act_tr<-tbl_df(read.fwf("UCI HAR Dataset/train/y_train.txt",widths=1,col.names="Activity"))
act_ts<-tbl_df(read.fwf("UCI HAR Dataset/test/y_test.txt",widths=1,col.names="Activity"))
#rbind train and test files and delete them
act<-bind_rows(act_tr,act_ts)
rm(act_tr,act_ts)
# Read in subject column, train and test
file_tr<-"UCI HAR Dataset/train/subject_train.txt"
file_ts<-"UCI HAR Dataset/test/subject_test.txt"
sub_tr<-tbl_df(read.delim(file_tr,header=FALSE,col.names="Subj"))
sub_ts<-tbl_df(read.delim(file_ts,header=FALSE,col.names="Subj"))
rbind train and test files, then delete them
sub<-bind_rows(sub_tr,sub_ts)
rm(file_tr,file_ts,sub_tr,sub_ts)
# Replace the numbers by their names in the Activity table
# First step is to define a function to convert each number from 1 to 6 to an activity
num_to_act<-function(N){
        if (N==1) {x <-"WALKING"}
        else if  (N==2) {x<-"WALKING_UPSTAIRS"}
        else if  (N==3) {x<-"WALKING_DOWNSTAIRS"}
        else if  (N==4) {x<-"SITTING"}
        else if  (N==5) {x<-"STANDING"}
        else {x<-"LAYING"}
        return(x)
}
#Replace numbers in Activity table using lapply with num_to_act to use names
act<-mutate(act,Activity=unlist(lapply(Activity,num_to_act)))
#cbind the data tables "sub","act" and "meas" in that order and call it
#"Measurements"  This completes Step 4 of the Project
Measurements<-tbl_df(bind_cols(sub,act,meas))
rm(meas,sub,act,num_to_act,rmv,rmvNum)
##Find the average of all the measurements grouped by Subject and Activity
## using summarise_each.  Call the table "MeasurementSummary"  This completes Step 5.
MeasurementSummary<-Measurements %>% group_by(Subj,Activity)%>% 
        summarise_each(funs(mean))


