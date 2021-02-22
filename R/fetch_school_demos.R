
fetch_school_demos <- function(year) {

  con <- ccpsr::set_con()

  #getting fall membership students, including PK
  tmp <- odbc::dbGetQuery(con, paste0('
                SELECT StudentId
                FROM [CCPS_Shared].[SCHOOLS\\Susan_Kvaven].[SRC_FALL_', year, ']
                  WHERE ActiveStat = \'A\'
                  AND (ServDiv = 021
                    OR Tuition in (\'3\', \'7\')
                  )
                  AND FTE in (\'\')
                  '
  )) %>%
    dplyr::pull()

  #including student demographic data
  st_demos <- odbc::dbGetQuery(con, paste0(
    'SELECT Student_id,
    State_id,
    State_School,
    Sex,
    Ethnic,
    Hispanic_Latino,
    Ell_Status,
    INDICATOR_SPECED,
    CCPS_Gate,
    School,
    STATUS
  FROM [CCPS_Shared].[CCPS_Shared].[RE_Students]
  WHERE School_Year = ', year
  )) %>%
    dplyr::filter(Student_id %in% tmp) %>%
    tibble::as_tibble() %>%
    janitor::clean_names() %>%
    ccpsr::recode_ethnicity()

  orgs <- odbc::dbGetQuery(con, '
    SELECT ORGANIZATION_NAME as sch_name,
      SCHOOL_TYPE as sch_type,
      STATE_SCHOOL_CODE as state_school_code
    FROM [CCPS_Shared].[CCPS_Shared].[RE_Organizations]
    ')

  joined <- st_demos %>%
    dplyr::left_join(orgs, by = c("state_school" = "state_school_code"))

return(joined)

}
