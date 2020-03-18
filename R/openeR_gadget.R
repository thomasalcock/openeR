#' @title Document your script with user specified doc skeletons
#' @description Opens a dialogue window with text inputs for the project ID,
#' the type content (e.g. data preparation), the contributors and a summary of
#' what the script does and how it can be used. Once the 'Done' button is clicked,
#' the skeleton is rendered as part of the script at the cursor position.
#' The function makes use of openeR::doc_skeleton() and the packages miniUI and shiny.
#' Should be used by mapping it to a shortcut in Rstudio. To do this,
#' go into 'Tools > Modify Keyboard Shortcuts' and then search for
#' 'Insert a user specified doc skeleton'.
#' @return A user specified doc skeleton
#' @import shiny miniUI
#' @export
openeR_gadget <- function(){

  # Set options -------------------------------------------------------------
  shiny::shinyOptions(
    shiny.trace = FALSE
  )


  # UI side -----------------------------------------------------------------
  ui <- miniUI::miniPage(

    # Title bar ---------------------------------------------------------------
    miniUI::miniTitleBar(
      title = "Enter document information"
    ),
    miniUI::miniTabstripPanel(

    # First tab panel ---------------------------------------------------------
      miniUI::miniTabPanel(
        title = "Document Header",
        miniUI::miniContentPanel(
          shiny::textInput("project_id", label = "", placeholder = "Enter project name"),
          shiny::textInput("content", label = "", placeholder = "Enter content"),
          shiny::textInput("contrib", label = "", placeholder = "Enter contributors"),
          shiny::textInput("summary", label = "", placeholder = "Enter summary")
        )
      ),

      # Second tab panel --------------------------------------------------------
      miniUI::miniTabPanel(
        title = "Code Sections",
        shiny::textInput(
          inputId = "header_1",
          label = "Section header"
        )
      )
    ),

    # Bottom button -----------------------------------------------------------
    miniUI::miniButtonBlock(
      shiny::actionButton(
        inputId = "done",
        label = "Done"
      )
    )
  )

  # Server side -------------------------------------------------------------
  server <- function(input, output, session) {

      # Document info page ------------------------------------------------------
      shiny::observeEvent(input$done, {
        shiny::stopApp({
          doc_skeleton(
            project_name = input$project_id,
            content = input$content,
            contrib = input$contrib,
            summary = input$summary,
            section_header = input$header_1
          )
          create_section(sec_name = input$header1)
        })
      })
  }

  shiny::runGadget(
    ui,
    server,
    viewer = shiny::dialogViewer("Enter Script Documentation")
  )
}
