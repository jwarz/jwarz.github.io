library(rvest)
library(magrittr)

html <- read_html("test.html")


titles <- html |> 
  html_elements(".course-block__title") |>
  html_text()


links <- html |> 
  html_elements(".course-block__link") |> 
  html_attr('href') %>%
  stringr::str_c("https://app.datacamp.com/learn", .)
numbers <- c(1:length(links))

<a href="https://www.datacamp.com" target="_blank" rel="noopener">DataCamp</a>

first <- "<li><a href=\""
second <- 'target="_blank" rel="noopener"> '
thrid <- '<a/></li>'
stringr::str_c(first, links, second, numbers, ". ", titles, third) |> cat(sep = "\n")




first <- '<div class="row"><div class="col-auto"><a href="'
https://app.datacamp.com/learn/courses/introduction-to-statistics-in-r
second <- '" target="_blank" rel="noopener">'
Introduction to Statistics in R
third <- '</a></div><div class="col text-end">See certificate</div></div>'
