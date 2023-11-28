
- This data need to be joined with Collective Bargaining table left join on the
 mentioned table, as it contains a larger set of data than Collective Bargaining.
 - The more comprehensive data sets from this data base is TUDR, CBCR, workplacerights. (unsurprising because these where sources directly from the ILO's website)

Dot plot and cor test between union density and compliance 
Dot plot and cor test between union density and compliance 


The summary of your linear regression model provides several key pieces of information about the relationship between `FACB` and `Collective Bargaining Coverage`. Let's break down the important parts:

### 1. Coefficients:

- **Intercept (27.695)**: When `FACB` is 0, the expected value of `Collective Bargaining Coverage` is approximately 27.695. However, this interpretation is only meaningful if a value of 0 for `FACB` makes sense within your data's context.
    
- **FACB (-2.306)**: This coefficient indicates that for every one-unit increase in `FACB`, there is an expected decrease of about 2.306 units in `Collective Bargaining Coverage`, assuming other factors are constant. The negative sign suggests an inverse relationship between the two variables.
    

### 2. Standard Error:

- The standard error measures the accuracy of the coefficients. Lower values indicate more precise estimates. In your model, the standard error for the `FACB` coefficient is 1.184.

### 3. t-value and Pr(>|t|):

- These values are used for testing the hypothesis that the coefficient is different from zero (no effect). A larger absolute t-value and a smaller p-value suggest stronger evidence against the null hypothesis.
    
- For `FACB`, the t-value is -1.948, and the p-value is 0.0575. This p-value is close to the common alpha level of 0.05, suggesting that the relationship between `FACB` and `Collective Bargaining Coverage` is marginally statistically significant.
    

### 4. Residual Standard Error:

- This is the average amount that the response will deviate from the true regression line. It's 16.93 for your model.

### 5. R-squared:

- The R-squared value is 0.0762, which means that about 7.62% of the variability in `Collective Bargaining Coverage` is explained by `FACB`. This is not a very high value, indicating a weak linear relationship.

### 6. F-statistic and its p-value:

- The F-statistic tests the overall significance of the model. Here, it's 3.794 with a p-value of 0.05754. This indicates that the model is not very strongly supported by the data, as the p-value is slightly above the conventional threshold of 0.05.

### Conclusion:

Based on this analysis, `FACB` appears to have a marginal and negative influence on `Collective Bargaining Coverage`, but the overall explanatory power of the model is low. This suggests that while there might be a relationship, `FACB` alone does not strongly predict `Collective Bargaining Coverage`. You might consider exploring additional variables or a different type of model to better understand this relationship.







## Revised Analysis on full combined Analysis
Based on the updated results from your full dataset, we can see a clearer picture of the relationship between `FACB` and `Collective Bargaining Coverage`. Let's interpret these results:

### Correlation Analysis
- The correlation coefficient between `FACB` and `Collective Bargaining Coverage` is approximately -0.328. This suggests a moderate negative linear relationship between the two variables. As `FACB` increases, `Collective Bargaining Coverage` tends to decrease, but the relationship is not very strong.

### Scatter Plot
- Although the scatter plot code has been executed, its visual output isn't displayed here. However, a scatter plot generally helps in visually confirming the presence and nature of the relationship indicated by the correlation coefficient.

### Regression Analysis (model2)
1. **Coefficients**:
   - **Intercept (27.1728)**: When `FACB` is 0, the expected value of `Collective Bargaining Coverage` is about 27.1728.
   - **FACB (-2.9232)**: This suggests a negative relationship. For each unit increase in `FACB`, `Collective Bargaining Coverage` is expected to decrease by approximately 2.9232 units.

2. **Standard Error**:
   - The standard error for the `FACB` coefficient is 0.5425, indicating a reasonably precise estimate.

3. **t-value and Pr(>|t|)**:
   - The t-value for `FACB` is -5.388, with a very small p-value (1.69e-07). This provides strong evidence against the null hypothesis and suggests that the relationship between `FACB` and `Collective Bargaining Coverage` is statistically significant.

4. **Residual Standard Error**:
   - The value is 16.36, indicating the average distance of the data points from the fitted regression line.

5. **R-squared**:
   - The R-squared value is 0.1075, meaning that about 10.75% of the variability in `Collective Bargaining Coverage` can be explained by `FACB`. While this is an improvement over the previous model, it still suggests that other factors might be contributing to the variability in `Collective Bargaining Coverage`.

6. **F-statistic**:
   - The F-statistic is 29.03 with a very small p-value, indicating that the model is statistically significant.

### Conclusion:
The updated analysis with the full dataset provides stronger evidence of a negative relationship between `FACB` and `Collective Bargaining Coverage`. The correlation is moderate and negative, and the regression analysis confirms this relationship with statistical significance. However, the R-squared value, although improved, is still relatively low, suggesting that other variables may also be important in explaining `Collective Bargaining Coverage`.


### Part 3
Now that you have provided the summary of your multiple regression model (`model3`) and generated pairwise plots using `GGally`, let's interpret these results:

### Regression Model (`model3`) Interpretation:

1. **Coefficients**:
   - **Intercept (7.13588)**: This is the expected value of `Collective Bargaining Coverage` when both `FACB` and `Union Density` are 0.
   - **FACB (0.45923)**: The coefficient for `FACB` is not statistically significant (p-value: 0.367010). This suggests that `FACB` does not have a significant impact on `Collective Bargaining Coverage` when controlling for `Union Density`.
   - **Union Density (0.39566)**: This coefficient is significant (p < 2e-16). It indicates that for each unit increase in `Union Density`, `Collective Bargaining Coverage` increases by approximately 0.39566 units, holding `FACB` constant.

2. **Model Fit**:
   - **Residual Standard Error (12.86)**: This is the average distance that the observed values fall from the regression line.
   - **Multiple R-squared (0.4507)**: Approximately 45.07% of the variability in `Collective Bargaining Coverage` is explained by the model. This is a substantial improvement compared to the single-variable model.
   - **F-statistic (98.48)**: The model is statistically significant (p < 2.2e-16), indicating that it provides a better fit than a model with no predictors.

### Pairwise Plots (GGally):

- The `ggpairs` function generates a matrix of scatter plots for each pair of variables. While I can't visualize the plots here, they typically show:
   - **Scatter plots** for each pair of variables, which help in visually assessing the relationships.
   - **Density plots** on the diagonal, showing the distribution of each variable.
   - **Correlation coefficients** in the upper right corner, providing a numerical summary of the relationship strength.

### Conclusion:

The regression model suggests that `Union Density` is a significant predictor of `Collective Bargaining Coverage`, while `FACB` does not have a significant independent effect when controlling for `Union Density`. The correlation matrix and the pairwise plots can offer additional insights into how these variables interact with each other, both individually and in combination. This comprehensive analysis provides a deeper understanding of the dynamics among these three factors in your dataset.






