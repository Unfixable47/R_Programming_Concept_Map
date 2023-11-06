
###Iris Analysis

###Vincent

###2023-09-21

##About


The iris dataset is one of the most famous and widely used datasets in statistics and machine learning. Introduced by the British biologist and statistician Ronald A. Fisher in his 1936 paper “The use of multiple measurements in taxonomic problems”, the dataset has been a staple for teaching and research in pattern recognition and data analysis.

Fisher introduced the dataset to demonstrate linear discriminant analysis, a method used to distinguish between objects belonging to different categories or classes based on their features.

The dataset consists of 150 samples from each of three species of iris flowers (setosa, versicolor, and virginica). Four features were measured from each sample: the lengths and the widths of the sepals and petals, in centimeters.

Sepal.Length: Length of the sepal in cm. Sepal.Width: Width of the sepal in cm. Petal.Length: Length of the petal in cm. Petal.Width: Width of the petal in cm. Species: The species of the flower (setosa, versicolor, virginica).

The iris dataset is straightforward, but it provides a solid foundation for exploring basic principles in machine learning and statistics. There’s a clear distinction between the setosa species and the other two species, but versicolor and virginica overlap in the feature space, making it a bit challenging but interesting.

Question 1
1. Provide a summary of the dataset, highlighting the mean, median, and range for each measurement (sepal length, sepal width, petal length, petal width) for each species.
```
iris_summary <- iris %>%
  group_by(Species) %>%
  summarize(
    Mean_Sepal.Length = mean(Sepal.Length),
    Median_Sepal.Length = median(Sepal.Length),
    Min_Sepal.Length = min(Sepal.Length),
    Max_Sepal.Length = max(Sepal.Length),
    
    Mean_Sepal.Width = mean(Sepal.Width),
    Median_Sepal.Width = median(Sepal.Width),
    Min_Sepal.Width = min(Sepal.Width),
    Max_Sepal.Width = max(Sepal.Width),
    
    Mean_Petal.Length = mean(Petal.Length),
    Median_Petal.Length = median(Petal.Length),
    Min_Petal.Length = min(Petal.Length),
    Max_Petal.Length = max(Petal.Length),
    
    Mean_Petal.Width = mean(Petal.Width),
    Median_Petal.Width = median(Petal.Width),
    Min_Petal.Width = min(Petal.Width),
    Max_Petal.Width = max(Petal.Width)
  )

```
Question 2 & Question 3
2. Plot the distribution of each measurement (sepal length, sepal width, petal length, petal width) using histograms. Color the histograms based on species.
3. Determine which species has the highest average petal length.
The Species with the highest average Petal length is Virginica. See Figure 3 for the details.
## [[1]]
![image](https://github.com/Unfixable47/Lab1/assets/137025578/d9df2aca-dd45-4ef8-8500-774ff508e8ef)


## 
## [[2]]
![image](https://github.com/Unfixable47/Lab1/assets/137025578/1c943385-2d14-4c6a-a890-c6cf74ca083d)


## 
## [[3]]
![image](https://github.com/Unfixable47/Lab1/assets/137025578/667d5a4b-211c-44f1-847b-1100048a31e6)



## 
## [[4]]
![image](https://github.com/Unfixable47/Lab1/assets/137025578/c93a6784-c1c7-489d-8233-a155609b5bba)



 ## Question 4

4. Identify any potential outliers in sepal width for each species using a boxplot.
Within the Iris data set there is 4 total outliers within sepal width. Two outliers within the setorsa, and two outliers within viriginica.

![image](https://github.com/Unfixable47/Lab1/assets/137025578/5776ff4e-6606-4607-b289-8db8f7bb8e2b)


 ## Question 5

5. Using a scatter plot, visualize the relationship between sepal length and petal length. Color the points based on species and fit a linear regression line to the plot.
![image](https://github.com/Unfixable47/Lab1/assets/137025578/152a97d6-696d-4162-a00d-3833e5ff19bc)


Question 6

6. Calculate the correlation coefficient between sepal length and petal length for each species.

```
## # A tibble: 3 × 2
##   Species    correlation
##   <fct>            <dbl>
## 1 setosa           0.267
## 2 versicolor       0.754
## 3 virginica        0.864
```
