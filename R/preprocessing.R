`%!in%` = Negate(`%in%`)

tbl_to_html <- function(ind, tbl, category){
  single_row <- tbl[tbl$df_name == ind & tbl$page_name_in_documentation == category, ]
  single_sheet <- suppressMessages(readxl::read_excel(path_back_end_db,
    sheet = as.character(single_row$INDEX), .name_repair = "minimal"))
  single_sheet <- single_sheet[colnames(single_sheet) %!in%c("", "Back to Index", "page_name_in documentation")]
  
  example <- reactable::reactable(single_sheet, sortable = FALSE, searchable = TRUE, pagination = FALSE,
                                  highlight = TRUE, bordered = TRUE, striped = TRUE, height = 300,
                                  style = list(maxWidth = 650))
  
  if (!is.na(single_row$description)){
    example <- example %>%
      reactablefmtr::add_subtitle(single_row$description, font_size = 18, margin = reactablefmtr::margin(20))}
  
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

print_mult_tbl <- function(category, tbl) {
  ind <- tbl[tbl$page_name_in_documentation == category, ]$df_name
  
  title_html <- lapply(ind, title_create)
  body_html <- lapply(ind, tbl_to_html, tbl, category)
  empty_line <- rep("", length(ind))
  return(c(rbind(title_html, body_html, empty_line)))
}

path_back_end_db <- here::here("R", "datamodels.xlsm")

data <- readxl::read_excel(path_back_end_db)
