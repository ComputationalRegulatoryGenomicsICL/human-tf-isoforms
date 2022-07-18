FROM  rocker/tidyverse:4.1.3

# Install libraries for R packages
RUN apt-get clean all && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
        openjdk-11-jdk \
        lzma \
        liblzma-dev \
        libbz2-dev

# Set CRAN and BioC repositories for package installations
RUN echo 'local({library(BiocManager); r <- repositories(); r["CRAN"] <- "https://cran.rstudio.com/"; options(repos = r)}); \
            options(HTTPUserAgent = sprintf("R/%s R (%s)", getRversion(), paste(getRversion(), R.version$platform, R.version$arch, R.version$os)))' >> /usr/local/lib/R/etc/Rprofile.site

# Install R packages
RUN R -e "install.packages('unixtools', , 'http://rforge.net/', type = 'source')" && \
    R -e "install.packages('circlize')" && \
    R -e "install.packages('data.tree')" && \
    R -e "install.packages('fpc')" && \
    R -e "install.packages('ggforce')" && \
    R -e "install.packages('ggrepel')" && \
    R -e "install.packages('devtools')" && \
    R -e "install.packages('gridExtra')" && \
    R -e "install.packages('hash')" && \
    R -e "install.packages('hexbin')" && \
    R -e "install.packages('kableExtra')" && \
    R -e "install.packages('rlist')" && \
    R -e "install.packages('seqinr')" && \
    R -e "install.packages('tictoc')" && \
    R -e "install.packages('R.utils')" && \
    R -e "devtools::install_github('davidsjoberg/ggsankey')" && \
    R -e "BiocManager::install('biomaRt')" && \
    R -e "BiocManager::install('hypeR')" && \
    R -e "BiocManager::install('limma')" && \
    R -e "BiocManager::install('msa')" && \
    R -e "BiocManager::install('preprocessCore')" && \
    R -e "BiocManager::install('DESeq2')" && \
    R -e "BiocManager::install('XLConnect')" && \
    R -e "BiocManager::install('ComplexHeatmap')" && \
    R -e "BiocManager::install('rtracklayer')"
