
# ccpsr

`ccpsr` contains useful functions for working with and presenting
chesterfield County Public Schools data.

## Stuff

### Data Ingest

  - `set_con`: connect to CCPS Research and Eval databases.
  - `fetch_fm_ids`: fetch ids of students in fall membership for a given
    year.
  - `fetch_school_demos`: fetch demographic compositions for each school
    for a given year.

### Data Cleaning

  - `recode_ethnicity`: recode ethnicity to more interpretable values.
  - `recode_demos`: recode demographics into more transparent values.

### Data

  - `core_school_codes`: school codes for elementary, middle, and high
    schools. Excludes alternative, technical, and regional schools.
  - `secondary_school_codes`: school codes for middle, high,
    alternative, and regional programs.
  - `elementary_school_codes`: school codes for elementary schools.
  - `course_codes_lookup`: crosswalk for course code prefixes and
    content areas.

## Installation

You can install `{ccprs}` from Github by running the following command:

``` r
#install.packages("remotes") if you do not have {remotes} installed already
remotes::install_github("ekholme-ccps/ccpsr")
```

**adding a test note to make sure I can commit/push**
