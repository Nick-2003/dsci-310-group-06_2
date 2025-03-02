# The Docker image has the following packages: tidyverse, tidymodels, readr, ggplot2
# tidymodels is for data splitting and cross validation; focus on recipes, rsample, tune, broom, workflows, parsnip, yardstick
FROM --platform=linux/amd64 rocker/verse

RUN apt install -y python3.11.9

COPY requirements.txt /requirements.txt

RUN python3.11.9 -r /requirements.txt

RUN Rscript -e "install.packages('remotes', repos='https://cloud.r-project.org')"

RUN Rscript -e "remotes::install_version('reticulate', version='1.25.0', repos='https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('ROSE', version='0.0-4', repos='https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('patchwork', version='1.3.0', repos='https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('glmnet', version='4.1-8', repos='https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('vcd', version='1.4-13', repos='https://cloud.r-project.org')"

RUN Rscript -e "reticulate::py_install('pandas', method = 'conda')"
RUN Rscript -e "reticulate::py_install('ucimlrepo', method = 'conda')"