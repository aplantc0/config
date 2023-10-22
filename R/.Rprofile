q <- function (save = "no", ...) { # to not save workspace on quit 
  quit(save = save, ...)
}

utils::rc.settings(ipck = TRUE) # tab completion package names in "library()" or "require()" calls

.First <- function() cat("\n   Welcome to R!\n\n")
.Last <- function()  cat("\n   Goodbye!\n\n")

# https://github.com/gadenbuie/rsthemes#automatic-or-manual-lightdark-mode
if (interactive() && requireNamespace("rsthemes", quietly = TRUE)) {
# Set preferred themes if not handled elsewhere..
  rsthemes::set_theme_light("One Light {rsthemes}")  # light theme
  rsthemes::set_theme_dark("One Dark {rsthemes}") # dark theme
# Whenever the R session restarts inside RStudio...
  setHook("rstudio.sessionInit", function(isNewSession) {
    # Automatically choose the correct theme based on time of day
    #rsthemes::use_theme_auto(dark_start = "14:00", dark_end = "8:00")
  }, action = "append")
}

#options(repos = c(CRAN = "https://mirrors.nic.cz/R/"))
options(repos = c(CRAN = "https://cran.wu.ac.at/"))
