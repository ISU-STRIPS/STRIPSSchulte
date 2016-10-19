source("load_schulte.R")

d = load_schulte(AllObs         = "../raw/STRIPsBirdsAllObs.csv",
                 CommonBirdsAll = "../raw/CommonBirdsAll.csv",
                 sites          = "../raw/site_to_watershed.csv")

readr::write_csv(d, path = 'Schulte-bird.csv')
