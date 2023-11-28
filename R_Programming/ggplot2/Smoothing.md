Smoothing enables the detection of a data trend even when you cant easily notice a trend from a plotted data points. GGplot2 smotothing functionality is helpful because it adds a smoothing line as another lower to a plot. 

example code: 
ggplot(data, aes(x=distance, y= dep_delay)) + 
geom_point()+
geom_smooth()+ 


Loess smoothing
		the loess smoothing process is best for smoothing plots with less than 1000 points
Gm smoothing
		sam smoothing or generalize addditive model smoothing is useful for smoothing plots with a large number of points 

Facet (R)
lets you view smaller groups or subsets of your data
facet_warp()
facet_grid()