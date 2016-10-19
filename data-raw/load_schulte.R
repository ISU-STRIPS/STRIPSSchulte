load_schulte = function(AllObs         = "../raw/STRIPsBirdsAllObs.csv",
                        CommonBirdsAll = "../raw/CommonBirdsAll.csv",
                        sites          = "../raw/site_to_watershed.csv",
                        groups        = "../raw/STRIPS1_BirdSpp.csv") {
  
  require(dplyr)
  require(tidyr)
  
  site_to_watershed = readr::read_csv(sites)
  species_group = readr::read_csv(groups) %>%
    rename(Species = spp_abbrev)
  
  # Community measures
  community = readr::read_csv(AllObs)  %>%
    filter(!(Site %in% c("TV", "Bass7","Int4"))) %>%  # Remove all prairie sites
    rename(diversity = simp.ind,
           abundance = TBA) %>%
    dplyr::select(Year, Julian, Site, abundance, Richness, diversity) 
  
  names(community) = tolower(names(community))
  
  community = community %>%
    left_join(site_to_watershed, by="site") %>%
    dplyr::select(-site) %>%
    gather(response, value, abundance, richness, diversity) %>%
    mutate(PI = "Schulte",
           source = "community")
  
  
  # Group response
  group = readr::read_csv(CommonBirdsAll)  %>%
    filter(!(Site %in% c("TV", "Bass7","Int4"))) %>% # Remove 100% prairie sites
    left_join(species_group, by="Species") 
    
  names(group) = tolower(names(group))
  
  grass_bird = group %>%
    filter(grass_bird==1) %>%
    mutate(source="grass_bird")
  
  sgcn = group %>%
    filter(sgcn==1) %>%
    mutate(source="sgcn")
  
  group = rbind_list(grass_bird, sgcn) %>%
    left_join(site_to_watershed, by="site") %>%
    group_by(source, year, watershed, julian) %>%
    summarize(abundance=sum(tba),
              richness=sum(tba>0),
              diversity=ifelse(abundance==0, 0, vegan::diversity(tba/abundance, index="invsimpson"))) %>%
    ungroup  %>%
    dplyr::select(source, year, watershed, julian, abundance, richness, diversity) %>%
    gather(response, value, abundance, richness, diversity) %>%
    mutate(PI = "Schulte")
  
  rbind_list(community, group)
}
