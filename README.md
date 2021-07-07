# Create a dockerized VM for RStudio
This Docker image enables testing dev versions of cmdstan and cmdstanr.

## Settings
OS is Ubuntu 20.04.   
R v4.0.5.   
RStudio.   
cmdstan - https://github.com/stephensrmmartin/cmdstan/releases/tag/v2.26.1-2-RVI-Lowrank.     
cmdstanr - https://github.com/stephensrmmartin/cmdstanr/tree/feature/rvi.  

## Run and build image
Be sure to increase docker memory to at least 5GB!

Run image:
$ docker build -t klgeyer/docker-rvi-stan .

Build container:
$ docker run -p 8787:8787 -e PASSWORD=123 klgeyer/mutsig

Copy directory if building container:
$ docker run -p 8787:8787 -e PASSWORD=123 -d -P --name doit -v /Users/kellygeyer/Documents/github/stan-rvi-models:/code klgeyer/docker-rvi-stan

## Contents
1. Dockerfile 
2. scripts - Directory of supporting bash scripts
3. old-stuff - Diretory of depreciated code

## References
1. https://blog.cloud66.com/how-to-get-code-into-a-docker-container/
2. https://hub.docker.com/r/rocker/rstudio
3. https://colinfay.me/docker-r-reproducibility/

