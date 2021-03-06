% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/doc_skeleton.R
\name{doc_skeleton}
\alias{doc_skeleton}
\title{Inserts a user specified doc skeleton}
\usage{
doc_skeleton(project_name, content, contrib, summary, section_headers)
}
\arguments{
\item{project_name}{The name of the project to which the skript belongs}

\item{content}{Brief description of content of the script}

\item{contrib}{Contributors ot the script}

\item{summary}{More extensive description of the scripts contents}

\item{section_header}{Name of the section to be created with the doc template}
}
\value{
A doc skeleton with user specified inputs
}
\description{
Inserts a user specified doc skeleton at the current cursor position.
}
\examples{
\dontrun{
doc_skeleton(
project_name = "My Project",
content = "Data preparation",
contrib = "John Smith",
summary = "This script prepares the data for modeling"
)
}
}
