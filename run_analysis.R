trainingsetUrl=c("UCI HAR Dataset/train/subject_train.txt","UCI HAR Dataset/train/X_train.txt","UCI HAR Dataset/train/y_train.txt");


trainlist<-lapply(trainingsetUrl,read.table);
trainlistinertial<-lapply(trainingsetIUrl,read.table);
trainDF<-data.frame(trainlist);

testsetUrl=c("UCI HAR Dataset/test/subject_test.txt","UCI HAR Dataset/test/X_test.txt","UCI HAR Dataset/test/y_test.txt")


testlist<-lapply(testsetUrl,read.table);
testDF<-data.frame(testlist);


dataset<-rbind(trainDF,testDF);

activitylabels=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING");
filter=c(0,1:6,41:46,81:86,121:126,161:166,201,202,214,215,227,228,240,241,253,254,266:271,345:350,424:429,503,504,516,517,529,530,542,543,562)
filter=filter+1;
subset<-dataset[,filter];

activityVect<-dataset[,563];
activityVect[activityVect=="1"]="WALKING";
activityVect[activityVect=="2"]="WALKING_UPSTAIRS";
activityVect[activityVect=="3"]="WALKING_DOWNSTAIRS"
activityVect[activityVect=="4"]="SITTING";
activityVect[activityVect=="5"]="STANDING";
activityVect[activityVect=="6"]="LAYING";
factorActivity<-factor(activityVect);
dataset[,563]<-factorActivity;

varnames=c("Subject",
           "TimeDomain_BodyAccelerationMean_X","TimeDomain_BodyAccelerationMean_Y","TimeDomain_BodyAccelerationMean_Z","TimeDomain_BodyAccelerationStdDev_X","TimeDomain_BodyAccelerationStdDev_Y","TimeDomain_BodyAccelerationStdDev_Z",
           "TimeDomain_GravityAccelerationMean_X","TimeDomain_GravityAccelerationMean_Y","TimeDomain_GravityAccelerationMean_Z","TimeDomain_GravityAccelerationStdDev_X","TimeDomain_GravityAccelerationStdDev_Y","TimeDomain_GravityAccelerationStdDev_Z",
           "TimeDomain_BodyAccelerationJerkMean_X","TimeDomain_BodyAccelerationJerkMean_Y","TimeDomain_BodyAccelerationJerkMean_Z","TimeDomain_BodyAccelerationJerkStdDev_X","TimeDomain_BodyAccelerationJerkStdDev_Y","TimeDomain_BodyAccelerationJerkStdDev_Z",
           "TimeDomain_BodyGyroMean_X","TimeDomain_BodyGyroMean_Y","TimeDomain_BodyGyroMean_Z","TimeDomain_BodyGyroStdDev_X","TimeDomain_BodyGyroStdDev_Y","TimeDomain_BodyGyroStdDev_Z",
           "TimeDomain_BodyGyroJerkMean_X","TimeDomain_BodyGyroJerkMean_Y","TimeDomain_BodyGyroJerkMean_Z","TimeDomain_BodyGyroJerkStdDev_X","TimeDomain_BodyGyroJerkStdDev_Y","TimeDomain_BodyGyroJerkStdDev_Z",
           "TimeDomain_BodyAccMagMean","TimeDomain_BodyAccMagStdDev",
           "TimeDomain_GravityAccMagMean","TimeDomain_GravityAccMagStdDev",
           "TimeDomain_BodyAccJerkMagMean","TimeDomain_BodyAccJerkMagStdDev",
           "TimeDomain_BodyGyroMagMean","TimeDomain_BodyGyroMagStdDev",
           "TimeDomain_BodyGyroJerkMagMean","TimeDomain_BodyGyroJerkMagStdDev",
           "FreqDomain_BodyAccelerationMean_X","FreqDomain_BodyAccelerationMean_Y","FreqDomain_BodyAccelerationMean_Z","FreqDomain_BodyAccelerationStdDev_X","FreqDomain_BodyAccelerationStdDev_Y","FreqDomain_BodyAccelerationStdDev_Z",
           "FreqDomain_BodyAccelerationJerkMean_X","FreqDomain_BodyAccelerationJerkMean_Y","FreqDomain_BodyAccelerationJerkMean_Z","FreqDomain_BodyAccelerationJerkStdDev_X","FreqDomain_BodyAccelerationJerkStdDev_Y","FreqDomain_BodyAccelerationJerkStdDev_Z",
           "FreqDomain_BodyGyroMean_X","FreqDomain_BodyGyroMean_Y","FreqDomain_BodyGyroMean_Z","FreqDomain_BodyGyroStdDev_X","FreqDomain_BodyGyroStdDev_Y","FreqDomain_BodyGyroStdDev_Z",
           "FreqDomain_BodyAccMagMean","FreqDomain_BodyAccMagStdDev",
           "FreqDomain_BodyAccJerkMagMean","FreqDomain_BodyAccJerkMagStdDev",
           "FreqDomain_BodyGyroMagMean","FreqDomain_BodyGyroMagStdDev",
           "FreqDomain_BodyGyroJerkMagMean","FreqDomain_BodyGyroJerkMagStdDev",
           "Activity"
);
names(subset)<-varnames;
