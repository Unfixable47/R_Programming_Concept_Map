The `summary()` function in R provides summary statistics of the main features of an object. The output of this function varies depending on the type of object passed to it.

1. **For Numeric Vectors**:
   - It returns the minimum, 1st quartile, median, mean, 3rd quartile, and maximum.

2. **For Factors**:
   - It gives the counts of each level.

3. **For Data Frames**:
   - It applies the summary function component-wise and combines the results, which means for numeric columns you'd get the numeric summary and for factor columns, you'd get the factor summary.

4. **For Linear Models (`lm` objects)**:
   - It returns extensive diagnostic information about the model.

### Example:

Let's consider a simple use case with the built-in `mtcars` dataset:

```R
# Load the mtcars dataset
data(mtcars)

# Get the summary of the dataset
summary(mtcars)
```

Output (abbreviated):

```
      mpg             cyl             disp             hp       
 Min.   :10.40   Min.   :4.000   Min.   : 71.1   Min.   : 52.0  
 1st Qu.:15.42   1st Qu.:4.000   1st Qu.:120.8   1st Qu.: 96.5  
 Median :19.20   Median :6.000   Median :196.3   Median :123.0  
 Mean   :20.09   Mean   :6.188   Mean   :230.7   Mean   :146.7  
 3rd Qu.:22.80   3rd Qu.:8.000   3rd Qu.:326.0   3rd Qu.:180.0  
 Max.   :33.90   Max.   :8.000   Max.   :472.0   Max.   :335.0  
... (further output truncated for brevity) ...
```

The `summary()` function, in this case, provides statistics for each column in the `mtcars` data frame. It's a quick way to get a sense of the distribution and basic statistics of each variable in a dataset.