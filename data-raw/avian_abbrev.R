library(dplyr)

# from ?tolower
.simpleCap <- function(x) {
  s <- strsplit(x, " ")[[1]]
  paste(toupper(substring(s, 1, 1)), substring(s, 2),
        sep = "", collapse = " ")
}

# These common names appear to not have dashes, e.g. Yellow-bellied sapsucker
avian_abbrev <- readr::read_csv("STRIPS1_BirdSpp.csv") %>%
  select(spp_abbrev, spp) %>%
  rename(common_name = spp,
         abbrev = spp_abbrev) %>%
  mutate(common_name = sapply(gsub("_", " ", common_name), .simpleCap))

devtools::use_data(avian_abbrev, overwrite = TRUE)
