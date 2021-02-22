#' Recode Demographics
#'
#' This will recode special education status, ell status, and gifted status.
#' The function assumes that janitor::clean_names() has already been run.
#'
#' @param df data
#' @param speced special education indicator. Presumed to be indicator_speced.
#' @param ell ell indicator. Presumed to be ell_status.
#' @param gate gifted indicator. Presumed to be ccps_gate.
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
#' recode_demos()
#'
#' }
recode_demos <- function(df, speced = indicator_speced, ell = ell_status, gate = ccps_gate) {

  df %>%
    dplyr::mutate({{ speced }} := dplyr::if_else({{ speced }} == "N", "Not_SPED", "SPED"),
           {{ ell }} := dplyr::if_else({{ ell }} == "N", "Not_ELL", "ELL"),
           {{ gate }} := dplyr::if_else({{ gate }} == "Y", "Gifted", "Not_Gifted"))

}
