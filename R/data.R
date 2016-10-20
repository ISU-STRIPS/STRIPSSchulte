#' Avian codes
#'
#' Each species is given a 4 digit character abbreviation This data sets
#' provides the common name associated with each abbreviation.
#'
#' @format A data.frame with two variables: \code{abbrev} and
#' \code{common_name}
"avian_abbrev"

#' Avian community abundance, richness, and diversity
#'
#' For each survey, abundance, richness, and diversity measurements.
#'
#' @format A data.frame with 7 variables: \code{survey}, \code{year},
#' \code{julian}, \code{watershed}, \code{abundance}, \code{richness}, and
#' Simpson's inverse \code{diversity}
"avian_community"

#' Avian groups
#'
#' Whether a species is a grassland species and whether the species is of
#' greatest conservation need.
#'
#' @format A data.frame with three variables: \code{abbrev},
#' \code{grassland_species}, and \code{species_of_greatest_conservation_need}
"avian_groups"
