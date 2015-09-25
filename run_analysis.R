# To read activity labels and list of features
activity_labels <- read.table("activity_labels.txt")
colnames(activity_labels) <- c("ID", "activity")
features <- read.table("features.txt") 
colnames(features) <- c("ID","Feature")

#  To read volunteer identifier, training labels and the training set.
subject_train <- read.table("train/subject_train.txt")
X_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")

# To read volunteer identifier, test labels and the test set.
subject_test <- read.table("test/subject_test.txt")
y_test <- read.table("test/y_test.txt")
X_test <- read.table("test/X_test.txt")

# Creating test dataset combining subject_test,y_test and X_test
test <-  data.frame(subject_test,y_test,X_test)
colnames(test) <- c("subject","activity",features$ID)
# Creating train dataset combining subject_train,y_train and X_train
train <-  data.frame(subject_train,y_train,X_train)
colnames(train) <- c("subject","activity",features$ID)

# Merge test and train to All_data
All_data <- merge(train,test,all = TRUE)

# Remove all columns that are not needed
mean_id <- grep(pattern = "mean()", x = features$Feature,fixed = T)# Feature ID of mean()
sd_id <- grep(pattern = "std()", x = features$Feature,fixed = T)# Feature ID of std()
All_data <- All_data[,c("subject","activity",mean_id,sd_id)]# keeping measurements  on mean and standard deviation along with subject_ID and activity_ID

# Replacing activity labels with descriptive activity names.
for(i in 1:nrow(activity_labels))
{
  All_data$activity[All_data$activity == i] <- as.character(activity_labels$activity[activity_labels$ID==i])
}
# Replacing column names with descriptive variable names.
colnames(All_data)[1] <- "Subject_ID"
colnames(All_data)[2] <- "Activity"
for(i in 3:length(colnames(All_data)))
{
  colnames(All_data)[i] <- as.character(features$Feature[features$ID == as.integer(colnames(All_data)[i])])
}
# To create Tidy_Data dataframe 
library(dplyr)
Tidy_Data <- group_by(All_data, Subject_ID, Activity)#grouped by variables Subject_ID and Activity
Tidy_Data <- summarise_each(Tidy_Data,funs(mean))#average of each variable for each activity and each subject

#Save Tidy_Data as a text file
write.table(x = Tidy_Data,file = "Tidy_Data.txt",row.names = FALSE)
