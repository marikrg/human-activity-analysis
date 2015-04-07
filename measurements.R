Measurements = function() {
  
  measurements = list()
  
  fileReader <- FileReader()
  
  measurements$prepareData = function() {
    
    trainningData <- fileReader$read(measurementsTrainningFile)
    testData <- fileReader$read(measurementsTestFile)
    featuresTable <- fileReader$read(featuresFile) 
    
    data <- rbind(trainningData, testData)    
    data <- defineFeatureLabels(featuresTable, data)
    data <- removeUnwantedFields(data)
    data
  }
  defineFeatureLabels = function(features, data) {
    features <- as.character(features[['V2']])
    setNames(data, features)
  }
  removeUnwantedFields = function(data) {
    regexToFilterMeanAndStandard <- "-mean\\(\\)|-std\\(\\)"
    columnNames <- colnames(data)
    meanAndStandardIndexes <- grep(regexToFilterMeanAndStandard, columnNames)
    data[, meanAndStandardIndexes]
  }
  class(measurements) <- 'Measurements'
  measurements
}