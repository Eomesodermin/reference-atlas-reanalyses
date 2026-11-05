# Reference atlas scRNA-seq reanalyses

Reanalyses of three public reference atlases (human PBMC CITE-seq, mouse multi-organ and human multi-organ) used as healthy baselines for NK and T-cell gene expression.

[![parse-check](https://github.com/Eomesodermin/reference-atlas-reanalyses/actions/workflows/parse-check.yaml/badge.svg)](https://github.com/Eomesodermin/reference-atlas-reanalyses/actions/workflows/parse-check.yaml)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.23975573.svg)](https://doi.org/10.5281/zenodo.23975573)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## Datasets

| Folder | Study | Species | Assay | Data |
|---|---|---|---|---|
| [`hao_2021`](datasets/hao_2021) | Hao et al. (2021) [DOI](https://doi.org/10.1016/j.cell.2021.04.048) | Human | CITE-seq (RNA + 228 surface proteins, ~211k cells) | [GEO GSE164378](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE164378); also distributed through SeuratData / Azimuth |
| [`tabula_muris_2018`](datasets/tabula_muris_2018) | The The Tabula Muris Consortium (2018) [DOI](https://doi.org/10.1038/s41586-018-0590-4) | Mouse | 10x Genomics + Smart-seq2 scRNA-seq | [GEO GSE109774](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE109774); also on figshare |
| [`tabula_sapiens_2022`](datasets/tabula_sapiens_2022) | The The Tabula Sapiens Consortium (2022) [DOI](https://doi.org/10.1126/science.abl4896) | Human | 10x Genomics + Smart-seq2 scRNA-seq (~500k cells, 24 organs) | figshare / [CELLxGENE Tabula Sapiens portal](https://cellxgene.cziscience.com/collections/e5f58829-1a66-40b5-a624-9046778e74f5) |

Machine-readable version: [`datasets.csv`](datasets.csv).

## How the analyses are organised

Every folder under `datasets/` is a self-contained R project (Seurat-based):

```
datasets/<study>/
├── README.md        study citation, accession, what the analysis does, script index
├── scripts/ or R/   numbered .Rmd notebooks, run in order
├── .here            marks the folder as the project root for here::here()
└── renv.lock        pinned package versions, where available
```

Shared helper functions live in the companion package [`r-utility-functions`](https://github.com/Eomesodermin/r-utility-functions).

## Reproducing an analysis

1. Download the data listed for the study into `datasets/<study>/data/` (this directory is git-ignored).
2. Open the folder as an R project (or `setwd()` into it) and, where an `renv.lock` is present, run `renv::restore()`.
3. Knit the numbered notebooks in order.

The repository does not bundle the raw data. A CI job checks that every R script and notebook parses; it does not re-run the analyses, which need the large public datasets.

## Provenance and scope

These are exploratory reanalyses of third-party public data, written as part of my NK and T-cell research, and not the original authors' analyses. Please cite the original studies (DOIs above) when using their data.

## Licence and citation

Code is released under the [MIT licence](LICENSE). Citation metadata: [`CITATION.cff`](CITATION.cff).

Author: [Dillon Corvino](https://dilloncorvino.com) · [GitHub](https://github.com/Eomesodermin)
