# R Project
setwd("~/getting-data-mooc")

#Training Data

subject_train = read.table("./UCI-HAR-Dataset/train/subject_train.txt")
X_train = read.table("./UCI-HAR-Dataset/train/X_train.txt")
Y_train = read.table("./UCI-HAR-Dataset/train/Y_train.txt")

labels = read.table("./UCI-HAR-Dataset/features.txt")
means<-grep("mean", labels$V2, ignore.case = TRUE)
stds<- grep("std", labels$V2, ignore.case = TRUE)


col_index<- c(means, stds)
col_index<- sort(col_index)

train_extract<-X_train[,col_index]

col_names<-labels$V2[col_index]

names(train_extract)<-col_names
  
train<-cbind(subject_train, train_extract, Y_train)

colnames(train)[c(1, 88)]<- c("Subject", "Activity")


activity.code<- c("Walking"= 1, "Walking_Upstairs"=2, "Walking_Downstairs"=3, "Sitting"=4, "Standing"=5, "Laying"=6)

train$Activity.name<- names(activity.code)[match(train$Activity, activity.code)]

#Test Data
subject_test = read.table("./UCI-HAR-Dataset/test/subject_test.txt")
X_test = read.table("./UCI-HAR-Dataset/test/X_test.txt")
Y_test = read.table("./UCI-HAR-Dataset/test/y_test.txt")

test_extract<-X_test[,col_index]

names(test_extract)<-col_names

test<-cbind(subject_test, test_extract, Y_test)

colnames(test)[c(1, 88)]<- c("Subject", "Activity")

test$Activity.name<- names(activity.code)[match(test$Activity, activity.code)]

#Combined Test and Train

all.data<- rbind(test, train)

#Second, independent tidy data set with the average of each variable for each activity and each subject

sum.subject<-as.data.frame(matrix(0, nrow=30, ncol=88))
for (i in 2:87){
  sum.subject[i+1]<-tapply(all.data[,i], all.data$Subject, mean)
}
sum.subject[1]<-1:30

sum.activity<-as.data.frame(matrix(0, nrow=6, ncol=88))
for (i in 2:87){
  sum.activity[i+1]<-tapply(all.data[,i], all.data$Activity, mean)
}
sum.activity[2]<-c("Walking", "Walking_Upstairs", "Walking_Downstairs","Sitting", "Standing", "Laying")

#Combine average for subjects and activities
sum.data<-rbind(sum.subject, sum.activity)

col_names2<-as.character(col_names)
colnames(sum.data)[3:88]<-col_names2
colnames(sum.data)[1:2]<-c("Subject", "Activity")

sum.data$Subject[sum.data$Subject==0]<-NA
sum.data$Activity[sum.data$Activity==0]<-NA

#Output Tidy Dataset
write.table(sum.data, "./sumdata.txt", sep="\t")
