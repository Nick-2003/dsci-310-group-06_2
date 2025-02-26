# The Docker image has the following packages: tidyverse, tidymodels, readr, ggplot2
# tidymodels is for data splitting and cross validation; focus on recipes, rsample, tune, broom, workflows, parsnip, yardstick
FROM jupyter/r-notebook:x86_64-ubuntu-22.04


RUN Rscript -e "install.packages('remotes', repos='https://cloud.r-project.org')"

# Install R packages
RUN Rscript -e "remotes::install_version('reticulate', version='1.25.0', repos='https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('ROSE', version='0.0-4', repos='https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('patchwork', version='1.3.0', repos='https://cloud.r-project.org')"

# Install python packages
RUN Rscript -e "reticulate::py_install('pandas', method = 'conda')"
RUN Rscript -e "reticulate::py_install('ucimlrepo', method = 'conda')"