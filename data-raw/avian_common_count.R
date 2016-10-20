require(dplyr)

avian_common_count <- readr::read_csv("CommonBirdsAll.csv") %>%
  setNames(tolower(names(.))) %>%
  rename(count = tba,
         abbrev = species) %>%
  select(survey, abbrev, count) %>%
  filter(count>0)

devtools::use_data(avian_common_count, overwrite = TRUE)
