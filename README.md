# WMF Product Analytics Reporting Template

A report template, based on [memor](https://hebrewseniorlife.github.io/memor/) template, for use by the [Product Analytics](https://www.mediawiki.org/wiki/Product_Analytics) team within [Wikimedia Audiences](https://www.mediawiki.org/wiki/Wikimedia_Audiences) department.

**Note**: this report template uses [R Markdown](https://rmarkdown.rstudio.com/), which [supports Python](https://rstudio.github.io/reticulate/articles/r_markdown.html), meaning data analysis does not have to be done in R. In addition to that, [data can fetched with SQL](https://bookdown.org/yihui/rmarkdown/language-engines.html#sql) from a database and then transferred between R and Python chunks.

## Prerequisites

- **Fonts**
  - xelatex engine, most easily installed with [tinytex](https://yihui.name/tinytex/)
  - [Montserrat](https://fonts.google.com/specimen/Montserrat) (Bold) for header text
  - [Source Serif Pro](https://fonts.google.com/specimen/Source+Serif+Pro) for body text
- [Pandoc](https://pandoc.org/)
  - included with [RStudio](https://www.rstudio.com/products/rstudio/)

## Installation

```R
# install.packages("devtools")
devtools::install_github("bearloga/wmf-product-analytics-report")
```

## Usage
