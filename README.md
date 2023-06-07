## Github Repository for
# Population genomic analysis reveals geographic structure and climatic diversification for *Macrophomina phaseolina* isolated from soybean and dry bean across the US, Puerto Rico, and Colombia

## by Viviana Ortiz Londoño, Hao-Xun Chang, Hyunkyu Sang, Janette Jacobs, Dean K. Malvick, Richard Baird, Febina M. Mathew, Consuelo Estévez de Jensen, Kiersten A. Wise, Gloria M. Mosquera and Martin I. Chilvers



<i>This work is published.</i>


### Data
The raw data for this study are available on NCBI, as bioproject 953167(https://www.ncbi.nlm.nih.gov/bioproject/953167). 


### To cite this work or code
[Paper Link](https://www.frontiersin.org/articles/10.3389/fgene.2023.1103969/full)

Ortiz, V., Chang, H.X., Sang, H., Jacobs, J., Malvick, D.K., Baird, R., Mathew, F.M., Wise, K.A., Mosquera, G.M. and Chilvers, M.I., Population genomic analysis reveals geographic structure and climatic diversification for *Macrophomina phaseolina* isolated from soybean and dry bean across the US, Puerto Rico, and Colombia. Frontiers in Genetics, 14, p.740 (2023). https://doi.org/10.3389/fgene.2023.1103969

### Abstract
*Macrophomina phaseolina* causes charcoal rot, which can significantly reduce yield and seed quality of soybean and dry bean resulting from primarily environmental stressors. Although charcoal rot has been recognized as a warm climate-driven disease of increasing concern under global climate change, knowledge regarding population genetics and climatic variables contributing to the genetic diversity of *M. phaseolina* is limited. This study conducted genome sequencing for 95 M. phaseolina isolates from soybean and dry bean across the continental United States, Puerto Rico, and Colombia. Inference on the population structure using 76,981 single nucleotide polymorphisms (SNPs) revealed that the isolates exhibited a discrete genetic clustering at the continental level and a continuous genetic differentiation regionally. A majority of isolates from the United States (96%) grouped in a clade with a predominantly clonal genetic structure, while 88% of Puerto Rican and Colombian isolates from dry bean were assigned to a separate clade with higher genetic diversity. A redundancy analysis (RDA) was used to estimate the contributions of climate and spatial structure to genomic variation (11,421 unlinked SNPs). Climate significantly contributed to genomic variation at a continental level with temperature seasonality explaining the most variation while precipitation of warmest quarter explaining the most when spatial structure was accounted for. The loci significantly associated with multivariate climate were found closely to the genes related to fungal stress responses, including transmembrane transport, glycoside hydrolase activity and a heat-shock protein, which may mediate climatic adaptation for *M. phaseolina*. On the contrary, limited genome-wide differentiation among populations by hosts was observed. These findings highlight the importance of population genetics and identify candidate genes of M. phaseolina that can be used to elucidate the molecular mechanisms that underly climatic adaptation to the changing climate.

### Organization of this repository
 
#### Scripts:

- Variant calling scripts: GATK_SNPCalling folder

- R scripts for variant filtering, population genomics, redundancy analysis (RDA) and linkage disqeuilibrium estimation (LD): .R and .Rmd files

#### Data:

- Isolates database: 2021_95mp_vcforder_climKG2018_1km.csv

- Isolates database and climatic variables: 021420_prempdata_95.csv

- Variant calling files: .vcf, .vcf.gz and .vcf.zip files

- Alignment in phylip format: .phy file

- Spatial population structure with TESS3R: 0122_TESS3_data

- Linkage disequilibrium data: LD_estimation folder

- Extended Data Supplementary File 1: b23ebe507a929c20.zip. This is the output data from Phyre2 for structural modeling of the 753,275-ankyrin protein 
