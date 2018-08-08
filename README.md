# GCD-Programming-Assignment
Programming assignment files for Coursera Data Science Specialization Course Getting and Cleaning Data

This repository contains the files described below:
===================================================

'README.txt'

'run_analysis.R': This is an R script that processes Samsung accelerometer data in the "Human Activity Recognition Using Smartphones Data Set" described at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones per the specifications for the programming assignment for Coursera's Data Science Specilization course Getting and Cleaning Data.

'codebook.txt':  Codebook describing features in the output tidy dataset 'summary.txt' the R scipt outputs.

Notes on run_analysis.R:
========================

run_analysis.R pulls source data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip at the UCI Machine Learning Repository and processes it into a tidy summary dataset.

To accomplish this it:

  1.  Downloads the file into the working directory and unzips the contents.
  2.  Reads 'features.txt' and 'activity_labels.txt' into R.
  3.  For the training and testing data, it reads the data, subjects and activity files.
  4.  For training and test, it subsets the features on columns only containing mean() and std() readings.
  5.  For training and test, it merges the subject, activity name, and selected columns into a data frame.
  6.  It row binds training and test into one data set called 'final'.
  7.  Using the dplyr package, a summary is created by using summarise_all() on 'final' grouped by 'Subject' and 'Activity' and outputs that as a text file 'summary.txt' into the working directory.

This project was created and submitted by Scott Harrison on August 8, 2018.
