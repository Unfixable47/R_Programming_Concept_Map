ggplot2- you can use ggplot2 on its own or enhance it with other packages. 
		Create differnt type of plots 
		Customize the look and feel of plots
		Creat high quality visuals
		Combine ata manipulation and visulization using the pipe operator
			the below are some packages that can enhance the ggplot2 experiance.
				Plotly
				Lattice
				RGL
				Dygraphs
				Leaflet
				Highscharter
				Patchwork
				gganimate
				ggridges

Aesthetics 
		a visula property of an object of your plot
Geoms 
		the geometric object used to represent your data (bar chart,line, pie)
			to create a plot with ggplot2 you first chose a dataset. Then you determine how tovisually organize your data on a coordinate system by choosing a geom to represent your data points and aethetics to map 

Facets
		let you display smaler groups of your data or subsets
Labels and Annotations 
		let you customize your plot and add text to communicate the purpose of your plot.

ggplot(data=penguins)+(geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g))+
facet_wrap(~species)
		the facet function uses the ~ to select the variable you wish to use as a facet

ggplot(data=penguins,,aws(x=flipper_length_mm,y=body_mass_g))+
	geompoint(aes(color=species))+
	facet+wrap(~species)
![[Pasted image 20221020122650.png]]

ggplot(data=diamonds)+
	geom_bar(mapping=aes(x=color,fill=cut))+
	facet_wrap(~cut)
![[Pasted image 20221020122859.png]]

to facet you plot with more than two variables use the facet_grid()
ggplot(data=penguins,,aws(x=flipper_length_mm,y=body_mass_g))+
	geompoint(aes(color=species))+
	facet_grid(sex~species)
![[Pasted image 20221020123053.png]]

ggplot(data=penguins): in ggplot2 you being a plot with ggplot() function. the ggplot() functions creates a coorinate system that you can add layers to . the first argument of the ggplot() function is a dataset to use in the plot in this case, it's penguins.
+ then you add "+" symbol to add a new layer to your plot. You complete your plot by adding one or more layers to ggplot( )

geom_point(): nect you coose a goem by adding ta geom function. the geom_point function uses a points to create scatterplots, the geom_bar function uses bars to create bar charts, and so on. In this case , Choose the geom_point functio to create a scatter plot of point. the ggplot package come with many different geom functions

goem_point( function uses points)
Mapping(R)
		matching up a specific variable in your dataset with a specific aethetic
				you can map a variable to the x or y axis of your plot 
				https://www.statology.org/plot-categorical-data-in-r/

to create a plot follow these three steps
1. start with the ggplot function and choose a dataset to work with
2. add a geom_function to display your data
3. map the variables you want to plots in the arguments in AES functions 
	TEMPLATE
	ggplot(data=<DATA>)+          
		<GOEM_FUNCTION> (mapping=aes(<AESTHETIC MAPPINGS>))

Common coding errors in GGplot2
	R is case sensitive: remeber to be careful of cases when typing
	
	Balancing parentthese and quatation marks makes, makes sure you always using closing marks or brackets
	
	Using the plus sign to add layers: in GGplot2 you need to add a plus sign to add a new layer to your plot. Putting the plus sign in wrong place is a common mistake 
			Error: 'data' must be a data frame, or other object coercible by 'fortify()', not an s3 object with class gg/ggplot
	R Documentation
	R has build in documentation for all functions and packages to learn about documentation in R function just the code ?function_name 
[[Basics of R]]
[[tidyverse]]


