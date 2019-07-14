library(caret)
library(e1071)
library(rpart)
library(rpart.plot)
library(class)
library(ROCR)
library(pROC)


df = read.csv("df.csv")
df
df$event
set.seed(1)
trainIndex <- createDataPartition(df$Events, p=.8, list=FALSE)
Train <- df[trainIndex,]
Test <- df[-trainIndex,]
df$Events <- factor(df$Events, levels = c(0,1), labels = c("Not rain","Rain"))


## Naive Bayes Classifier
model_nv <- naiveBayes(Events~., data=Train, laplace=1)
pred <- predict(model_nv, newdata=Test)
confusionMatrix(data=pred, reference=Test$Events, positive="Rain")

pr1 <- predict(model_nv, newdata = Test, type="raw")
P_test <- prediction(pr1[,2], Test$Events)
perf <- performance(P_test,"tpr","fpr")
plot(perf)
performance(P_test,"auc")@y.values

## Decision Tree
model_dt <- rpart(Events~., data=Train)
prp(model_dt, type=1, extra=1)
pred_class <- predict(model_dt, Test, type="class")
confusionMatrix(pred_class, Test$Events)

pr2 <- predict(model_dt, Test)
P_test <- prediction(pr2[,2], Test$Events)
perf <- performance(P_test,"tpr","fpr")
plot(perf)
performance(P_test,"auc")@y.values

## KNN

scaled_train <- as.data.frame(scale(Train))
scaled_test <- as.data.frame(scale(Test))
model_knn <- knn(scaled_train, scaled_test, Train$Events, k=21)
confusionMatrix(model_knn, Test$Events)

knn_p <- knn(scaled_train, scaled_test, Train$Events, k=21, prob=T)
a <- multiclass.roc(Test$Events,as.ordered(knn_p))
a$auc
