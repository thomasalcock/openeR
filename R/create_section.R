#' @title Create a code section
#' @description This function mimics the built in RStudio shortcut for creating sections.
#' It is used as part of the function set up the code documentation skeleton.
#' @param sec_name The name of the code section
#' @return A character in the form of an RStudio code section
#' @example
#' \dontrun{create_section("Section 1: Data preparation")}
#' @export
#'
create_section <- function(sec_name){
  title <- paste("#", sec_name)
  n_rep <- 73 - as.numeric(nchar(sec_name))

  # failsafe in case of weird bug were rstudioapi
  # calls function again after it was already called once
  if(length(n_rep) == 0){
    return(invisible(''))
  }

  hyphens <- paste0(rep_len("-", abs(n_rep)), collapse = "")
  return(
    paste(title, hyphens)
  )
}
