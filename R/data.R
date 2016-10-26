#' Avian abbreviations
#'
#' Each species is given a 4 digit character abbreviation This data sets
#' provides the common name associated with each abbreviation.
#'
#' @format A data.frame with two variables: \code{abbrev} and
#' \code{common_name}
#'
#' @seealso \code{\link{avian_common_count}}
#'
#' @examples
#' library(dplyr)
#' with_common_name <- avian_common_count %>%
#'   left_join(avian_abbrev, by="abbrev")
"avian_abbrev"

#' Avian common count data
#'
#' For 16 species, the number of individuals of that species observed during
#' each survey with zero counts removed from the data set. To include zeros,
#' see the examples below.
#'
#' @format A data.frame with 3 variables: \code{survey}, \code{abbrev},
#' \code{count}
#'
#' @seealso \code{\link{avian_surveys}}, \code{\link{avian_abbrev}}
#'
#' @examples
#' library(dplyr)
#' library(tidyr)
#' with_zeros <- avian_common_count %>%
#'   right_join(avian_surveys[,"survey"], by="survey") %>% # include surveys with no observations
#'   complete(survey, abbrev, fill = list(count=0)) %>%    # fill all missing survey-abbrev combinations with zero counts
#'   right_join(avian_surveys, by="survey")                # include survey date and watershed info
#' head(with_zeros)
"avian_common_count"

#' Avian community abundance, richness, and diversity
#'
#' For each survey, abundance, richness, and diversity measurements.
#'
#' @format A data.frame with 4 variables: \code{survey}, \code{abundance},
#' \code{richness}, and Simpson's inverse \code{diversity}
#'
#' @examples
#' library(dplyr)
#' avian_community %>%
#'   left_join(avian_surveys, by="survey")
"avian_community"

#' Avian groups
#'
#' Whether a species is a grassland species and whether the species is of
#' greatest conservation need.
#'
#' @format A data.frame with 3 variables: \code{abbrev},
#' \code{grassland_species}, and \code{species_of_greatest_conservation_need}
#'
#' @seealso \code{\link{avian_common_count}}, \code{\link{avian_abbrev}}
#' @examples
#' library(dplyr)
#' with_groups <- avian_common_count %>%
#'   left_join(avian_groups, by = "abbrev")
"avian_groups"

#' Avian surveys
#'
#' A list of all avian surveys performed during the STRIPS project. Each survey
#' corresponds to a particular date-watershed combination.
#'
#' @format A data.frame with 3 variables: \code{survey}, \code{date}, and
#' \code{watershed}
#'
#' @seealso \code{\link{avian_common_count}}, \code{\link{avian_community}}
#' @examples
#' library(dplyr)
#' avian_community %>%
#'   left_join(avian_surveys, by="survey")
"avian_surveys"
