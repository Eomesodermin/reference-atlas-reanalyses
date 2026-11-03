# pipeline variables
start.time <- Sys.time()

# Set working directory to source file location
if (!requireNamespace("here", quietly = TRUE)) install.packages("here")
setwd(here::here())   # project root; works in RStudio, knitr and Rscript

working.dir <- getwd()

# For reproducibility
set.seed(42)

# Explicitly load key packages
library("Seurat")
library("SeuratDisk")
library("dplyr")
library("scCustomize")
library("usefulfunctions")
library("ggplot2")
library("usefulfunctions")


###############################
# create output directories
###############################

# Common directories 
if(!dir.exists("saves")){dir.create("saves", recursive = T)}

# scRNAseq directories
if(!dir.exists("results/")){dir.create("results/", recursive = T)}


