# Initially has tidyverse and base terminal for R
FROM jupyter/r-notebook:ubuntu-22.04 
# FROM rocker/rstudio:4.4.2

# Install R packages
RUN Rscript -e "install.packages('remotes', repos='https://cloud.r-project.org')"

RUN Rscript -e "remotes::install_version('reticulate', version='1.25.0', repos='https://cloud.r-project.org')" # Provides python packages
RUN Rscript -e "remotes::install_version('ROSE', version='0.0-4', repos='https://cloud.r-project.org')"

# tidymodels is for data splitting and cross validation
RUN Rscript -e "remotes::install_version('tidymodels', version='1.2.0', repos='https://cloud.r-project.org', Ncpus=4)"
# RUN Rscript -e "remotes::install_version('rsample', version='1.2.1', repos='https://cloud.r-project.org', Ncpus=4)"
RUN Rscript -e "remotes::install_version('ggplot2', version='3.5.1', repos='https://cloud.r-project.org')" # Version too low
RUN Rscript -e "remotes::install_version('patchwork', version='1.3.0', repos='https://cloud.r-project.org')"

# Install python packages
RUN Rscript -e "reticulate::py_install('pandas', method = 'conda')"
RUN Rscript -e "reticulate::py_install('ucimlrepo', method = 'conda')"
