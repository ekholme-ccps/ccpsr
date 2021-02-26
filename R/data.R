
#' Core School Codes
#'
#' School codes for elementary, middle, and high schools in CCPS
#'
#'
#' @format A numeric vector of school codes. Use to filter other results.
"core_school_codes"


#' Secondary School Codes
#'
#' School codes for middle, high, alternative, and regional schools in CCPS
#'
#'
#' @format A character vector of school codes. Use to filter other results.
"secondary_school_codes"


#' Elementary School Codes
#'
#' School codes for elementary in CCPS
#'
#'
#' @format A character vector of school codes. Use to filter other results.
"elementary_school_codes"


#' Course Code Lookup
#'
#' a lookup table containing code prefixes and domains for CCPS courses
#'
#'
#' @format A tibble with 41 rows and 3 variables:
#' \describe{
#'   \item{code}{course code prefix}
#'   \item{domain}{content domain for the prefix}
#'   \item{specialty_center_domain}{indicator of whether prefix is specific to a specialty center}
#' }
"course_codes_lookup"

