# Getting and Cleaning Data Course - Coursera Project

Raw data for analysis  was obtained from Human Activity Recognition Dataset version 1.0. A group of enthusiasts didperformed experiments with a group of 30 volunteers within an age bracket of 19-48 years. Each volunteer/subject performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, they captured 3-axial linear acceleration and 3-axial angular velocity. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data; further dividing test and training data among different files. Our goal is to create a tidy data set which contains averages for mean and standard deviation mesurements for each volunteer's each activity.
##Required Datasets:  

- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt' and 'train/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.   
  
##Steps:  

* First we are creating complete datasets for training and test data by combining activity list and subject list with  corresponding measurement data of test and training seperately.
* This newly created datasets are properly labeled and then merged to get one big dataset called All_data.
* We are only interested in variables measuring mean or standard deviation of features. So next step is to find which columns are required for our analysis and removed all the other columns.
* Next step is to replaced activity labels with descriptive activity names and variable names with descriptive variable names.
* Lastly, we created a new dataset called Tidy_Data which contains All_data grouped according to subject and activity and then found average of each measurement specific for each Subject per activity.

Final result is available in Tidy_Data.txt
