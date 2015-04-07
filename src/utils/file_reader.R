FileReader <- function() {
  
  fileReader = list()
  
  dataDirectory <- "../data/UCI HAR Dataset"
  trainDirectory <- paste(dataDirectory, sep="/", "train")
  testDirectory <- paste(dataDirectory, sep="/", "test")
  
  measurementsTestFile <<- paste(testDirectory, sep="/", "X_test.txt")
  activitiesTestFile <<- paste(testDirectory, sep="/", "Y_test.txt")
  subjectsTestFile <<- paste(testDirectory, sep="/", "subject_test.txt")
  measurementsTrainningFile <<- paste(trainDirectory, sep="/", "X_train.txt")
  activitiesTrainningFile <<- paste(trainDirectory, sep="/", "Y_train.txt")
  subjectsTrainningFile <<- paste(trainDirectory, sep="/", "subject_train.txt")
  featuresFile <<- paste(dataDirectory, sep="/", "features.txt")
  activityLabelsFile <<- paste(dataDirectory, sep="/", "activity_labels.txt")
  
  fileReader$read = function(filename) {
    read.table(filename)
  }
  class(fileReader) <- 'FileReader'
  fileReader
}