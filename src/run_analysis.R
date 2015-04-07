source('utils/file_reader.R')
source('measurements.R')
source('activities.R')
source('subjects.R')

runAnalysis = function() {
  
  dataAnalyzer <- AccelerometerDataAnalyzer()
  dataAnalyzer$createTidyDataSet()
}

AccelerometerDataAnalyzer = function() {
  
  dataAnalyzer = list()
  
  fileReader <- FileReader()
  measurements <- Measurements()
  activities <- Activities()
  subjects <- Subjects()
  
  dataAnalyzer$createTidyDataSet = function() {
    
    measurementData <- measurements$prepareData()
    activitiesData <- activities$prepareData()
    subjectData <- subjects$prepareData()
    
    data <- cbind(subjectData, activitiesData, measurementData)
  
    tidyData <- aggregateDataByActivityAndSubject(data)
    saveTidyData(tidyData)
    tidyData
  }
  aggregateDataByActivityAndSubject = function(data) {
    tidyData <- aggregate(data, by=list(activity = data$activityName, subjectId=data$subject), mean)
    tidyData$activityName <- NULL
    tidyData$subject <- NULL
    tidyData
  }
  saveTidyData = function(tidyData) {
    write.table(tidyData, "../data/tidy_data.txt", row.name=FALSE)
  }
  class(dataAnalyzer) <- 'AccelerometerDataAnalyzer'
  dataAnalyzer
}