# Grade_Prediction

This repository contains analysis and prediction of a student's final grade using different Machine Learning methodologies and the data contains the student's mid-semester performance and other academic information.


## Installation:

    - Install the "requiRements" package:
        - install.packages("requiRements")
    - Install all the other dependencies:
        - Run install.R

## Details:

### Data:
The data is in the csv file named `grade1.csv`.
The data is available for 205 students.
It contains the following coloumns:  
**IDNO, YEAR, ATTENDANCE %, CGPA, MidSemester, MidSemester Grades, MidSemester Collection, Quiz1, Quiz2, Part A, Part B and Grade**.

## Data Processing:
    - All the coloumns with very less values will be removed. Like 'CGPA' has only 40 values.
    - Using the correlation matrix (`correlation.R`), the coloumns which had very low correlation values will be removed.
    - The final correlation matrix is computed after removing irrelevant coloumns.
    - A heat map (`heatmap.R`) can be generated for better understanding of the correlation matrix.

### Methods:
The following methods were used to analyze and predict the final grades:  
1. **Naive Bayes**  
    - Run `naive_bayes.R`
2. **Decision Trees**  
    - Run `decision_tree.R`
    - PCA processed Run `decision_tree_pca.R`
3. **Neural Networks**
    - Run `neuralnet.R`
4. **Linear SVM**  
    - Run `svm.R`

### Comparison
Compare all methods by running `barplot.R`.
