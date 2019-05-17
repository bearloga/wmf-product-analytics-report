#' @title WMF Product Analytics PDF Report
#' @description Creates a branded PDF document from R Markdown.
#' @param font_size base font size to typeset the document in (12pt default)
#' @param page_margins 1in margins by default (recommended to keep unchanged)
#' @param short_title shorter version of the title to be printed on the
#' top-right corner of every page, except the front page
#' @param watermark watermark Text to be printed on the page, useful for first,
#'   second, etc. drafts
#' @param cite_r_packages character vector of packages to generate a bibliography
#'   for; necessary ones like `base` and `rmarkdown` will be cited regardless
#' @param extra_bibs character vector of paths to `.bib` files to include in
#'   the final bibliography
#' @param toc T/F value for table of contents. See `?rmarkdown::pdf_document`
#'   for details
#' @param lot,lof T/F value for list of tables/figures
#' @param ... other options to be passed to [rmarkdown::pdf_document]
#' @importFrom rmarkdown pandoc_variable_arg
#' @export
pdf_report <- function(font_size = "12pt", page_margins = "1in",
                       short_title = NULL, watermark = NULL,
                       cite_r_packages = NULL, extra_bibs = NULL,
                       toc = FALSE, lot = FALSE, lof = FALSE, ...) {

  args <- list(...)
  if ("includes" %in% names(args)) {
    if (!"in_header" %in% names(args$includes)) args$includes$in_header <- list(NULL)
    if (!"before_body" %in% names(args$includes)) args$includes$before_body <- list(NULL)
    if (!"after_body" %in% names(args$includes)) args$includes$after_body <- list(NULL)
  }

  cite_r_packages <- union(c("base", "rmarkdown", "knitr", "memor", "wmfpar"), cite_r_packages)
  r_packages_bib <- tempfile("wmfpar_rpkgs_", fileext = ".bib")
  knitr::write_bib(cite_r_packages, r_packages_bib)
  if (!is.null(extra_bibs)) {
     for (extra_bib in extra_bibs) file.append(r_packages_bib, extra_bib)
  }

  wmfpar_args <- c(
    pandoc_variable_arg("fontsize", font_size),
    pandoc_variable_arg("geometry", paste0("margin=", page_margins)),
    pandoc_variable_arg("subparagraph"),
    pandoc_variable_arg("mainfont", "Source Serif Pro"),
    rmarkdown::pandoc_include_args(
      in_header = unlist(c(
        system.file("rmarkdown/templates/wmfpar/resources/preamble.tex", package = "wmfpar"),
        args$includes$in_header
      )),
      before_body = unlist(args$includes$before_body),
      after_body = unlist(args$includes$after_body)
    )
  )

  wmf_logo <- system.file(
    "rmarkdown/templates/wmfpar/resources/wikimedia_foundation_logo.png",
    package = "wmfpar"
  )

  config <- memor::pdf_memo(
    use_profile = FALSE,
    short_title = short_title,
    watermark = watermark,
    toc = toc, lot = lot, lof = lof,
    fancy_captions = FALSE,
    number_sections = FALSE,
    libertine = FALSE,
    logo = wmf_logo, logo_height = "1.25in",
    company = list(
      "\\href{https://www.mediawiki.org/wiki/Wikimedia_Audiences}{Wikimedia Audiences}",
      "\\href{https://www.mediawiki.org/wiki/Product_Analytics}{Product Analytics}",
      "product-analytics@wikimedia.org"
    ),
    latex_engine = "xelatex",
    pandoc_args = c(
      "--bibliography", r_packages_bib,
      "--filter", rmarkdown:::pandoc_citeproc(),
      "--csl", system.file("rmarkdown/templates/wmfpar/resources/apa.csl", package = "wmfpar")
    )
  )

  pre_pandoc <- config$pandoc$args
  config$pandoc$args <- c(pre_pandoc, wmfpar_args)

  return(config)
}
