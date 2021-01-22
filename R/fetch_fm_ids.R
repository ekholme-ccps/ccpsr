
#' Fetch Fall Membership Ids
#'
#' @param year year to get fall membership for
#'
#' @return
#' @export
#'
#' @examples \dontrun{
#' fetch_fm_ids(2019)
#' }
fetch_fm_ids <- function(year) {

  con <- set_con()

  tmp <- odbc::dbGetQuery(con, paste0('
                SELECT StudentId
                FROM [CCPS_Shared].[SCHOOLS\\Susan_Kvaven].[SRC_FALL_', year, ']
                  WHERE ActiveStat = \'A\'
                  AND GradeLevel != \'PK\'
                  AND (ServDiv = 021
                    OR Tuition in (\'3\', \'7\')
                  )
                  AND FTE in (\'\')
                  '
  ))

  purrr::as_vector(tmp)
}
