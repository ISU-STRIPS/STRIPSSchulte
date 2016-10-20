library(dplyr)

avian_community <- readr::read_csv("STRIPsBirdsAllObs.csv") %>%
  setNames(tolower(names(.))) %>%
  select(survey, tba, richness, simp.ind) %>%
  rename(abundance = tba,
         diversity = simp.ind)

devtools::use_data(avian_community, overwrite = TRUE)
