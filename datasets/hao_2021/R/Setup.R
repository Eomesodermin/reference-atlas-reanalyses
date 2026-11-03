# pipeline variables
start.time <- Sys.time()

# Set working directory to source file location
if (!requireNamespace("here", quietly = TRUE)) install.packages("here")
setwd(here::here())   # project root; works in RStudio, knitr and Rscript

working.dir <- getwd()

# For reproducibility
set.seed(42)

# Load custom functions
source("R/Functions/scRNAseq_function.R", local = knitr::knit_global())
source("R/Functions/scRNAseq_Correlation.R", local = knitr::knit_global())


###############################
# create output directories
###############################

# Common directories 
if(!dir.exists("Exported_h5seurat_files")){dir.create("Exported_h5seurat_files", recursive = T)}

# scRNAseq directories
if(!dir.exists("output")){dir.create("output", recursive = T)}
if(!dir.exists("output/figures")){dir.create("output/figures", recursive = T)}

