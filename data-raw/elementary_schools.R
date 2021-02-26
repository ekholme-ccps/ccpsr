
# Elementary School Codes -------------------------------------------------


library(tidyverse)

con <- ccpsr::set_con()

elementary_school_codes <- odbc::dbGetQuery(con, '
                   SELECT SCHOOL_CODE
                   FROM [CCPS_Shared].[CCPS_Shared].[RE_Organizations]
                   WHERE (SCHOOL_TYPE LIKE \'1%\')
                   ') %>%
  tibble::as_tibble() %>%
  dplyr::pull()

#writing out
save(elementary_school_codes, file = here::here("data/elementary_school_codes.RData"))
