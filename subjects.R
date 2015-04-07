Subjects = function() {
  
  subjects = list()
  
  fileReader <- FileReader()
  
  subjects$prepareData = function() {
    
    trainningData <- fileReader$read(subjectsTrainningFile)
    testData <- fileReader$read(subjectsTestFile)
    
    data <- rbind(trainningData, testData)
    data <- defineSubjectFriendlyColumnName(data)
    data
  }
  defineSubjectFriendlyColumnName = function(subject) {
    setNames(subject, c("subject"))
  }
  class(subjects) <- 'Subjects'
  subjects
}