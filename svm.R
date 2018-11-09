library(caret)
df <- read.csv("path_to_gradefiltered.csv")
png(file = "svm.png")
plot(df, pch=16)
dev.off()

set.seed(3033)
split <- createDataPartition(y = df$GRADE, p= 0.7, list = FALSE)
train <- df[split,]
test <- df[-split,]

train[["GRADE"]] = factor(train[["GRADE"]])
test[["GRADE"]] = factor(test[["GRADE"]])

trctrl <- trainControl(method = "repeatedcv", number = 10, repeats = 3)
set.seed(3233)

svm_Linear <- train(GRADE ~., data = train, method = "svmLinear",
                    trControl=trctrl,
                    preProcess = c("center", "scale"),
                    tuneLength = 10)
svm_Linear

test_pred <- predict(svm_Linear, newdata = test)

confusionMatrix(test_pred,test$GRADE)

trctrl <- trainControl(method = "repeatedcv", number = 10, repeats = 3)
set.seed(3233)

svm_Linear <- train(GRADE ~., data = train, method = "svmLinear",
                    trControl=trctrl,
                    preProcess = c("center", "scale","pca"),
                    tuneLength = 10)
svm_Linear

test_pred <- predict(svm_Linear, newdata = test)

confusionMatrix(test_pred,test$GRADE)
