This codebook describes the data set "datacast.txt" that results from the "run_analysis.R" script in this repo.

This data set contains accelerometer data from 30 people who wore Samsung accelerometers during 6 activities: walking, walking upstairs, walking downstairs, standing, sitting, and lying down.  Several measurements were recorded from the accelerometers during these activities, 85 of which were summarized as means and standard deviations.  This data set presents the means of these 85 measurements for each of the 180 (30 x 6) person-activity pairs. 

The first two column names are as follows:

id: Subject ID, ranging from 1-30
activity: Activity during which measurement were taken (with values Walking, WalkUpstairs, WalkDownstairs, Sitting, Standing, Laying)

The final 85 columns are the mean accelerometer measurements taken during the activities, with names such as "tBodyAccmeanY", "tBodyGyroJerkMagstd", and "angletBodyAccMeangravity".

The following transformations were used to generate this data set:
1. Data were downloaded from website and read into R.
2. Test data and training data were each merged by subject ID and activity
3. Test and training data were combined for a total of 30 subject ID's, each with 6 activities
4. Measurement column names and activity labels were read into R and assiged to the data set.
5. Data were subsetted to only include measurements that were means or standard deviations (containg "Mean", "mean", or "std" in name).
6. Punctuation was removed from column names: )-,(
7. Table was melted into a table of the mean of each measurement for each ID-activity pair.
8. Data table was written to a .txt file.


