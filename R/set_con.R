
#' Set Database Connection
#'
#' @return
#' @export
#'
#' @examples
set_con <- function() {
  DBI::dbConnect(odbc::odbc(), Driver = "SQL Server",
                 Server = "PRODBSYNNEW", Database = "CCPS_Shared",
                 Trusted_Connection = TRUE)
}
