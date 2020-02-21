
# reading all the files into R

training_data <- read.table("C:/Users/shubhayush/Documents/coursera/data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
test_data <- read.table("C:/Users/shubhayush/Documents/coursera/data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
variable_names <- read.table("C:/Users/shubhayush/Documents/coursera/data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")
training_activity_codes <- read.table("C:/Users/shubhayush/Documents/coursera/data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
test_activity_codes <- read.table("C:/Users/shubhayush/Documents/coursera/data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
activity_names <- read.table("C:/Users/shubhayush/Documents/coursera/data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")
subject_train <- read.table("C:/Users/shubhayush/Documents/coursera/data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("C:/Users/shubhayush/Documents/coursera/data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")

# giving the column names to the training and test-data as per the variable_names
variable_names_select <- variable_names[,2] 
activity_labels <- activity_names[,2]
colnames(training_data) <- variable_names_select
colnames(test_data) <- variable_names_select
colnames(training_activity_codes)<-"activitylabel"
colnames(test_activity_codes)<-"activitylabel"

# collecting and sorting the columns with mean and standard deviation
ColstoSelect <- sort(c(grep("mean",variable_names[,2]),grep("std",variable_names[,2])))

# creating a column with activity names  
training_activity_codes$activitylabel[training_activity_codes$activitylabel==1]<-"walking"
training_activity_codes$activitylabel[training_activity_codes$activitylabel==2]<-"walkingUpstairs"
training_activity_codes$activitylabel[training_activity_codes$activitylabel==3]<-"walkingDownstairs"
training_activity_codes$activitylabel[training_activity_codes$activitylabel==4]<-"sitting"
training_activity_codes$activitylabel[training_activity_codes$activitylabel==5]<-"standing"
training_activity_codes$activitylabel[training_activity_codes$activitylabel==6]<-"laying"

test_activity_codes$activitylabel[test_activity_codes$activitylabel==1]<-"walking"
test_activity_codes$activitylabel[test_activity_codes$activitylabel==2]<-"walkingUpstairs"
test_activity_codes$activitylabel[test_activity_codes$activitylabel==3]<-"walkingDownstairs"
test_activity_codes$activitylabel[test_activity_codes$activitylabel==4]<-"sitting"
test_activity_codes$activitylabel[test_activity_codes$activitylabel==5]<-"standing"
test_activity_codes$activitylabel[test_activity_codes$activitylabel==6]<-"laying"

# adding columns of the person/subject who took part in the activity and type of activity

training_data <- cbind(subject_train,training_activity_codes$activitylabel,training_data)
test_data <- cbind(subject_test,test_activity_codes$activitylabel,test_data)

# selecting columns pertaining to mean and standard devaiation to the dataset
training_data_select <- training_data[,c(1,2,(ColstoSelect)+2)]
test_data_select <- test_data[,c(1,2,(ColstoSelect)+2)]
colnames(training_data_select)[1:2]<- c("subjectId","activity")
colnames(test_data_select)[1:2]<- c("subjectId","activity")

# merging the train and  test data. Herein train and test  subjects can be identified   
library(dplyr)
training_data_select <- mutate(training_data_select,datatype = "train")
test_data_select <- mutate(test_data_select,datatype = "test")
final_data <- merge(training_data_select,test_data_select,all= TRUE)
final_data <- arrange(final_data,subjectId)

# finding mean as persubject and activity
final_data1 <- select(final_data,-datatype)
final_mean <- group_by(final_data1,subjectId,activity)
final_means <- summarise_at(final_mean,vars(-group_cols()),mean)

write.table(final_means,"Samsung_mean_data_MSP.txt",row.names = FALSE)






