# FROM rocker/rstudio:4.4.2

# RUN Rscript -e "install.packages('remotes')" # Double quotes for command itself, single quotes for within command 
# RUN Rscript -e "remotes::install_version('renv', version='1.0.11')" # Install renv; since install_version is the same as install.packages; renv starts over or use lock file to instlal everything with renv 

# COPY analysis.qmd /home/rstudio/analysis.qmd
# CMD ["quarto", "render", "/home/rstudio/analysis.qmd"] # May not work for .qmd

FROM jupyter/r-notebook:x86_64-ubuntu-22.04


RUN Rscript -e "install.packages('remotes', repos='https://cloud.r-project.org')"

RUN Rscript -e "remotes::install_version('reticulate', version='1.25.0', repos='https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('ROSE', version='0.0-4', repos='https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('tidymodels', version='1.2.0', repos='https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('ggplot2', version='3.5.1', repos='https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('patchwork', version='1.3.0', repos='https://cloud.r-project.org')"

RUN Rscript -e "reticulate::py_install('pandas', method = 'conda')"
RUN Rscript -e "reticulate::py_install('ucimlrepo', method = 'conda')"