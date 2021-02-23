

# Secondary School Codes --------------------------------------------------

library(tidyverse)

con <- ccpsr::set_con()

secondary_school_codes <- odbc::dbGetQuery(con, '
                   SELECT SCHOOL_CODE
                   FROM [CCPS_Shared].[CCPS_Shared].[RE_Organizations]
                   WHERE (SCHOOL_TYPE NOT LIKE \'1%\' AND SCHOOL_TYPE NOT LIKE \'7%\' AND SCHOOL_TYPE NOT LIKE \'8%\'
                     AND SCHOOL_TYPE NOT LIKE \'Chester%\')
                   ') %>%
  tibble::as_tibble() %>%
  dplyr::pull()

#writing out
save(secondary_school_codes, file = here::here("data/secondary_school_codes.RData"))
