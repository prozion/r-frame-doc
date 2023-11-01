#!/usr/bin/env Rscript

library(rvest)
library(xml2)

extract_index <- function() {

  base <- "https://rdrr.io"
  url <- "https://rdrr.io/r/"

  html <- read_html(url)

  as <- html %>% html_elements("dt > a")
  functions <- as %>% html_text2()
  urls <- as %>% html_attr("href") %>% paste0(base, .)
  descriptions <- html %>% html_elements("dd") %>% html_text2()

  index <- data.frame(fname = functions, descr = descriptions, url = urls)

  # head(index)
  index
}

get_content <- function(html) {
  html %>% html_element("div.eleven.wide.column > div.container")
}

html_wrap <- function(content, fname) {
  template <- "
  <!DOCTYPE html>
  <html lang='en'>
    <head>
      <meta charset='UTF-8'>
      <meta name='viewport' content='width=device-width, initial-scale=1.0'>
      <link rel='stylesheet' href='../styles/rdrr.css'>
      <title>%s</title>
    </head>
    <body>
      %s
    </body>
  </html>
  "

  res <- sprintf(template, fname, content)
  res
}

index <- extract_index()

for (i in 51:420) {
  fname <- index[i, "fname"]
  url <- index[i, "url"]
  content <- read_html(url) %>% get_content %>% as.character %>% html_wrap(fname)
  if (!is.na(fname)) {
    writeLines(content, sprintf("../pages/%s.html", fname))
  }}
