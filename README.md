### Human Activity Recognition Using Smartphones Dataset

30 volunteers performed six activities each (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone on the
waist. Using its embedded accelerometer and gyroscope, 3-axial linear
acceleration and 3-axial angular velocity data were captured and
further processed into 561 feature variables. For further detail see below in
the RAW DATA paragraph.
The 561 feature variables for 10.299 variables (30 volunteers ~ 6 activities,
about 50 observations/repeats each) were summarized to determine mean values
for each volunteer and each activity. This summary table only contains feature
variables describing mean values and standard deviation. For further detail see
below in the SUMMARIZED DATA paragraph.

#### SUMMARIZED DATA

Data source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
R script `run_analysis.R` performed the complete procedure.  
Here follows a verbal description of the steps to obtain the tidy summary.

**Used files containing raw data** (split in "test" and "train" sets):
- feature vector data frame, contains the actual data values `test/X_test.txt`, `train/X_train.txt`
- feature vector variable names `features.txt`
- subject (volunteers) labels `test/subject_test.txt`,`train/subject_train.txt`
- activity labels `test/y_test.txt`, `train/y_train.txt`

**Merging and Tidying**
- activity labels 1-6 are changed into the corresponding descriptive activities
(1 WALKING, 2 WALKING_UPSTAIRS,3 WALKING_DOWNSTAIRS, 4 SITTING,5 STANDING, 6 LAYING)
- column names for the feature data are transformed by removing "()" and merged
to the features data frame
- respective subject and activity label vectors are merged to feature data frame
(column 1 = subject, column2 = activity)
- above steps are equal for test and training data frames, the two resulting data
frames are merged by binding rows
- variables with "mean" or "std" in variable name are subset/selected
- subset data frame is grouped by subject and activity factors
- mean is calculated for all variables (3 to 88), by group
- result: tidy data frame 180 observations (groups), 88 variables (features) `ActivityRecognition`

#### RAW DATA (from Original READMe file)
Human Activity Recognition Using Smartphones Dataset Version 1.0
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit? degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.  
activityrecognition@smartlab.ws, www.smartlab.ws

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.  

**For each record it is provided:**  
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

**The dataset includes the following files:**  
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

**The following files are available for the train and test data.** Their descriptions are equivalent.  
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

**Notes:**  
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.
For more information about this dataset contact: activityrecognition@smartlab.ws

**License:**  
Use of this dataset in publications must be acknowledged by referencing the following publication [1]
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.`
