# REMEMBER to restart R after you modify and save this file!

# First, execute the global .Rprofile if it exists. You may configure blogdown
# options there, too, so they apply to any blogdown projects. Feel free to
# ignore this part if it sounds too complicated to you.
if (file.exists("~/.Rprofile")) {
  base::sys.source("~/.Rprofile", envir = environment())
}

`%!in%` = Negate(`%in%`)

library(magrittr)

data <- readxl::read_excel(here::here("static", "data", "flowchart.xlsm"))

tbl_to_html <- function(ind, tbl){
  
  single_row <- data[data$df_name == ind, ]
  single_sheet <- suppressMessages(readxl::read_excel(
    here::here("static", "data", "flowchart.xlsm"),
    sheet = as.character(single_row$INDEX), .name_repair = "minimal"))
  single_sheet <- single_sheet[colnames(single_sheet) %!in%c("", "Back to Index", "page_name_in documentation")]
  
  example <- reactable::reactable(single_sheet, sortable = FALSE, searchable = TRUE, pagination = FALSE,
                                  highlight = TRUE, bordered = TRUE, striped = TRUE, height = 300,
                                  style = list(maxWidth = 650))
  
  if (!is.na(single_row$description)){
    example <- example %>%
      reactablefmtr::add_subtitle(single_row$description, font_size = 18, margin = 20)}
  
  if (!is.na(single_row$note)){
    example <- example %>%
      reactablefmtr::add_source(single_row$note, font_style = "italic", font_color = "grey")}
  
  htmltools::div(align="center",
                 example,
                 htmltools::tags$br(),
                 htmltools::tags$br(),
                 htmltools::tags$br(),
                 htmltools::tags$br(),
  )
}

title_create <- function(inp) {
  htmltools::HTML(paste("##", inp))
}

print_mult_tbl <- function(ind, tbl) {
  title_html <- lapply(ind, title_create)
  body_html <- lapply(ind, tbl_to_html, data)
  empty_line <- rep("", length(ind))
  return(c(rbind(title_html, body_html, empty_line)))
}

# Now set options to customize the behavior of blogdown for this project. Below
# are a few sample options; for more options, see
# https://bookdown.org/yihui/blogdown/global-options.html
options(
  # to automatically serve the site on RStudio startup, set this option to TRUE
  blogdown.serve_site.startup = FALSE,
  # to disable knitting Rmd files on save, set this option to FALSE
  blogdown.knit.on_save = TRUE,
  # build .Rmd to .html (via Pandoc); to build to Markdown, set this option to 'markdown'
  blogdown.method = 'html',
  
  blogdown.ext = '.Rmarkdown'
)

# fix Hugo version
options(blogdown.hugo.version = "0.88.0")

options(blogdown.publishDir = 'docs')

options(blogdown.knit.serve_site = FALSE)
