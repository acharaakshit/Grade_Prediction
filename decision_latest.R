library(caret)
df <- read.csv("/home/akshit/Documents/Downloads/gradenew.csv")

library(caTools)

set.seed(12345)
sample = sample.split(df$GRADE,SplitRatio = 0.60)
train <- subset(df,sample == TRUE) # creates a training dataset named train1 with rows which are marked as TRUE
test <- subset(df, sample == FALSE)


library(party)
input <- train
png(file = "decision_tree.png")

output.tree <- ctree(
  GRADE ~ MIDSEM + MIDSEMGRADE + MIDSEMCOL + QUIZ1 + QUIZ2 + PART1 + PART2  , 
  data = input)
plot(output.tree)
dev.off()

library (rpart)

#training_accuracy

rpartMod <- rpart(GRADE ~  MIDSEM +MIDSEMGRADE+MIDSEMCOL+QUIZ1+QUIZ2+PART1+PART2,data = train, method = "class")  # build the model

printcp(rpartMod)  # print the cptable

out <- predict(rpartMod) # predict probabilities

pred.response <- colnames(out)[max.col(out, ties.method = c("random"))] # predict response

mean(train$GRADE != pred.response)

#test_accuracy

rpartMod <- rpart(GRADE ~  MIDSEM +MIDSEMGRADE+MIDSEMCOL+QUIZ1+QUIZ2+PART1+PART2,data = test, method = "class")  # build the model

printcp(rpartMod)  # print the cptable

out <- predict(rpartMod) # predict probabilities

pred.response <- colnames(out)[max.col(out, ties.method = c("random"))] # predict response

mean(test$GRADE != pred.response)


