library(tidyverse)
library(dplyr)
library(readr)
library(purrr)
library(rlang)

elden_ring <- read_csv("~/Lab1/Analysis/elden_ring_weapon.csv")

str(elden_ring)
colnames(elden_ring)


print(unique(elden_ring$Type))
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


deadly_weapons <- c("Great Spear", "Spear")
spears <- elden_ring %>%
  filter(Type %in% deadly_weapons)
spears %>%
  select(Name, Type)

replacedash <- function(x) {
  if (is.character(x)) {
    na_if(x, "-") # Replace "-" with NA in character columns
  } else {
    x # Return numeric columns and other column types as is
  }
}

spears_edit <- map(spears, replacedash)
spears_edit <- as_tibble(spears_edit)

elden_ring_nona <- map(elden_ring, replacedash)
elden_ring_nona <- as_tibble(elden_ring_nona)

natural_lightning_spears <- spears_edit %>%
  filter(!is.na(Lit...6)) %>%
  view_xl()

natural_lightning <- elden_ring_nona %>%
  filter(!is.na(Lit...6)) %>%
  arrange(desc(Lit...6)) %>%
  view_xl()
