# READ.ME

This is the Repository for Getting  and Cleaning Data Course Project submission by Ian Shaw

# 1. Introduction

The experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, 
LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist using its embedded accelerometer and 
gyroscope 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
 
The results from these experiments are summarised in the './data' folder in the summary_data 
data table which contains values for each of the 561 variables by subjects by activity.

A subset of these variables (containing mean and std) is also in the './data' folder (the information required for step 5).

The Raw data based on the accelerometer and gyroscope 3-axial linear acceleration and 3-axial angular velocity
at a constant rate of 50Hz with the test and train data merged and row and column names expanded and the data 
tidied are held in the 'annotated'./raw_data' folder.

# 2. How the Script is used to tidy the data

The key deliverables for this assignment are a script "run_analysis.R", this READ.ME file, and a codebook.

The script reads the various files in the UCI HAR Dataset directory. Takes the Test and the Train data and merges it. Tidies the data by making sure that the tables are structured into rows and columns which have easily understood names, and there is only one variable per column.

The script does the following: 

* 1. Checks that the Test, Train directories and files are available based on the 'UCI_HAR_Directory' supplied
* 2. Creates a './Data' directory under the UCI_HAR_Directory if one does not exist  
* 3. Create the Sliding Window Column names to be used with the Supporting Data Table sets  
* 4. Extract the activities and subjects from their files for use as row names for the data tables    
  - Extract the activityID and activities
  - Extract subjects (from y_test & y_train files), 
  - Documents where the data was taken from using test.train
  - Merges this information for later use and save a sorted, unique subset of these in the './data' directory
* 5. Extract the variables from the features file, remove any special characters, add two columns is.mean and is.std for use later 
  - Extract the variables from the features file
  - remove all special characters to prevent them causing problems later in the process and when the data sets are used later
  - add two additional columns (is.mean & is.std) to variables table to make the selection of those variables containing mean & std easier. 
  - Write the variables data off to the './data' folder
  - Extract the features for use as column headers
  - Remove all special characters to prevent them causing problems later in the process and when the data sets are read later
  - Add two additional columns (is.mean & is.std) to features table to make mean & std selection easier 
  - write the data off to the './data' folder
* 6. Extract, format the summary and summary subset readings (from the x-test and x-train files) so the tidy set of data is ready to be used. As requested a subset of these summary readings have also been created based on those variables 
  - Extract and merge the data in the x-test and x-train files
  - Create a summary_subset of the data using only the variables (columns) containing Mean & Std as part of the name 
  - Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

