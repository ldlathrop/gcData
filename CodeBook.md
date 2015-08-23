---
title: "Getting and Cleaning Data Course Project"
author: "Lesley Lathrop"
date: "August 23, 2015"
output: html_document
---

##Description
This code book describes the data and transformations for the files in this repository. The .txt file is a condensed file taken from data that can be found at this [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

#Data and variables
The original data sets comprised 562 variables detailing a multitude of exercise-related measurements on various subjects. A full description of the study may be found at this [link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The data in the .txt file in this repository represents an analysis of the original data. It comprises 126 observations for 80 variables associated with the means and standard deviations of the original data.

#Data transformation
The original data were transformed as follows:
1. The files were first read into R from the directory
2. The variables containing data on means and standard deviations for the various measurements were subsetted.
3. Variable names were inserted into the data set.
4. Activity labels were inserted into their corresponding rows.
5. The individual data sets were compiled into a single data set.
6. A new data set was extracted that took the means for each variable according to activity type and subject.
7. The new data set was written to the .txt that is held within this repository