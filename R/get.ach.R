#' Get achievement data
#'
#'
#' @param study a character value indicating the ILSA name.
#' @param year a numeric value indicating the year of the ILSA cycle.
#' @param specification a character value indicating extra specification like grade
#' (e.g., \code{"G8"} for TIMSS) or subject (e.g., \code{"Math"} for TIMSSADVANCED).
#'
#'
#' @examples
#'
#' get.ach("timss",1995,"g4")
#'
#'
#' @export
#'
#'
get.ach <- function(study = NULL, year = NULL, specification = NULL){
  library(haven)

  dirach <- system.file("extdata/achievement", package = "ILSAData")

  ark <- list.files(pattern = "rds",path = dirach,full.names = TRUE,ignore.case = TRUE)

  if(!is.null(study)){
    ark <- grep(pattern = paste0(study,"_"),x = ark,value = TRUE,ignore.case = TRUE)
  }

  if(!is.null(year)){
    ark <- grep(pattern = paste0(year,"_"),x = ark,value = TRUE,ignore.case = TRUE)
  }

  if(!is.null(specification)){
    ark <- grep(pattern = paste0(specification,"_"),x = ark,value = TRUE,ignore.case = TRUE)
  }

  if(length(ark)>1)
    stop("\nMultiple files match.")

  readRDS(ark)
}


