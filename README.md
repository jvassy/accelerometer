This program downloads the zip file from the following URL:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

It then reads the data from the test subjects (n=9) and training subjects (n=21) into R. Each person has several repeated accelerometer measurements during each of 6 activities: walking, walking upstairs, walking downstairs, sitting, standing, and laying. The code merges the test and training data, keeps only those columns containing mean measurements or standard deviation measurements (total number of 85 variables), and then takes the mean of each of these 85 by each person-activity pairing. The resulting data set is then written to a text file.
