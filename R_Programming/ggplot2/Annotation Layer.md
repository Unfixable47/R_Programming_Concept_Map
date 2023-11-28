Cannotations are good for making your plots you made more clear to your audience
		tittles 
		subtitles
		captions
example:
ggplot(data=penguins)+
	geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,color=species)) + labs(title="Palmer Penguins: Body Mass vs. Flipper Length")
![[Pasted image 20221019125242.png]]

for the arguemnt for labs add: 
labs(title="Palmer Penguins: Body Mass vs. Flipper Length", subtitle= "Sample of Three Penguin Species")

![[Pasted image 20221019125525.png]]

when adding captions R adds the captions to the bottom right

![[Pasted image 20221019125653.png]]

annotate("text", x=220,y=3500,label="The Gentoos are the largest", color="purple", fontface="bold",size=4.5, angle=25)

![[Pasted image 20221019130222.png]]
 store in a variable