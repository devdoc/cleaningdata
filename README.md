Purpose
=======
This repository contains the Course Project for the course Getting and Cleaning Data (getdata-007) in Coursera.

Description
===========
`run_analysis.r` must be run in the same directory where the [source data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) has been unzipped. It will then
- read in the test and train datasets,
- relabel variables with descriptive names,
- add variables for the Activity and the Subject that each row of data relate to, 
- merge these modified test and train datasets into a single data frame,
- create a subset with only variables on mean and standard deviation,
- calculate the mean values for each of these variables across each Subject and Activity,
- write the resulting tidy dataset as `tidy.txt` in the working directory
