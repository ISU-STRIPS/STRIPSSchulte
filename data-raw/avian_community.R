library(dplyr)

avian_community <- readr::read_csv("STRIPsBirdsAllObs.csv") %>%
  setNames(tolower(names(.))) %>%
  left_join(readr::read_csv("site_to_watershed.csv")) %>%
  select(survey, year, julian, watershed, tba, richness, simp.ind) %>%
  rename(abundance = tba,
         diversity = simp.ind)

devtools::use_data(avian_community, overwrite = TRUE)
