

```r
library(tidyverse)
library(dplyr)
library(readr)

elden_ring <- read_csv("~/Lab1/Analysis/elden_ring_weapon.csv")
```

```
## New names:
## Rows: 307 Columns: 24
## ── Column specification
## ─────────── Delimiter: "," chr
## (21): Name, Type, Phy...3, ... dbl
## (3): Cri, Sta, Wgt
## ℹ Use `spec()` to retrieve the
## full column specification for this
## data. ℹ Specify the column types
## or set `show_col_types = FALSE` to
## quiet this message.
## • `Phy` -> `Phy...3`
## • `Mag` -> `Mag...4`
## • `Fir` -> `Fir...5`
## • `Lit` -> `Lit...6`
## • `Hol` -> `Hol...7`
## • `Phy` -> `Phy...16`
## • `Mag` -> `Mag...17`
## • `Fir` -> `Fir...18`
## • `Lit` -> `Lit...19`
## • `Hol` -> `Hol...20`
```

```r
str(elden_ring)
```

```
## spc_tbl_ [307 × 24] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
##  $ Name    : chr [1:307] "Academy Glintstone Staff" "Alabaster Lord's Sword" "Albinauric Bow" "Albinauric Staff" ...
##  $ Type    : chr [1:307] "Glintstone Staff" "Greatsword" "Bow" "Glintstone Staff" ...
##  $ Phy...3 : chr [1:307] "43" "313" "200" "29" ...
##  $ Mag...4 : chr [1:307] "-" "93" "-" "-" ...
##  $ Fir...5 : chr [1:307] "-" "-" "-" "-" ...
##  $ Lit...6 : chr [1:307] "-" "-" "-" "-" ...
##  $ Hol...7 : chr [1:307] "-" "-" "-" "-" ...
##  $ Cri     : num [1:307] 100 100 100 100 100 100 100 100 100 100 ...
##  $ Sta     : num [1:307] 40 126 60 38 62 68 40 150 150 42 ...
##  $ Str     : chr [1:307] "D" "B" "E" "D" ...
##  $ Dex     : chr [1:307] "-" "D" "D" "-" ...
##  $ Int     : chr [1:307] "S" "D" "-" "B" ...
##  $ Fai     : chr [1:307] "-" "-" "-" "-" ...
##  $ Arc     : chr [1:307] "-" "-" "-" "S" ...
##  $ Any     : chr [1:307] "-" "-" "-" "-" ...
##  $ Phy...16: chr [1:307] "25" "56" "-" "23" ...
##  $ Mag...17: chr [1:307] "15" "33" "-" "14" ...
##  $ Fir...18: chr [1:307] "15" "27" "-" "14" ...
##  $ Lit...19: chr [1:307] "15" "27" "-" "14" ...
##  $ Hol...20: chr [1:307] "15" "27" "-" "14" ...
##  $ Bst     : chr [1:307] "15" "39" "-" "14" ...
##  $ Rst     : chr [1:307] "10" "19" "-" "9" ...
##  $ Wgt     : num [1:307] 3 8 4.5 2.5 3 6 3 18 11 4 ...
##  $ Upgrade : chr [1:307] "Smithing Stones" "Somber Smithing Stones" "Smithing Stones" "Smithing Stones" ...
##  - attr(*, "spec")=
##   .. cols(
##   ..   Name = col_character(),
##   ..   Type = col_character(),
##   ..   Phy...3 = col_character(),
##   ..   Mag...4 = col_character(),
##   ..   Fir...5 = col_character(),
##   ..   Lit...6 = col_character(),
##   ..   Hol...7 = col_character(),
##   ..   Cri = col_double(),
##   ..   Sta = col_double(),
##   ..   Str = col_character(),
##   ..   Dex = col_character(),
##   ..   Int = col_character(),
##   ..   Fai = col_character(),
##   ..   Arc = col_character(),
##   ..   Any = col_character(),
##   ..   Phy...16 = col_character(),
##   ..   Mag...17 = col_character(),
##   ..   Fir...18 = col_character(),
##   ..   Lit...19 = col_character(),
##   ..   Hol...20 = col_character(),
##   ..   Bst = col_character(),
##   ..   Rst = col_character(),
##   ..   Wgt = col_double(),
##   ..   Upgrade = col_character()
##   .. )
##  - attr(*, "problems")=<externalptr>
```

