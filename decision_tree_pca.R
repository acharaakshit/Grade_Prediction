library(e1071)
library(psych)
library(rsample)
library(dplyr)    # data transformation
library(ggplot2)  # data visualization
library(caret)    # implementing with caret


df <- read.csv("./grade_filtered.csv")

set.seed(123)
split <- initial_split(df, prop = .7, strata = "GRADE")
train <- training(split)
test  <- testing(split)

table(train$GRADE) %>% prop.table()
table(test$GRADE) %>% prop.table()

train %>% 
  select(MIDSEMGRADE, MIDSEMCOL, QUIZ1, QUIZ2, PART1, PART2,MIDSEM) %>% 
  tidyr::gather(metric, value) %>% 
  ggplot(aes(value, fill = metric)) + 
  geom_density(show.legend = FALSE) + 
  facet_wrap(~ metric, scales = "free")
features <- setdiff(names(train), "GRADE")
x <- train[, features]
y <- as.factor(train$GRADE)

train_control <- trainControl(
  method = "cv", 
  number = 10
)
nb.m1 <- train(
  x = x,
  y = y,
  method = "ctree",
  trControl = train_control
  
)
confusionMatrix(nb.m1)

nb.m2 <- train(
  x = x,
  y = y,
  method = "ctree",
  trControl = train_control,
  preProc = c("scale","center", "pca")
)
confusionMatrix(nb.m2)

