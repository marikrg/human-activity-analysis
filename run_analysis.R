source('./file_reader.R')

AccelerometerDataAnalyzer <- function() {
  
  dataAnalyzer = list()
  fileReader <- FileReader()
  
  dataAnalyzer$createTidyDataSet = function() {
    
    measurements <- rbind(fileReader$readMeasurementTrainningTable(), fileReader$readMeasurementTestTable())
    measurements <- defineFeatureLabels(fileReader$readFeaturesTable(), measurements)
    measurements <- removeUnwantedFields(measurements)
    
    activities <- rbind(fileReader$readActivityTrainningTable(), fileReader$readActivityTestTable())
    activities <- defineActivityLabelByID(activities, fileReader$readActivityLabelsTable())
    
    subject <- rbind(fileReader$readSubjectTrainningTable(), fileReader$readSubjectTestTable())
    subject <- defineSubjectFriendlyColumnName(subject)
    
    data <- cbind(subject, activities, measurements)
    tidyData <- aggregateRawDataByActivityAndSubject(data)
    
    saveTidyData(tidyData)
    tidyData
  }
  defineFeatureLabels = function(features, measurements) {
    features <- as.character(features[['V2']])
    setNames(measurements, features)
  }
  removeUnwantedFields = function(measurements) {
    regexToFilterMeanAndStandard <- "-mean\\(\\)|-std\\(\\)"
    columnNames <- colnames(measurements)
    meanAndStandardIndexes <- grep(regexToFilterMeanAndStandard, columnNames)
    measurements[, meanAndStandardIndexes]
  }
  defineActivityLabelByID = function(activities, labels) {
    labelMap <- as.character(labels[[2]])
    names(labelMap) <- as.numeric(labels[[1]])
    activities$activityName <- apply(activities, 1, FUN = function(x) as.character(labelMap[[as.numeric(x[[1]])]]))
    activities[[1]] <- NULL
    activities
  }
  defineSubjectFriendlyColumnName = function(subject) {
    setNames(subject, c("subject"))
  }
  aggregateRawDataByActivityAndSubject = function(data) {
    tidyData <- aggregate(data, by=list(activity = data$activityName, subjectId=data$subject), mean)
    tidyData$activityName <- NULL
    tidyData$subject <- NULL
    tidyData
  }
  saveTidyData = function(tidyData) {
    write.table(tidyData, "./tidy_data.txt", row.name=FALSE)
  }
  class(dataAnalyzer) <- 'AccelerometerDataAnalyzer'
  dataAnalyzer
}