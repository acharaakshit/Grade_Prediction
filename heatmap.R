data <- read.csv("./grade_filtered.csv")
d <- data.frame(MIDSEM = data$MIDSEM,
                MIDSEMGRADE = data$MIDSEMGRADE,
                MIDSEMCOL = data$MIDSEMCOL,
                QUIZ1 = data$QUIZ1,
                QUIZ2=data$QUIZ2,
                PART1=data$PART1,
                PART2 = data$PART2,
                GRADE = data$GRADE)
t <- cor(d) 

library(corrplot)

corrplot(t,type="lower",order = "hclust", t1.col = "black",t1.srt = 45)

