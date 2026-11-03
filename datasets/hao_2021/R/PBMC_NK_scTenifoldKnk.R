NK.seurat # 20,957 genes and 18,664 cells


#SaveH5Seurat(NK.seurat, 
 #            filename = "Exported_RDS_files/pbmc_multimodal_NK_cells_only.h5seurat",
  #           overwrite = TRUE)


nrow(NK.seurat)
ncol(NK.seurat)



random.cells <- sample(1:ncol(NK.seurat), size = 8000)




input.df <- NK.seurat@assays$SCT@counts

# reduce to random cells 
input.df <- input.df[, random.cells]
nrow(input.df)
ncol(input.df)



order.index <- order(rowSums(as.matrix(input.df)), decreasing = T)
input.df <- input.df[order.index, ]
head(input.df)


# Use only the top 8000 genes detected
input.df <- input.df[1:8000, ]
dim(input.df) # 8000, 8000

View(input.df)


grep("NKG7", rownames(input.df), value = T)

dim(input.df)




output.data <- scTenifoldKnk::scTenifoldKnk(countMatrix = input.df, 
                                            gKO = "NKG7",
                                            qc_mtThreshold = 0.1,
                                            qc_minLSize = 1000,
                                            nc_lambda = 0,
                                            nc_nNet = 10,
                                            nc_nCells = 100,
                                            nc_nComp = 5,
                                            nc_scaleScores = TRUE,
                                            nc_symmetric = FALSE,
                                            nc_q = 0.9,
                                            td_K = 3,
                                            td_maxIter = 1000,
                                            td_maxError = 1e-05,
                                            td_nDecimal = 3,
                                            ma_nDim = 2)

output.data$manifoldAlignment
x <- output.data$diffRegulation
output.data$tensorNetworks

saveRDS(output.data, "NKG7_KO_NK_cells_scTenifoldKnk.rds")


