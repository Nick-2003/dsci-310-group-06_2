# Initially has tidyverse and base terminal for R
FROM jupyter/r-notebook:ubuntu-22.04 
# FROM rocker/rstudio:4.4.2

# Install R packages
RUN Rscript -e "install.packages('remotes', repos='https://cloud.r-project.org')"

RUN Rscript -e "remotes::install_version('reticulate', version='1.25.0', repos='https://cloud.r-project.org')" # Provides python packages
RUN Rscript -e "remotes::install_version('ROSE', version='0.0-4', repos='https://cloud.r-project.org')"

# tidymodels is for data splitting and cross validation
RUN Rscript -e "remotes::install_version('tidymodels', version='1.2.0', repos='https://cloud.r-project.org', Ncpus=4)"

# # Conditionally install tidymodels (only if INSTALL_TIDYMODELS=true)
# RUN Rscript -e "if (!requireNamespace('recipes', quietly = TRUE)) remotes::install_version('recipes', version='1.0.6', repos='https://cloud.r-project.org', Ncpus=4)"; \
# RUN Rscript -e "if (!requireNamespace('rsample', quietly = TRUE)) remotes::install_version('rsample', version='1.2.1', repos='https://cloud.r-project.org', Ncpus=4)"; \
# RUN Rscript -e "if (!requireNamespace('tune', quietly = TRUE)) remotes::install_version('tune', version='1.1.1', repos='https://cloud.r-project.org', Ncpus=4)"; \
# RUN Rscript -e "if (!requireNamespace('broom', quietly = TRUE)) remotes::install_version('broom', version='1.0.5', repos='https://cloud.r-project.org', Ncpus=4)"; \
# RUN Rscript -e "if (!requireNamespace('workflows', quietly = TRUE)) remotes::install_version('workflows', version='1.1.3', repos='https://cloud.r-project.org', Ncpus=4)"; \
# RUN Rscript -e "remotes::install_version('parsnip', version='1.3.0', repos='https://cloud.r-project.org')"
# RUN Rscript -e "remotes::install_version('yardstick', version='1.0.0', repos='https://cloud.r-project.org')"

RUN Rscript -e "remotes::install_version('readr', version='2.1.5', repos='https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('ggplot2', version='3.5.1', repos='https://cloud.r-project.org')" # Version too low
RUN Rscript -e "remotes::install_version('patchwork', version='1.3.0', repos='https://cloud.r-project.org')"

# Install python packages
RUN Rscript -e "reticulate::py_install('pandas', method = 'conda')"
RUN Rscript -e "reticulate::py_install('ucimlrepo', method = 'conda')"