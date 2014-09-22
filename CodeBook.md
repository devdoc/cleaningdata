Code book
=========
This code book describes the the variables of the tidy data set produced by the R script `run_analysis.r` when it operates on the source dataset (the [UCI HAR Dataset](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)).

The script will write a dataset called `tidy.txt` in the working directory. The dataset will contain mean values - grouped by Subject and Activity - for observations of 66 variables from the source dataset (the variables recording means and standard deviations of corresponding variables derived from the raw signal data. Please see source dataset description for further info):

- tBodyAcc-\[mean()|std()]-\[X|Y|Z]
- tGravityAcc-\[mean()|std()]-\[X|Y|Z]
- tBodyAccJerk-\[mean()|std()]-\[X|Y|Z]
- tBodyGyro-\[mean()|std()]-\[X|Y|Z]
- tBodyGyroJerk-\[mean()|std()]-\[X|Y|Z]
- tBodyAccMag-\[mean()|std()]
- tGravityAccMag-\[mean()|std()]
- tBodyAccJerkMag-\[mean()|std()]
- tBodyGyroMag-\[mean()|std()]
- tBodyGyroJerkMag-\[mean()|std()]
- fBodyAcc-\[mean()|std()]-\[X|Y|Z]
- fBodyAccJerk-\[mean()|std()]-\[X|Y|Z]
- fBodyGyro-\[mean()|std()]-\[X|Y|Z]
- fBodyAccMag-\[mean()|std()]
- fBodyBodyAccJerkMag-\[mean()|std()]
- fBodyBodyGyroMag-\[mean()|std()]
- fBodyBodyGyroJerkMag-\[mean()|std()]

Each row in `tidy.txt` has 68 variables:
- Subject
- Activity
- The 66 mean values computed over the variables mentioned above, grouped by Subject and Activity

There will be 6 rows per Subject, i.e. one for each Activity.

Values in the source dataset are normalized to be bounded within [-1, 1]. Consequently the mean values in `tidy.txt` will also fall within these bounds.