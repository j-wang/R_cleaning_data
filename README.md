## Getting and Cleaning Data Course Project

### Requirements / Warnings
1. run_analysis.R script requires the "reshape" package by Hadley Wickham. If it is not installed on your computer, the script will automatically install "reshape" from CRAN.
2. The script also requires that the unzipped **UCI HAR Dataset** (with that exact folder name) is in R's current working directory. If you need this dataset, it is found in zipped form [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

### How to Run this Analysis
Make sure you have the UCI HAR Dataset folder in your R working directory. It is included in this repo for convenience, so all you need to do is set your working directory (`setwd`) to your local repo directory.

run_analysis.R contains the code necessary to run the analysis that combined and subsets the UCI data.
```r
source(run_analysis.R)
```
As mentioned above, the script will automatically check if you have the reshape package installed, and will install it if you do not have it.

### Data Description
Project cleaning and presenting data from UCI's Machine Learning Repository. Specifically, "Human Activity Recognition Using Smartphones Data Set" found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

### Further information
Further information about the cleaned data can be found in CODEBOOK.md in this repo.
