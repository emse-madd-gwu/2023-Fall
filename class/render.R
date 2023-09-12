lesson <- strsplit(here::here(), "/")[[1]]
lesson <- lesson[length(lesson)]

# Build the slides
renderthis::to_html("index.Rmd", "index.html")
renderthis::to_pdf("index.html", paste0(lesson, ".pdf"))

# Compress the PDF to reduce size
tools::compactPDF(paste0(lesson, ".pdf"), gs_quality = 'ebook')

# Create zip files of class notes
zip::zip(
    zipfile = paste0(lesson, ".zip"),
    files = c(
        "quarto_demo.qmd",
        "bears_solutions.qmd",
        "bears.qmd",
        "data",
        "ggplot2_solutions.qmd",
        "ggplot2.qmd",
        "logo.png",
        paste0(lesson, ".Rproj"))
)
