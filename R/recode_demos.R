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
#' @examples
clean_demos <- function(df, speced = indicator_speced, ell = ell_status, gate = ccps_gate) {

  df %>%
    dplyr::mutate({{ speced }} := dplyr::if_else({{ speced }} == "N", "Not_SPED", "SPED"),
           {{ ell }} := dplyr::if_else({{ ell }} == "N", "Not_ELL", "ELL"),
           {{ gate }} := dplyr::if_else({{ gate }} == "Y", "Gifted", "Not_Gifted"))

}
