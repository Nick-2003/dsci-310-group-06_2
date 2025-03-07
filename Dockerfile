# The Docker image has the following packages: tidyverse, tidymodels, readr, ggplot2
# tidymodels is for data splitting and cross validation; focus on recipes, rsample, tune, broom, workflows, parsnip, yardstick
FROM --platform=linux/amd64 rocker/verse



RUN Rscript -e "install.packages('remotes', repos='https://cloud.r-project.org')"

RUN Rscript -e "remotes::install_version('reticulate', version='1.25.0', repos='https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('ROSE', version='0.0-4', repos='https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('patchwork', version='1.3.0', repos='https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('glmnet', version='4.1-8', repos='https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('vcd', version='1.4-13', repos='https://cloud.r-project.org')"
# RUN Rscript -e "remotes::install_version('docopt', version='0.6.2', repos='https://cloud.r-project.org')"


#RUN apt-get update && apt-get install -y python3-pip
#RUN Rscript -e "system('pip3 install pandas')"
# RUN Rscript -e "reticulate::py_install('pandas', method='pip3')" # Already installed by above
#RUN Rscript -e "system('pip3 install -U ucimlrepo')"
# RUN Rscript -e "reticulate::py_install('ucimlrepo', method='pip3')"

RUN apt update
RUN apt install -y python3.12 python3-pip python3-venv

COPY requirements.txt /requirements.txt
# To install python

RUN python3 -m venv /venv && \
    . /venv/bin/activate && \
    pip3 install -r /requirements.txt

#COPY requirements.txt /requirements.txt

#RUN pip3 install -r /requirements.txt # Install packages into python