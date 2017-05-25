The assignment includes the following files:
============================================

1. The "run_analysis.R" script containing the required functions for the tasks of the assignment with explanatory comments of each step.

2. The "Codebook.md" file containing information about the variables, data and transformations used in this assignment.

3. This README.md file with a general description of this assignment and the procedings.

Dependencies
============
To run the script it is needed to set the working directory to the one where you downloaded all files.

Description
===========
First the needed files for the assignment were copied in the working directory of RStudio. Having two folders:

 -- train
 -- test

as the files were originally produced. Then all needed RStudio libraries were loaded in order to use all the functions related with the needed operations for the assignment. For instance dplyr and tidyr between others.
In the Step 1 the data sets where merged by parsing first the corresponding "train" and "test" data and binding them by the rows. Four data frames were created:

 -- subjects
 -- activities
 -- activityLabels
 -- classifiedSets

In "subjects" is the information of the subject involved in each experiment. In "activities" the information of the activity involved in each experiment. The "activityLabels" data frame contains the relation between the activiy ID and the activity description. Finally the "classifiedSets" contains all the experiments with all the computed measures.

Several transformations were implemented, as described in "Codebook.md" to make the data frames more understandable, i.e., with more descriptive column names, description names as values instead of numbers if possible and eliminating "noise" from the computed measures. Since the measured numbers where parsed as characters, it was necessary to eliminate extra white spaces. Besides the lines containing all the measures together were strimed into the different features that were measured, so far 561.
 
The data frame containing the measures was filtered since the assignment said explicitly to preserve only measures about mean or standard deviation. That was done in the script at the "Step 2 and 4" part of the file. The reason to merge steps is because to apply the filter we need to give first a string name to each column, which is not the main goal of step 2 but step 4.

The part of the script with the title "Step 3 and 4" adds a new column to the "activities" data frame containing a more descriptive name by using the "activityLabels" table and the help of an extra function that was created to map IDs with descriptions by the given ID. Besides it also renames the column names with more descriptive ones. 

Thus to generate the final data frame with the measures (previously transformed into numeric numbers), activities and subjects, it is used cbind to combine the columns.

Finally at the Step 5 part of the script, the data is grouped by activity and subject and the function "mean" applied to each column with a feature given the specified groups. The function "summarize_each" is used for that purpose.

The result data frame is written to a text file named "MeanData.txt" which is saved in the same working directory.
