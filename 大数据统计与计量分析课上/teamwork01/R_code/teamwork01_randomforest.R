library(randomForest)
library(ROCR)

setwd("D:/桌面/data_analysis/teamwork01/resourse/")
ori_data <- read.csv("D:/桌面/data_analysis/teamwork01/R_code/uscecchini28.csv", fileEncoding = "UTF-8",stringsAsFactors = F)
#head(ori_data)

gap <- 2   #the gap between training and testing periods, 2-year gap by default
set.seed(6)

for (test_year in 2003:2003) {
  #train data
  data_train <- ori_data[ori_data[,1] >= 2001 & ori_data[,1] <= test_year - gap,]
  y_train <- data_train[,9]
  X_train <- data_train[,10:37]
  #head(X_train)
  newpaaer_train <- data_train[,8]

  # test data
  data_test <- ori_data[ori_data[,1] == test_year,]
  y_test <- data_test[,9]
  X_test <- (data_test[,10:37])
  newpapper_test <- unique(data_test[data_test[,9] != 0,8])
  head(newpapper_test)
  num_frauds <- sum(y_train == 1)
  y_train[newpaaer_train%in%newpapper_test] <- 0
  num_frauds <- num_frauds - sum(y_train==1)
  print(paste("num_frauds:",num_frauds))
  
  classiftime1 <- proc.time()  # record classification time 
  #train model
  data.rf <- randomForest(as.factor(y_train)~ .,data = X_train,
                          na.action = na.roughfix, importance = TRUE,
                          proximity = TRUE,ntree = 100)
  # summary(data.rf)
  # importance(data.rf)
  ptest = predict(object = data.rf,newdata = X_test,type = "prob")[,2]
  ptest
  #MDSplot(data.rf, data.rf$misstate)
  t = proc.time() - classiftime1 
  print("train_time:")
  print(t) 
  
  # #test model
  # classiftime1 <- proc.time()  # record classification time 
  # 
  # t = proc.time() - classiftime1 
  # print("test_time:")
  # print((t))
  
  
 
  pred = prediction(ptest,y_test)
  perf = performance(pred,"tpr","fpr")
  auc = performance(pred,"auc")
  auc = unlist(slot(auc,"y.values"))
  #picname = paste("roc_",test_year,".png")
  #png(file=picname, bg="white")
  plot(perf,xlim = c(0,1),ylim = c(0,1),col="red",main = paste("test_year",test_year," ROC curve (","AUC:",auc,")"),lwd = 2)
  
  #dev.off()
}

