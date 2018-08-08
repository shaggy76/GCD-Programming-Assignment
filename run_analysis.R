library(dplyr)

# Download and unzip data
dataset_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
file_name <- "Dataset.zip"
download.file(dataset_url, file_name)
unzip(file_name)

# Pull testing and test data and merge into one dataset
data_path <- "./UCI HAR Dataset/"

features <- read.table(file = paste0(data_path, "features.txt")
                       ,stringsAsFactors = FALSE)
names(features) <- c("column", "variable")
columns <- grep("(mean\\(\\)|std\\(\\))", features[[2]])

activities <- read.table(file = paste0(data_path, "activity_labels.txt"))
names(activities) <- c("id", "name")
activities$name <- gsub("_", "", activities$name)

train_path <- "train/"
train_data <- read.table(file = paste0(data_path, train_path, "X_train.txt"))

train_labels <- read.table(file = paste0(data_path, train_path, "Y_train.txt"))
names(train_labels) <- "id"
train_labels <- merge(activities, train_labels)

train_subject <- read.table(file = paste0(data_path, train_path, "subject_train.txt"))

training <- cbind(train_subject, train_labels$name, train_data[, columns])
names(training) <- c("Subject", "Activity", features$variable[columns])

test_path <- "test/"
test_data <- read.table(file = paste0(data_path, test_path, "X_test.txt"))

test_labels <- read.table(file = paste0(data_path, test_path, "Y_test.txt"))
names(test_labels) <- "id"
test_labels <- merge(activities, test_labels)

test_subject <- read.table(file = paste0(data_path, test_path, "subject_test.txt"))

testing <- cbind(test_subject, test_labels$name, test_data[, columns])
names(testing) <- c("Subject", "Activity", features$variable[columns])

final <- rbind(testing, training)

# Create tidy summary dataset
summary <- tbl_df(final) %>% 
           group_by(Subject, Activity) %>%
           summarise_all(mean)




