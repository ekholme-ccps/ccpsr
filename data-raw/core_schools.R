

# Core School Codes -------------------------------------------------------

library(tidyverse)

con <- ccpsr::set_con()

core_school_codes <- odbc::dbGetQuery(con, paste0(
  'SELECT SCHOOL_CODE
   FROM [CCPS_Shared].[CCPS_Shared].[RE_Organizations]
   WHERE (SCHOOL_TYPE LIKE \'1%\' OR SCHOOL_TYPE LIKE \'2%\' OR SCHOOL_TYPE LIKE \'3%\')
  '
))

core_school_codes <- pull(core_school_codes) %>%
  as.numeric()

#writing out
save(core_school_codes, file = here::here("data/core_codes.RData"))
