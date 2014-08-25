---
title: "Codebook"
author: "Ian Shaw"
date: "Saturday, August 23, 2014"
---

# 1. Introduction

This codebook outlines the data available following the data cleaning of the Human Activity Recognition Using Smartphones Dataset. The key data table delivered provides access to the average values for the set of mean and standard deviations requested. These figures are grouped by the subjects who competed the experiments and the activities they were carrying out.

In addition to this set of key data all the supporting data is available in the repository. 

The remainder of this document outlines how the different data tables are structured

## 2. Average of Means and Standard Deviations

### 2.1 Data Table Structure

#### 2.1.1. Variables

- Average values by subject by activity for the following variables
- each variable can have the values between -1.000 and +1.000

* tBodyAcc_mean_X
* tBodyAcc_mean_Y
* tBodyAcc_mean_Z
* tBodyAcc_std_X
* tBodyAcc_std_Y
* tBodyAcc_std_Z
* tGravityAcc_mean_X
* tGravityAcc_mean_Y
* tGravityAcc_mean_Z
* tGravityAcc_std_X
* tGravityAcc_std_Y
* tGravityAcc_std_Z
* tBodyAccJerk_mean_X
* tBodyAccJerk_mean_Y
* tBodyAccJerk_mean_Z
* tBodyAccJerk_std_X
* tBodyAccJerk_std_Y
* tBodyAccJerk_std_Z
* tBodyGyro_mean_X
* tBodyGyro_mean_Y
* tBodyGyro_mean_Z
* tBodyGyro_std_X
* tBodyGyro_std_Y
* tBodyGyro_std_Z
* tBodyGyroJerk_mean_X
* tBodyGyroJerk_mean_Y
* tBodyGyroJerk_mean_Z
* tBodyGyroJerk_std_X
* tBodyGyroJerk_std_Y
* tBodyGyroJerk_std_Z
* tBodyAccMag_mean_
* tBodyAccMag_std_
* tGravityAccMag_mean_
* tGravityAccMag_std_
* tBodyAccJerkMag_mean_
* tBodyAccJerkMag_std_
* tBodyGyroMag_mean_
* tBodyGyroMag_std_
* tBodyGyroJerkMag_mean_
* tBodyGyroJerkMag_std_
* fBodyAcc_mean_X
* fBodyAcc_mean_Y
* fBodyAcc_mean_Z
* fBodyAcc_std_X
* fBodyAcc_std_Y
* fBodyAcc_std_Z
* fBodyAcc_meanFreq_X
* fBodyAcc_meanFreq_Y
* fBodyAcc_meanFreq_Z
* fBodyAccJerk_mean_X
* fBodyAccJerk_mean_Y
* fBodyAccJerk_mean_Z
* fBodyAccJerk_std_X
* fBodyAccJerk_std_Y
* fBodyAccJerk_std_Z
* fBodyAccJerk_meanFreq_X
* fBodyAccJerk_meanFreq_Y
* fBodyAccJerk_meanFreq_Z
* fBodyGyro_mean_X
* fBodyGyro_mean_Y
* fBodyGyro_mean_Z
* fBodyGyro_std_X
* fBodyGyro_std_Y
* fBodyGyro_std_Z
* fBodyGyro_meanFreq_X
* fBodyGyro_meanFreq_Y
* fBodyGyro_meanFreq_Z
* fBodyAccMag_mean_
* fBodyAccMag_std_
* fBodyAccMag_meanFreq_
* fBodyBodyAccJerkMag_mean_
* fBodyBodyAccJerkMag_std_
* fBodyBodyAccJerkMag_meanFreq_
* fBodyBodyGyroMag_mean_
* fBodyBodyGyroMag_std_
* fBodyBodyGyroMag_meanFreq_
* fBodyBodyGyroJerkMag_mean_
* fBodyBodyGyroJerkMag_std_
* fBodyBodyGyroJerkMag_meanFreq_
* fBodyBodyGyroJerkMag_meanFreq_

#### 2.1.2 Row Headers
- subject : unique ID within the range 1 : 30
- activity : there are 6 activities 
     1. WALKING
     2. WALKING_UPSTAIRS
     3. WALKING_DOWNSTAIRS
     4. SITTING
     5. STANDING
     6. LAYING

#### 2.1.3 Size
The data table is 180 x 79
