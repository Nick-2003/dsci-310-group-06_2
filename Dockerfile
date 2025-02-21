FROM jupyter/r-notebook:x86_64-ubuntu-22.04


RUN Rscript -e "install.packages('remotes', repos='https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('reticulate', version='1.25.0', repos='https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('ggplot2', version='3.3.6', repos='https://cloud.r-project.org')"
