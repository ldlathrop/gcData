# Read in the data files
trainY <- read.table("./train/Y_train.txt")
trainS <- read.table("./train/subject_train.txt")
testY <- read.table("./test/Y_test.txt")
testS <- read.table("./test/subject_test.txt")
features <- read.table("features.txt")

# Extract mean and SD
meanSD <- grep(".*mean.*|.*std.*", features[,2])
msd_names <- features[meanSD,2]
msd_names = gsub("-std", "Std", msd_names);
msd_names = gsub("-std", "Std", msd_names);
msd_names <- gsub("[-()]", "", msd_names)

# Subset the data
testX <- read.table("./test/X_test.txt")[meanSD]
trainX <- read.table("./train/X_train.txt")[meanSD]

# Apply names
colnames(testX) <- msd_names
colnames(trainX) <- msd_names

Act.names <- c('Walking', 'Walking up', 'Walking down', 'Sitting', 'Standing', 'Laying')
trainY <- Act.names[trainY$V1]
testY <- Act.names[testY$V1]

# Merge the training data into one dataframe
train_all <- cbind(trainS, trainY, trainX)

#Merge the test data into one dataframe
test_all <- cbind(testS, testY, testX)

# Merge the test and training data into one dataframe and change variable names
tt_all <- arrange(join(train_all, test_all), V1)
tt_all <- rename(tt_all, c("V1" = "Subject"))
tt_all <- rename(tt_all, c("trainY" = "Activity"))

# Extract relevant means and write tidy data to txt file
tt_all_mean <- ddply(tt_all, .(Subject, Activity), function(x) colMeans(x[, 3:80]))
write.table(tt_all_mean, "MeanData.txt", row.names = FALSE)