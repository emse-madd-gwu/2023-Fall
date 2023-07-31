# Install packages - only need to do this once!

# Install packages from CRAN
install.packages(c(
    "Cairo",
    "cowplot",
    "fastDummies",
    "ggrepel",
    "here",
    "janitor",
    "kableExtra",
    "knitr",
    "logitr",
    "MASS",
    "remotes",
    "rmarkdown",
    "tidyverse",
    "viridis"
))

# Install development packages from GitHub
remotes::install_github("emse-madd-gwu/maddTools")
remotes::install_github("jhelvy/cbcTools")
