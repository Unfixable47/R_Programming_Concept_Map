When you make a for loop make sure to try and use as little as possible. Results should be stored in a tibble so you can call it for specific instances.

to write fast loops in R: 
- do as much as you can outside of the for loop. Every line of code will be run many times, the more that is inside of the loop the more things will run many times. Placing a line outside of a loop will only run it once. 
- Make sure that storage objects that are used are large enough to contain all results of a loop. 
