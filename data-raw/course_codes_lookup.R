
library(readxl)
library(tidyverse)

course_codes_lookup <- read_excel("~/Data Codebooks/class code prefix lookup.xlsx") %>%
  mutate(specialty_center_domain = if_else(specialty_center_domain == "Y", TRUE, FALSE))

save(course_codes_lookup, file = here::here("data/course_codes_lookup.RData"))
