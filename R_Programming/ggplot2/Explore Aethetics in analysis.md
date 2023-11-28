[[Visualization Basics IN R and Tidyverse]]

With aesthetics you can highlight key points and communicate more easily and effetively

mapping = aes determines the a athetics of the plot 
adding code to the inside of the parethesis of the aes function allows to change or edit the colors.
		<color> = species
				the tells Rstudio to give a different color for each peice of data underneth species
						<shape> = species
							will make different collors for differen speicies
						<size> = species
							will change the size of each point for each peice of data 

if want to change everything variable color so that it uniform set the <aesthic> to outside of the <aes> function. This will make changes to make every vairable uniform. 

GGplot is an R package that allows you to create different types of visualizations right in your R workspace. In ggplot2 an aestetic is defined as a visual property of an object in your plot.
		Color: allows you to change all the color in your plots , or in each data group
		Size: this allows you to change the size of the points on your plot by data group 
		Shape: this allows you to change the shape of the points on your plot by data group


ggplot(data, aes (x=distance, y=dep_delay, Color=carrier, size=air_time, shape =carriers)) + Goem_functions

Geom function: deteermine what the layout is going to be of the plot, wheather its going to be scatter point type layout or a bar type layout or even a line type layout
		geom_point()
		geom_bar()
		goem_line()
ggplot(data=penguins)+
		<geom_point>(mapping=aes(x=flipper_length_mm,y=bod_mass_g))
				<geom_point> 
						is going to push the function to creete a scatter plot
			<geom_bar> (mapping=aes(x=flipper_length_mm,y=bod_mass_g))
