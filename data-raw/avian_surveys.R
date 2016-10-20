library(dplyr)

avian_surveys <- readr::read_csv("STRIPsBirdsAllObs.csv") %>%
  setNames(tolower(names(.))) %>%
  left_join(readr::read_csv("site_to_watershed.csv"), by = "site") %>%
  mutate(date = as.Date(paste(year,"01","01", sep="/")) + julian-1) %>%
  select(survey, date, watershed)

devtools::use_data(avian_surveys, overwrite = TRUE)
