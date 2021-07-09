#!/usr/bin/env Rscript

# HEADER------------------------------------------------------------------------
# Author: Kelly Geyer, klgeyer@bu.edu
# Date: June 30, 2021
# Development: R v4.0.5 on Ubuntu 20.04
# Description: This script installs and initializes R packages that may not have 
# been installed while building the image or container.

# SET UP CMDSTAN----------------------------------------------------------------
# Configure cmdstan if it's not already completed.
library(cmdstanr)
cmdstan_url = 'https://github.com/stephensrmmartin/cmdstan/releases/download/v2.26.1-2-RVI-Lowrank/cmdstan-lowrank_robust.tar.gz'
if (cmdstanr::cmdstan_path() != "/home/rstudio/.cmdstanr/cmdstan-lowrank_robust"){
  print("Configure the cmdstan path...")
  cmdstanr::install_cmdstan(release_url = cmdstan_url)
}

# INSTALL R PACKAGES------------------------------------------------------------
# install.packages('ggpubr')

# # Install BiocManager
# install.packages('BiocManager')
# #BiocManager::install("Rhdf5lib", configure.args = c(Rhdf5lib = '--with-zlib=/home/rstudio/zlib'))
# #BiocManager::install('rhdf5')
# #BiocManager::install('rhdf5', configure.args = c(rhdf5 = '--with-zlib=/home/rstudio/zlib'))
# BiocManager::install('rhdf5', configure.args = c(Rhdf5lib = '--with-zlib=/home/rstudio/zlib'))
