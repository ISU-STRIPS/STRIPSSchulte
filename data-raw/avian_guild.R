library(dplyr)

# These common names appear to not have dashes, e.g. Yellow-bellied sapsucker
avian_groups <- readr::read_csv("STRIPS1_BirdSpp.csv") %>%
  select(spp_abbrev, grass_bird, sgcn) %>%
  mutate(grass_bird = as.logical(grass_bird),
         sgcn       = as.logical(sgcn))
  rename(abbrev = spp_abbrev,
         grassland_species = grass_bird,
         species_of_greatest_conservation_need = sgcn)

devtools::use_data(avian_groups, overwrite = TRUE)
