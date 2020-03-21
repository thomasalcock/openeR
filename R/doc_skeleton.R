#' @title Inserts a user specified doc skeleton
#' @description Inserts a user specified doc skeleton at the current cursor position.
#' @param project_name The name of the project to which the skript belongs
#' @param content Brief description of content of the script
#' @param contrib Contributors ot the script
#' @param summary More extensive description of the scripts contents
#' @param section_header Name of the section to be created with the doc template
#' @import rstudioapi
#' @return A doc skeleton with user specified inputs
#' @export
#'
#' @examples
#' \dontrun{
#' doc_skeleton(
#' project_name = "My Project",
#' content = "Data preparation",
#' contrib = "John Smith",
#' summary = "This script prepares the data for modeling"
#' )
#' }
doc_skeleton <- function(project_name,
                         content,
                         contrib,
                         summary,
                         section_headers){

  doc_context <- rstudioapi::getActiveDocumentContext()
  position <- doc_context$selection[[1]]$range$start

  skeleton <- paste0(
    '# ----------------------------------------------------------------------------- # \n',
    '# Project: ', project_name, '\n',
    '# Content: ', content, '\n',
    '# Contributors: ', contrib, '\n',
    '# Last update on: ', Sys.Date(), '\n',
    '# Summary: ', summary, '\n',
    '# ----------------------------------------------------------------------------- #'
  )

  for(header in section_headers){
    if(header != ""){
      skeleton <- paste0(
        skeleton, "\n \n",
        create_section(header)
      )
    }
  }


  rstudioapi::insertText(
    location = position,
    text = skeleton
  )
}
