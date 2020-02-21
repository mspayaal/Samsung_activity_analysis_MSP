# Samsung_activity_analysis_MSP
It is a script for  analyzing the data of subjects in six activities while wearing Samsung Smartphone

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the experiment captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

The code run_analysis reads the data only for the values pertaining to mean and standard deviation for all readings, and merges the train and test subjects data. There are total 79 variables and 30 subjects. Each variable is measured over 6 activities - (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). The code has 9 sections:

1. Reading all the files into R which has the train and test data of subjects, variable names, activity codes etc.

2. Giving the column names to the training and test-data as per the variable_names

3. collecting and sorting the columns with mean and standard deviation from test and train data

4.  Adding a  a column with activity names  

5. Adding columns of the person/subject who took part in the activity and type of activity

6. selecting columns pertaining to mean and standard devaiation to the dataset

7.  Merging the train and  test data. Herein train and test  subjects can be identified   

8. Finding mean as per subject and activity

9.  writing output of tidy mean data to file "Samsung_mean_data_MSP.txt"


