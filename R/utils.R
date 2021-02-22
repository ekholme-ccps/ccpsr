
#' Get Demographics for an Entity
#'
#' Get demographics for a given entity or entities.
#' Most useful values to pass to ... include schools/school numbers,
#' school levels/types, grades, etc.
#'
#' @param df data
#' @param demovar a string. Variable to get demographics for (e.g. sex, ethnicity)
#' @param ... grouping variable(s)
#'
#' @return
#' @export
#'
#' @examples
get_single_demo <- function(df, demovar, ...) {

  df %>%
    dplyr::count(.data[[demovar]], ...) %>%
    dplyr::add_count(..., wt = n) %>%
    dplyr::mutate(perc = n/nn) %>%
    select(...,
           key = .data[[demovar]],
           perc)

}

##this currently doesn't work -- need to look into
#summarize_level_demos <- function(demos, ...) {

#  purrr::map(demos, ~get_single_demo(demovar = .x, ...)) #%>%
    #dplyr::bind_rows() %>%
    #tidyr::pivot_wider(
    #  names_from = key,
    #  values_from = perc,
    #  names_prefix = "sch_perc_"
    #) #%>%
    #janitor::clean_names() %>%
    #dplyr::mutate(dplyr::across(tidyselect::where(is.numeric), ~tidyr::replace_na(., 0)))

#}
