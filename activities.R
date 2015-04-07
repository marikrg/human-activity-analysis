Activities = function() {
  
  activities = list()
  
  fileReader <- FileReader()
  
  activities$prepareData <- function() {
    
    trainningData <- fileReader$read(activitiesTrainningFile)
    testData <- fileReader$read(activitiesTestFile)
    activitiesLabels <- fileReader$read(activityLabelsFile) 
    
    data <- rbind(trainningData, testData)
    data <- defineActivityLabelByID(data, activitiesLabels)
    data
  }
  defineActivityLabelByID = function(activities, labels) {
    labelMap <- as.character(labels[[2]])
    names(labelMap) <- as.numeric(labels[[1]])
    activities$activityName <- apply(activities, 1, FUN = function(x) as.character(labelMap[[as.numeric(x[[1]])]]))
    activities[[1]] <- NULL
    activities
  }
  class(activities) <- 'Activities'
  activities
}