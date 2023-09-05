library(caret)
library(neuralnet)

df <- read.csv("./grade_filtered.csv")

samplesize = 0.60 * nrow(df)
set.seed(80)
index = sample( seq_len ( nrow ( df ) ), size = samplesize )

# Create training and test set
train = data[ index, ]
test = data[ -index, ]

max = apply(df , 2 , max)
min = apply(df, 2 , min)
scaled = as.data.frame(scale(df, center = min, scale = max - min))

trainNN = scaled[index , ]
testNN = scaled[-index , ]

set.seed(5)
NN = neuralnet(GRADE ~ MIDSEM + MIDSEMGRADE + MIDSEMCOL + QUIZ1 + QUIZ2 + PART1 + PART2 ,data=train,hidden=3, linear.output = T )
plot(NN)
dev.off()

