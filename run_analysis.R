## **REQUIRES** reshape, will install if not already installed
requirements <- c("reshape")
new.packages <- requirements[!(requirements %in% installed.packages()[,"Package"])]
if (length(new.packages)) {
  install.packages(new.packages)
}
library(reshape)

## **REQUIRES** that Samsung dataset is in working dir
fpath <- file.path(getwd(), "UCI HAR Dataset")
test_folder <- file.path(fpath, "test")
train_folder <- file.path(fpath, "train")

## Read in features, find mean and std for each measure
feat <- read.table(file.path(fpath, "features.txt"))
idx <- grep("mean\\(\\)|std\\(\\)", feat$V2)
labels <- c("Subject", "Activity", as.character(feat$V2[idx]))

## Get the descriptive activity labels to attach to numerical factors
activities <- read.table(file.path(fpath, "activity_labels.txt"))$V2

## Function to read and compose test/train data
get_data <- function(folder, typ) {
  # retrieve filepaths
  file.subject <- file.path(folder, paste("subject_", typ, ".txt", sep=""))
  file.x <- file.path(folder, paste("X_", typ, ".txt", sep=""))
  file.y <- file.path(folder, paste("y_", typ, ".txt", sep=""))
  
  # read in data
  subject <- read.table(file.subject)
  x <- read.table(file.x)
  vars <- x[, idx]  # get only means and std
  y <- read.table(file.y)
  
  # combine and output data
  output <- cbind(subject, y, vars)
  names(output) <- labels
  output$Subject <- factor(output$Subject)  # convert to factor
  output$Activity <- factor(output$Activity)  # also to factor
  
  levels(output$Activity) <- activities  # give activities descriptive names
  output  # return output
}

## Get the data for training and test sets
train <- get_data(train_folder, "train")
test <- get_data(test_folder, "test")

## Put the training and test sets together
all <- rbind(train, test)


## Create 2nd tidy dataset /w avg of var for each activity for each subject 
molten <- melt(all, id.vars = c("Subject", "Activity"))
second_dataset <- cast(Subject + Activity ~ ..., data=molten, fun=mean)

## Writes out summary data 
write.table(second_dataset, file="means_by_subject_and_activity.txt", row.names=FALSE)
