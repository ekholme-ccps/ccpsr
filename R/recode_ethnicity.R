
#' Recode Ethnicity
#'
#' @param df data
#' @param eth_var ethnicity variable. Assumed to be "ethnic" as a result of db query and clean_names
#' @param hisp_var hispanic/latino variable. Assumed to be "hispanic_latino" as a result of db query and clean_names
#'
#' @return
#' @export
#'
#' @examples \dontrun{
#' library(tidyverse)
#' library(janitor)
#' library(ccpsr)
#'
#' con <- set_con()
#'
#' ex <- odbc::dbGetQuery(con, 'SELECT *
#' FROM [CCPS_Shared].[CCPS_Shared].[RE_Students]
#' WHERE School_Year = 2019')
#'
#' ex %>%
#' clean_names() %>%
#' recode_ethnicity()
#'
#' }
recode_ethnicity <- function(df, eth_var = ethnic, hisp_var = hispanic_latino) {

  df %>%
    dplyr::mutate({{ eth_var }} := dplyr::case_when(
      {{ hisp_var }} == "Y" ~ "Hispanic",
      {{ hisp_var }} == "N" & {{ eth_var }} == "01" ~ "American Indian/Alaska Native",
      {{ hisp_var }} == "N" & {{ eth_var }} == "02" ~ "Asian",
      {{ hisp_var }} == "N" & {{ eth_var }} == "03" ~ "Black or African American",
      {{ hisp_var }} == "N" & {{ eth_var }} == "05" ~ "White",
      {{ hisp_var }} == "N" & {{ eth_var }} == "06" ~ "Hawaiian or Pacific Islander",
      TRUE ~ "Two or More"
    ))

}
