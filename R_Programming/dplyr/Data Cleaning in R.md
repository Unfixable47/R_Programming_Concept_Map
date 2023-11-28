
```R
starwars %>%
	select(name, gender, hair_color,height) %>%
	filter(!complete.cases(.)) %>%
	drop_na(height)

mutate(hair_color = replace_na(hair_color,"none"))
```