FROM ubuntu:focal

# Install R
ENV R_VERSION=4.0.5
ENV TERM=xterm
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV R_HOME=/usr/local/lib/R
ENV CRAN=https://packagemanager.rstudio.com/cran/__linux__/focal/2021-05-17
ENV TZ=Etc/UTC

COPY scripts /rocker_scripts

RUN /rocker_scripts/install_R.sh

# Install RStudio
ENV S6_VERSION=v2.1.0.2
ENV RSTUDIO_VERSION=1.4.1106
ENV PATH=/usr/lib/rstudio-server/bin:$PATH

RUN /rocker_scripts/install_rstudio.sh
RUN /rocker_scripts/install_pandoc.sh

EXPOSE 8787

# # Install zlib
# RUN wget https://zlib.net/zlib-1.2.11.tar.gz
# RUN tar -xvzf zlib-1.2.11.tar.gz
# RUN cd zlib-1.2.11
# RUN ./configure --prefix=/usr/local/zlib
# RUN make install

# Install BiocManager
RUN R -e "install.packages('BiocManager')"

# Install additional R packages
RUN R -e "install.packages(c('stringr','remotes','foreach','doParallel', 'MCMCpack', 'ggpubr', 'ggmcmc', 'bayesplot', 'ggplotify', 'reshape', 'gtools'), repos = c(CRAN = 'https://cloud.r-project.org'))"
# RUN R -e "BiocManager::install('rhdf5', configure.args = c(Rhdf5lib = '--with-zlib=/usr/local/zlib'))"
# RUN R -e "BiocManager::install('rhdf5')"

# Install cmdstanr
RUN R -e "remotes::install_github('stephensrmmartin/cmdstanr', ref='158bedad4ad5cbc1dba2623bf02fe4bab5028101')"

# Install cmdstan - try #2 - fails the same way as try #1
RUN R -e "cmdstanr::install_cmdstan(release_url='https://github.com/stephensrmmartin/cmdstan/releases/download/v2.26.1-2-RVI-Lowrank/cmdstan-lowrank_robust.tar.gz')"

# only one CMD per file
CMD ["/init"]