```r
colnames(elden_ring)
```

```
##  [1] "Name"     "Type"    
##  [3] "Phy...3"  "Mag...4" 
##  [5] "Fir...5"  "Lit...6" 
##  [7] "Hol...7"  "Cri"     
##  [9] "Sta"      "Str"     
## [11] "Dex"      "Int"     
## [13] "Fai"      "Arc"     
## [15] "Any"      "Phy...16"
## [17] "Mag...17" "Fir...18"
## [19] "Lit...19" "Hol...20"
## [21] "Bst"      "Rst"     
## [23] "Wgt"      "Upgrade"
```

```r
print(unique(elden_ring$Type))
```

```
##  [1] "Glintstone Staff"     
##  [2] "Greatsword"           
##  [3] "Bow"                  
##  [4] "Thrusting Sword"      
##  [5] "Crossbow"             
##  [6] "Colossal Weapon"      
##  [7] "Greataxe"             
##  [8] "Curved Sword"         
##  [9] "Halberd"              
## [10] "Flail"                
## [11] "Axe"                  
## [12] "Warhammer"            
## [13] "Torch"                
## [14] "Curved Greatsword"    
## [15] "Dagger"               
## [16] "Claw"                 
## [17] "Heavy Thrusting Sword"
## [18] "Spear"                
## [19] "Straight Sword"       
## [20] "Fist"                 
## [21] "Sacred Seal"          
## [22] "Hammer"               
## [23] "Light Bow"            
## [24] "Katana"               
## [25] "Twinblade"            
## [26] "Greatbow"             
## [27] "Whip"                 
## [28] "Colossal Sword"       
## [29] "Reaper"               
## [30] "Ballista"             
## [31] "Great Spear"
```

```r
#  [1] "Glintstone Staff"      "Greatsword"
#  [3] "Bow"                   "Thrusting Sword"
#  [5] "Crossbow"              "Colossal Weapon"
#  [7] "Greataxe"              "Curved Sword"
#  [9] "Halberd"               "Flail"
# [11] "Axe"                   "Warhammer"
# [13] "Torch"                 "Curved Greatsword"
# [15] "Dagger"                "Claw"
# [17] "Heavy Thrusting Sword" "Spear"
# [19] "Straight Sword"        "Fist"
# [21] "Sacred Seal"           "Hammer"
# [23] "Light Bow"             "Katana"
# [25] "Twinblade"             "Greatbow"
# [27] "Whip"                  "Colossal Sword"
# [29] "Reaper"                "Ballista"
# [31] "Great Spear"
#  [1] "Glintstone Staff"      "Greatsword"
#  [3] "Bow"                   "Thrusting Sword"
#  [5] "Crossbow"              "Colossal Weapon"
#  [7] "Greataxe"              "Curved Sword"
#  [9] "Halberd"               "Flail"
# [11] "Axe"                   "Warhammer"
# [13] "Torch"                 "Curved Greatsword"
# [15] "Dagger"                "Claw"
# [17] "Heavy Thrusting Sword" "Spear"
# [19] "Straight Sword"        "Fist"
# [21] "Sacred Seal"           "Hammer"
# [23] "Light Bow"             "Katana"
# [25] "Twinblade"             "Greatbow"
# [27] "Whip"                  "Colossal Sword"
# [29] "Reaper"                "Ballista"
# [31] "Great Spear"


deadly_weapons <- c("FingerPrint Stone Shield", "Vyke's War Spear")
madess_shield <- elden_ring %>%
  filter(Name %in% deadly_weapons)
madess_shield %>%
  select(Name, Type)
```

```
## # A tibble: 1 × 2
##   Name             Type       
##   <chr>            <chr>      
## 1 Vyke's War Spear Great Spear
```

```r
greatspear <- elden_ring %>%
  filter(Type == "Great Spear")
greatspear %>%
  select(Name, Type)
```

```
## # A tibble: 6 × 2
##   Name                   Type      
##   <chr>                  <chr>     
## 1 Lance                  Great Spe…
## 2 Mohgwyn's Sacred Spear Great Spe…
## 3 Serpent-Hunter         Great Spe…
## 4 Siluria's Tree         Great Spe…
## 5 Treespear              Great Spe…
## 6 Vyke's War Spear       Great Spe…
```

