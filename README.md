get.clean.data
==============

Materials from the Getting and Cleaning Data Mooc

# Below is a decription of the R code in run_analysis.R and an explanation of how it works.
# The working directory is set.
setwd("~/getting-data-mooc")

#Training Data

# Each training file is read into R and saved as a data frame.
subject_train = read.table("./UCI-HAR-Dataset/train/subject_train.txt")
X_train = read.table("./UCI-HAR-Dataset/train/X_train.txt")
Y_train = read.table("./UCI-HAR-Dataset/train/Y_train.txt")

#The text file containing the column labels is read into R and saved as a data frame.
labels = read.table("./UCI-HAR-Dataset/features.txt")

#An index of all labels that contain the text string "mean" is saved in the vector called "means". The text case of the lablels is ignored.
means<-grep("mean", labels$V2, ignore.case = TRUE)

#An index of all labels that contain the text string "std" is saved in the vector called "std". The text case of the lables is ignored.
stds<- grep("std", labels$V2, ignore.case = TRUE)

#The vectors that contain the index for mean and std variables are combined into one vector and sorted in ascending order.
col_index<- c(means, stds)
col_index<- sort(col_index)

#This index is used to extract only the mean and std columns from the training data. The extracted columns are saved to a vector called "train_extract".
train_extract<-X_train[,col_index]

#The index is also used to extract the column names for the mean and std columns and this list of names is saved to the vector "col_names".
col_names<-labels$V2[col_index]

#The extracted training columns are assigned column names using the col_names vector.
names(train_extract)<-col_names
  
#The subject ID and activity data frames are added to the "train_extract" data frame and saved in a new data frame called "train".
train<-cbind(subject_train, train_extract, Y_train)

#The subject ID and activity columns in "train" are labeled.
colnames(train)[c(1, 88)]<- c("Subject", "Activity")

#The codes for the activities are saved in a vector called "activity.code".
activity.code<- c("Walking"= 1, "Walking_Upstairs"=2, "Walking_Downstairs"=3, "Sitting"=4, "Standing"=5, "Laying"=6)

#A column called "Activity.name" is added to the train data frame and the labels are matched with their corresponding code and added to this column.
train$Activity.name<- names(activity.code)[match(train$Activity, activity.code)]

#Test
#The Test dataset is now modified in a simlar manner to the Training data.

# Each test file is read into R and saved as a data frame.
subject_test = read.table("./UCI-HAR-Dataset/test/subject_test.txt")
X_test = read.table("./UCI-HAR-Dataset/test/X_test.txt")
Y_test = read.table("./UCI-HAR-Dataset/test/y_test.txt")

#The index of the mean and std columns that was created for the training data is used to extract only the mean and std columns from the test data as well. The extracted columns are saved to a vector called "test_extract".
test_extract<-X_test[,col_index]

#The extracted test columns are labeled using the col_names vector that was created above.
names(test_extract)<-col_names

#The subject ID and activity data frames are added to the "test_extract" data frame and saved in a new data frame called "test".
test<-cbind(subject_test, test_extract, Y_test)

#The subject ID and activity columns in "test" are labeled.
colnames(test)[c(1, 88)]<- c("Subject", "Activity")

#A column called "Activity.name" is added to the train data frame and the labels are matched with their corresponding code and added to this column. The vector of codes that was created agove was used.
test$Activity.name<- names(activity.code)[match(test$Activity, activity.code)]

#The Test and Train datasets are combined into a dataset called "all.data".
all.data<- rbind(test, train)

#An independent, tidy data set with the average of each variable for each activity and each subject is created.

# A blank data frame called "sum.subject" is created to store the average values for each subject.
sum.subject<-as.data.frame(matrix(0, nrow=30, ncol=88))

# A loop is used to get the average value across all variables for each subject. The output is stored in the "sub.subject" data frame. Two blank columns are created at the front of the data frame to store the activity and subject information.
for (i in 2:87){
  sum.subject[i+1]<-tapply(all.data[,i], all.data$Subject, mean)
}

# The subject ID is added to the first column of the "sum.subject" data frame.
sum.subject[1]<-1:30

# A blank data frame called "sum.activity" is created to store the average values for each activity.
sum.activity<-as.data.frame(matrix(0, nrow=6, ncol=88))

# A loop is used to get the average value across all variables for each activity type. The output is stored in the "sum.activity" data frame. Two blank columns are created at the front of the data frame to store the activity and subject information.
for (i in 2:87){
  sum.activity[i+1]<-tapply(all.data[,i], all.data$Activity, mean)
}

# The activity name is added to the second column of the "sum.acivity" data frame.
sum.activity[2]<-c("Walking", "Walking_Upstairs", "Walking_Downstairs","Sitting", "Standing", "Laying")

#The sum.subject and sum.activity datasets are combined into one dataset called "sum.data".
sum.data<-rbind(sum.subject, sum.activity)

#The list of column names that was created above are converted into a character vector.
col_names2<-as.character(col_names)

#The column names are added to the "sum.data" data frame.
colnames(sum.data)[3:88]<-col_names2

#The first and second columns with the IDs and Activities are labeled.
colnames(sum.data)[1:2]<-c("Subject", "Activity")

#Any 0 values in the first two columns are converted to NA
sum.data$Subject[sum.data$Subject==0]<-NA
sum.data$Activity[sum.data$Activity==0]<-NA

#The dataset is output as a text file.
write.table(sum.data, "./sumdata.txt", sep="\t")

