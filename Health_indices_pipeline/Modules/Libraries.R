#librarires
source("Modules/RANK_SCALE.R")
library("ggplot2")
library("tidyverse")
library("pcaPP")
library("tidyr")
library("patchwork")
library("vegan")
# List of required packages
required_packages <- c("ggplot2", "tidyverse", "pcaPP", "tidyr", "patchwork", "vegan")

# Function to check and install missing packages
install_if_missing <- function(pkg) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    install.packages(pkg, dependencies = TRUE)
  }
  library(pkg, character.only = TRUE)
}
# Apply function to all packages
invisible(lapply(required_packages, install_if_missing))
source("Modules/HACK_SCORE.R")
source("Modules/DYSBIOSIS_SCORE.R") 
source("Modules/KENDALL_SCORE.R")
source("Modules/GMHI_SCORE.R")
source("Modules/Metaphlan_processing.R")
source("Modules/GMHI_HACK_Top_17_SCORE.R")
source("Modules/Boxplot_scores.R")
source("Modules/ControlvsDieseased_samples_metadata.R")
source("Modules/Wilcoxen_group.R")
source("Modules/Jaccard_index.R")