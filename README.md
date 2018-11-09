# Academic_Data_Analysis_and_Prediction_using_R

This repository contains analysis and prediction of a student's final grade using different Machine Learning methodologies and  the data  contains the student's mid-semester performance along with some other  academic information.


The data is in the csv file named grade1.csv. 
The given data is taken for 205 students.
It contains the following coloumns- IDNO, YEAR, ATTENDANCE %, CGPA, MidSemester, MidSemester Grades, MidSemester Collection, Quiz1, Quiz2, Part A, Part B and Grade.

PREPROCESSING OF THE DATA:
(i)All the coloumns with very less values will be removed.Like 'CGPA' has only 40 values.
(ii)Using the correlation matrix,the coloumns which had very low correlation values will be removed.
(iii)The final correlation matrix will calculated after removing irrelevant coloumns.
(iv)A heat map will be plotted for better understanding of the correlation matrix.



The following methods were used to analyze and predict the final grades:
1.Naive Bayes
2.Decision Trees
3.Neural Networks
4.Linear SVM

Then a barplot is plotted to compare the training and generalization accuracies of all the methods.

To install the required packages,run the script -> install.R
If it doesn't work,then install the packages individually using -> install.packages("package_name")
