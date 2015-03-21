FileReader <- function() {
  
  dataDirectory <- "./UCI HAR Dataset"
  trainDirectory <- paste(dataDirectory, sep="/", "train")
  testDirectory <- paste(dataDirectory, sep="/", "test")
  
  fileReader = list()
  
  fileReader$readMeasurementTestTable = function() {
    read.table(paste(testDirectory, sep="/", "X_test.txt"))
  }
  fileReader$readActivityTestTable = function() {
    read.table(paste(testDirectory, sep="/", "Y_test.txt"))
  }
  fileReader$readSubjectTestTable = function() {
    read.table(paste(testDirectory, sep="/", "subject_test.txt"))
  }
  fileReader$readMeasurementTrainningTable = function() {
    read.table(paste(trainDirectory, sep="/", "X_train.txt"))
  }
  fileReader$readActivityTrainningTable = function() {
    read.table(paste(trainDirectory, sep="/", "Y_train.txt"))
  }
  fileReader$readSubjectTrainningTable = function() {
    read.table(paste(trainDirectory, sep="/", "subject_train.txt"))
  }
  fileReader$readFeaturesTable = function() {
    read.table(paste(dataDirectory, sep="/", "features.txt"))
  }
  fileReader$readActivityLabelsTable = function() {
    read.table(paste(dataDirectory, sep="/", "activity_labels.txt"))
  }
  class(fileReader) <- 'FileReader'
  fileReader
}