run_analysis.R <- function (UCI_HAR_directory = "./UCI HAR Dataset") {

# The experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
# Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, 
# LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist using its embedded accelerometer and 
# gyroscope 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
# 
# The results from these experiments are summarised in the './data' folder in the summary_data 
# data table which contains values for each of the 561 variables by subjects by activity.
# 
# A subset of these variables (containing mean and std) is also in the './data' folder (the information required for step 5).
#
# The Raw data based on the accelerometer and gyroscope 3-axial linear acceleration and 3-axial angular velocity
# at a constant rate of 50Hz with the test and train data merged and row and column names expanded and the data 
# tidied are held in the 'annotated'./raw_data' folder.

#  The script does the following. 
#  1. Checks that the Test, Train directories and files are available based on the 'UCI_HAR_Directory' supplied
#  2. Creates a './Data' directory under the UCI_HAR_Directory if one does not exist  
#  3. Create the Sliding Window Column names to be used with the Supporting Data Table sets  
#  4. Extract the activities and subjects from their files for use as row names for the data tables    
#     a. Extract the activityID and activities
#     b. Extract subjects (from y_test & y_train files), 
#     c. document where the data was taken from using test.train
#     d. Merge this information for later use and save a sorted, unique subset of these in the './data' directory
#  5. Extract the features variables, remove any special characters, add two columns is.mean and is.std for use later 
#     a. extract the features for use as column headers
#     b. remove all special characters to prevent them causing problems later in the process and when the data sets are used later
#     c. add two additional columns (is.mean & is.std) to features table to make mean & std selection easier 
#     d. write the data off to the './data' folder
#  6. Extracts only the measurements on the mean and standard deviation 
#     for each measurement. 
#  3. Uses descriptive activity names to name the activities in the data set
#  4. Appropriately labels the data set with descriptive variable names. 
#  5. Creates a second, independent tidy data set with the average of each 
#     variable for each activity and each subject. 

# Merges the training and the test sets to create one data set.
# The script is based on 
  
# Test variables
#  UCI_HAR_Directory <- str_c(  "c:", 
#                               "users",
#                               "ishaw",
#                               "documents",
#                               "GetDataProject",
#                               "UCI HAR Dataset",
#                               sep = "/",
#                               collapse = NULL)

#  1. Checks that the Test, Train directories and files are available based on the 'UCI_HAR_Directory' supplied
  
  setwd(UCI_HAR_Directory)
  getwd()

  if (!file.exists("./test") )               { print("Error : './test' Directory is not available in the UCI_HAR_Directory supplied") 
                                               stop()
                                             }
  if (!file.exists("./train") )              { print("Error : './train' Directory is not available in the UCI_HAR_Directory supplied") 
                                               stop()
                                             }
  if (!file.exists("./features.txt") )       { print("Error : './features.txt' file is not available in the UCI_HAR_Directory supplied")  
                                               stop()
                                             }
  if (!file.exists("./activity_labels.txt") ) { print("Error : './activity_labels.txt' file is not available in the UCI_HAR_Directory supplied")  
                                               stop()
                                             }

#  2. Creates a './Data' directory under the UCI_HAR_Directory if one does not exist  

  test.path = str_c(UCI_HAR_Directory, "test", sep = "/", collapse = NULL)
  test.path
  train.path = str_c(UCI_HAR_Directory, "train", sep = "/", collapse = NULL)
  train.path
  if(!file.exists("data") ) { dir.create("data") }
  data.path = str_c(UCI_HAR_Directory, "data", sep = "/", collapse = NULL)
  data.path

# The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and 
# then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window).

#  3. Create the Sliding Window Column names to be used with the Supporting Data Table sets  

  window_names <- as.character(seq(1:128))
  window_names <- str_c("SlidingWindow", window_names, sep = "", collapse = NULL)  

#  4. Extract the activities and subjects from their files for use as row names for the data tables    
#     a. Extract the activityID and activities
#     b. Extract subjects (from y_test & y_train files), document where the data was taken from using test.train
#     c. Merge this information for later use and save a sorted, unique subset of these in the './data' directory

# a. Extract the activityID and activities

  activitiy <- {}
  file_activities <- file("./activity_labels.txt","rt")
  activity <- read.table( file_activities, 
                          encoding = "UTF-8-BOM",
                          sep = " ")     
  close(file_activities)
  colnames(activity) <- c("activityID", "activity")

# b. Extract subjects (from y_test & y_train files)

  subject_activity <- {}
  temp <- {}
  file_y <- file("./test/y_test.txt","rt")
  subject_activity <- read.table( file_y, fileEncoding = "UTF-8-BOM")     
  close(file_y)

  file_y <- file("./train/y_train.txt","rt")
  temp <- read.table( file_y, fileEncoding = "UTF-8-BOM")     
  close(file_y)
  subject_activity <- rbind(subject_activity, temp)
  colnames(subject_activity) <- "activityID"

# c. append the activities to the subject data table (not a particularly elegant way of doing this)

  temp <- {}
  temp <- as.character(subject_activity$activityID)
  temp <- str_replace_all(temp, "1", "WALKING" )
  temp <- str_replace_all(temp, "2", "WALKING_UPSTAIRS" )
  temp <- str_replace_all(temp, "3", "WALKING_DOWNSTAIRS" )
  temp <- str_replace_all(temp, "4", "SITTING" )
  temp <- str_replace_all(temp, "5", "STANDING" )
  temp <- str_replace_all(temp, "6", "LAYING" )
 
  subject_activity <- cbind(subject_activity, temp)
  colnames(subject_activity) <- c("activityID", "activity")

# d. document where the data was taken from using test.train

  subject <- {}
  temp <- {}
  file_subject <- file("./test/subject_test.txt","rt")
  subject <- read.table( file_subject,  
                         encoding = "UTF-8-BOM", 
                         sep = " ")     
  close(file_subject)  
  subject <- cbind( subject, "test")
  colnames(subject) <- c("subject", "test.train")

  file_subject <- file("./train/subject_train.txt","rt")
  temp <- read.table( file_subject, 
                              encoding = "UTF-8-BOM", 
                              sep = " ")     
  close(file_subject)
  temp <- cbind( temp, "train")
  colnames(temp) <- c("subject", "test.train")
  subject <- rbind(subject, temp)

# e. subject is used below
#    a unique sorted set of subjects_and_activities are created and saved for future use  

  subject_activity <- cbind(subject, subject_activity)
  colnames(subject_activity) <- c("subject", "test.train", "activityID", "activity")
  subject_activity_unique <- unique(subject_activity)
  subject_activity_unique <- subject_activity_unique[order(subject_activity_unique$subject, 
                                             subject_activity_unique$activityID),]
  write.table(subject_activity_unique, 
            file = "./data/subject_activity_unique.txt", 
            append = FALSE, 
            sep = "\t",
            row.names = FALSE)

#  5. Extract the variables from the features file, remove any special characters, add two columns is.mean and 
#     is.std for use later 
#     a. Extract the variables from the features file
#     b. remove all special characters to prevent them causing problems later in the process and when the data 
#        sets are used later
#     c. add two additional columns (is.mean & is.std) to variables table to make the selection of those 
#        variables containing mean & std easier. 
#     d. write the variables data off to the './data' folder

#     a. Extract the variables from the features file

  file_features <- file("./features.txt","rt")
  variables <- read.table( file_features, 
                          encoding = "UTF-8-BOM",
                          sep = " ")     
  close(file_features)

  colnames(variables) <- c("variablesID", "variable")

#     b. remove all special characters to prevent them causing problems later in the process and when the data 
#        sets are used later

  variables$variable <- str_replace_all(variables$variable,"[[:punct:]]","_")
  variables$variable <- str_replace_all(variables$variable,"__","_")
  variables$variable <- str_replace_all(variables$variable,"__","_")

#     c. add two additional columns (is.mean & is.std) to variables table to make the selection of those 
#        variables containing mean & std easier. 

  variables$mean <- !is.na(ifelse(str_extract(variables$variable, "mean") == "mean", 1, -1 ))
  variables$std  <- !is.na(ifelse(str_extract(variables$variable, "std")  == "std",  1, -1 ))
  colnames(variables) <- c("variableID", "variable", "is.mean", "is.std")
  variables <- variables[,-1]

#     d. write the variables data off to the './data' folder

  write.table(variables, 
            file = "./data/variables.txt", 
            append = FALSE, 
            sep = "\t",
            row.names = FALSE)

# 6. Extract, format the summary and summary subset readings (from the x-test and x-train files) so the tidy set of data is ready 
#    to be used. As requested a subset of these summary readings have also been created based on those variables 

#    a. Extract and merge the data in the x-test and x-train files

  summary <- {}
  temp <- {}
  file_summary <- file("./test/X_test.txt","rt")
  summary <- read.table( file_summary, fileEncoding = "UTF-8-BOM")     
  close(file_summary)

  file_summary <- file("./train/X_train.txt","rt")
  temp <- read.table( file_summary, fileEncoding = "UTF-8-BOM")     
  close(file_summary)
  summary <- rbind(summary, temp)
  colnames(summary) <- variables$variable
  summary <- cbind(subject_activity, summary)

  write.table(summary, 
              file = "./data/summary.txt", 
              append = FALSE, 
              sep = "\t",
              row.names = FALSE)

#    b. Create a summary_subset of the data using only the variables (columns) containing Mean & Std as part of the name    

  summary_cols <- {}
  summary_cols_sub <- {}
  summary_cols <- seq(1:565)
  summary_cols_sub <- summary_cols * c(TRUE, TRUE, TRUE, TRUE, (variables$is.mean | variables$is.std ))
  summary_cols_sub
  variables_subset <- subset(variables, 
                            subset = variables$is.mean | variables$is.std,
                            select = c(1)) 
  variables_subset

  summary_subset <- subset(summary, select = summary_cols_sub )
  head(summary_subset, 3)

#    c. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

  temp <- {}
  temp <- data.table(summary_subset, key=c("subject", "activity") )
  summary_subset <- temp[, lapply(.SD, mean), by=c("subject", "activity")] 

  summary_subset[order(subject, activityID)]
  summary(summary_subset)

  write.table(x_mean_by_subject_activity, 
              file = "./data/x_mean_by_subject_activity.txt", 
              append = FALSE, 
              sep = "\t",
              row.names = FALSE)

}
