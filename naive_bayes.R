library(e1071)
library(psych)
library(rsample)
library(dplyr)    # data transformation
library(ggplot2)  # data visualization
library(caret)    # implementing with caret


df <- read.csv("path_to_grade_filtered.csv")

set.seed(123)
split <- initial_split(df, prop = .7, strata = "GRADE")
train <- training(split)
test  <- testing(split)


table(train$GRADE) %>% prop.table()
table(test$GRADE) %>% prop.table()

train %>% 
  select(MIDSEMGRADE, MIDSEMCOL, QUIZ1, QUIZ2, PART1, PART2,MIDSEM) %>% 
  gather(metric, value) %>% 
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
  method = "nb",
  trControl = train_control
)
confusionMatrix(nb.m1)

search_grid <- expand.grid(
  usekernel = c(TRUE, FALSE),
  fL = 0:5,
  adjust = seq(0, 5, by = 1)
)
nb.m2 <- train(
  x = x,
  y = y,
  method = "nb",
  trControl = train_control,
  tuneGrid = search_grid,
  preProc = c("BoxCox", "center", "scale", "pca")
)
nb.m2$results %>% 
  top_n(5, wt = Accuracy) %>%
  arrange(desc(Accuracy))
plot(nb.m2)
confusionMatrix(nb.m2)


