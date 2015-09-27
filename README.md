# getdata_courseproject
## Readme
1. Two vectors with the filenames where the data is stored for the train and test sets
2. Create a list of the train set using lapply to loop through the vector of filenames and read.table as the function applied to each name
3. Convert the list into a dataframe
4. Repeat 2 and 3 for the test set
5. Merge the train and test set using rbind
6. Create a filter vector of column indices for the subject,activity, mean and standard deviation of each measurement
7. Create another dataset using the filter vector to select the desired columns
8. Make the activity variable a vector where each level  is the name of the activity
9. Create a vector of variable names
10. Set the variable names of the new dataset
11. 
