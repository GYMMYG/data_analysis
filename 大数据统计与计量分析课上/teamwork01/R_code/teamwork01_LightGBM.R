library(lightgbm)
library(ROCR)

setwd("D:/桌面/data_analysis/teamwork01/R_code/")
ori_data <- read.csv("D:/桌面/data_analysis/teamwork01/R_code/uscecchini28.csv", fileEncoding = "UTF-8",stringsAsFactors = F)
#head(ori_data)
gap <- 2   #the gap between training and testing periods, 2-year gap by default
set.seed(6)

for (test_year in 2003:2003) {
  #train data
  data_train <- ori_data[ori_data[,1] >= 1991 & ori_data[,1] <= test_year - gap,]
  y_train <- data_train[,9]
  X_train <- as.matrix(data_train[,10:37]) 
  #head(X_train)
  newpaaer_train <- data_train[,8]
  
  #test data
  data_test <- ori_data[ori_data[,1] == test_year,]
  y_test <- data_test[,9]
  X_test <- as.matrix(data_test[,10:37]) 
  newpapper_test <- unique(data_test[data_test[,9] != 0,8])
  #head(newpapper_test)
  num_frauds <- sum(y_train == 1)
  y_train[newpaaer_train%in%newpapper_test] <- 0
  num_frauds <- num_frauds - sum(y_train==1)
  print(paste("num_frauds:",num_frauds))

  classiftime1 <- proc.time()  # record classification time 
  #train model
  dtrain <- lgb.Dataset(X_train,label =(y_train))
  dtest <- lgb.Dataset.create.valid(dtrain,data = X_test,label = (y_test)  )
  valids <- list(eval = dtest, train = dtrain)
  param <- list(
     'metric' = 'auc'
    ,num_leaves = 10L
    , learning_rate = 0.01
    , objective = "binary"
  )
  bst <- lgb.train(param, dtrain, nrounds = 500L, valids = valids)
  t = proc.time() - classiftime1 
  print("train_time:")
  print(t) 
  
  
  classiftime1 <- proc.time()  # record classification time 
  ptrain <- predict(bst, X_train)
  ptest  <- predict(bst, X_test)
  t = proc.time() - classiftime1 
  print("test_time:")
  print((t))
  tree_imp <- lgb.importance(bst, percentage = TRUE)
  lgb.plot.importance(tree_imp, top_n = 10L, measure = "Gain")
  pred = prediction(ptest,y_test)
  perf = performance(pred,"tpr","fpr")
  auc = performance(pred,"auc")
  auc = unlist(slot(auc,"y.values"))
  #picname = paste("roc_",test_year,".png")
  #png(file=picname, bg="white")
  plot(perf,xlim = c(0,1),ylim = c(0,1),col="red",main = paste("test_year",test_year," ROC curve (","AUC:",auc,")"),lwd = 2)
 
  #dev.off()
}

