#' @title WMF Product Analytics reporting template
#' @description A report template, based on [memor](https://hebrewseniorlife.github.io/memor/)
#'   template, for use by the
#'   [Product Analytics](https://www.mediawiki.org/wiki/Product_Analytics)
#'   team within
#'   [Wikimedia Audiences](https://www.mediawiki.org/wiki/Wikimedia_Audiences)
#'   department.
#' @details To be consistent with the documents put out by the Foundation, this
#'   template requires the following fonts to be available in the system:
#'   - (Bold) [Montserrat](https://fonts.google.com/specimen/Montserrat) for
#'     header text.
#'   - [Source Serif Pro](https://fonts.google.com/specimen/Source+Serif+Pro)
#'     for body text.
#'
#'   Their use requires the availability of the XeLaTeX engine. The easiest way
#'   to set this up is with [tinytex::install_tinytex]. See
#'   [tinytex homepage](https://yihui.name/tinytex/) for more details on why
#'   that's preferable to installing [MacTeX](http://www.tug.org/mactex/), for
#'   example.
#'
#'   You also need [pandoc](https://pandoc.org/), which comes bundled with the
#'   [RStudio IDE](https://www.rstudio.com/products/rstudio/) so you don't need
#'   to worry about that unless you're planning on rendering the
#'   [R Markdown](https://rmarkdown.rstudio.com/) document outside of RStudio.
#'
#'   **Note**: data analysis does not have to be done in R in order to benefit
#'   from this report template, as
#'   [R Mardown supports Python chunks](https://bookdown.org/yihui/rmarkdown/language-engines.html#python)
#'   via [reticulate](https://blog.rstudio.com/2018/03/26/reticulate-r-interface-to-python/)
#'   package, which allows data to be transferred between R chunks and Python
#'   chunks. See [this article](https://rstudio.github.io/reticulate/articles/r_markdown.html)
#'   for more information.
#' @aliases wmfpar
#' @docType package
#' @name wmfpar-package
NULL
