##DOWNLOAD DATA FROM WEBSITE
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile="data.zip", method="curl")

##READ TEST DATA INTO DATA TABLES
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt", header=FALSE) ##Test subjects with 2947 observations for id's 2,4,9,10,12,13,18,20,24
X_test<-read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE)##2947 observations with 561 columns of data ranging from -1 to 1
Y_test<-read.table("UCI HAR Dataset/test/Y_test.txt", header=FALSE)##2947 obs with 1 column of integers 1,2,3,4,5,6 (training labels)

##MERGE TEST DATA
testdata<-cbind(subject_test, Y_test, X_test) ##Make data table with column 1 ID, column 2 activity, and subsequent columns data

##READ TRAINING DATA INTO DATA TABLES
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE) ##Training subjects with 7352 observations for 21 id's between 1-30
X_train<-read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE)##7352 observations with 561 columns of data ranging from -1 to 1
Y_train<-read.table("UCI HAR Dataset/train/Y_train.txt", header=FALSE)##7352 obs with 1 column of integers 1,2,3,4,5,6 (activity labels)

##MERGE TRAINING DATA
traindata<-cbind(subject_train, Y_train, X_train) ##Make data table with first column ID, 2nd column activity, and subsequent columns data

##IMPORT COLUMN NAMES AND ACTIVITY LABELS
featurenames<-read.table("UCI HAR Dataset/features.txt", header=FALSE)
activitylabels<-read.table("UCI HAR Dataset/activity_labels.txt", header=FALSE)

##MERGE TEST AND TRAINING DATA
data<-rbind(testdata, traindata) ##Make data table with 10299 rows for the 30 people (training and testing sets combined), with no missing data

##IMPORT COLUMN NAMES AND ACTIVITY LABELS
featurenames<-read.table("UCI HAR Dataset/features.txt", header=FALSE)
activitylabels<-read.table("UCI HAR Dataset/activity_labels.txt", header=FALSE)

##LABEL COLUMNS AND ACTIVITIES IN DATA SET
colnames(data)<-c("id", "activity", as.vector(featurenames[,2])) ##Creates columns named "id", "activity", and then each of the 561 feature names
data$activity<- factor(data$activity, levels = c(1,2,3,4,5,6), labels = c("Walking", "WalkUpstairs", "WalkDownstairs", "Sitting", "Standing", "Laying")) ## Label each of the 6 activities

##TAKE SUBSET OF DATA WITH ID, ACTIVITY, AND MEAN OR STD IN THE FEATURE NAME
data<-data[,which(grepl(c("id|activity|mean|Mean|std"), colnames(data))==TRUE)] ##Subset only columns with mean or std
data<-data[1:10299,]

##REMOVE PUNCTUATION FROM COLUMN NAMES
messynames<-colnames(data)
cleannames<-gsub(")|-|,|\\(", "", messynames) ## Removes punctuation from column names
colnames(data)=cleannames ##Gives new names without punctuation to the columns

##MELT THE TABLE USING ID AND ACTIVITY AS ID'S AND ALL OTHER COLUMNS (3-88) AS VARIABLES
varnames<-colnames(data[,3:88])
datamelt<-melt(data, id=c("id","activity"), measure.vars=varnames)

##MAKE A DATA TABLE WITH THE MEAN OF EACH OF THE 85 VARIABLES FOR EACH ID-ACTIVITY PAIRING
datacast<-dcast(datamelt, id + activity ~ variable, mean)

##WRITE THE TABLE TO A TEXT FILE
write.table(datacast, file="datacast.txt", row.names=FALSE)
