#' @title Inserts an empty doc template
#' @description Inserts a doc template at the cursor position.
#' Should be used by mapping it to a shortcut in Rstudio. To do this,
#' go into 'Tools > Modify Keyboard Shortcuts' and then search for
#' 'Insert doc skeleton'.
#' The template includes the project name, the content of the script,
#' one or more contributors, when the script was last updated and a
#' brief summary.
#' @return A doc template
#' @example
#' \dontrun{
#' openeR::openeR()
#' }
#' @export
openeR <- function(){

  doc_context <- rstudioapi::getActiveDocumentContext()
  position <- doc_context$selection[[1]]$range$start

  skeleton <- paste('# ----------------------------------------------------------------------------- #
  # Project:
  # Content:
  # Contributors:
  # Last update on:', Sys.Date(),'
  # Summary:
  # ----------------------------------------------------------------------------- #
')

  rstudioapi::insertText(
    location = position,
    text = skeleton
  )

}



