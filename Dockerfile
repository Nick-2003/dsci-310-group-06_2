# The Docker image has the following packages: tidyverse, tidymodels, readr, ggplot2
# tidymodels is for data splitting and cross validation; focus on recipes, rsample, tune, broom, workflows, parsnip, yardstick
FROM --platform=linux/amd64 rocker/verse

RUN Rscript -e "install.packages('remotes', repos='https://cloud.r-project.org')"

RUN Rscript -e "remotes::install_version('reticulate', version='1.25.0', repos='https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('ROSE', version='0.0-4', repos='https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('patchwork', version='1.3.0', repos='https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('glmnet', version='4.1-8', repos='https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('vcd', version='1.4-13', repos='https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('tidymodels', version='1.2.0', repos='https://cloud.r-project.org')"

#RUN apt-get update && apt-get install -y python3-pip
#RUN Rscript -e "system('pip3 install pandas')"
# RUN Rscript -e "reticulate::py_install('pandas', method='pip3')" # Already installed by above
#RUN Rscript -e "system('pip3 install -U ucimlrepo')"
# RUN Rscript -e "reticulate::py_install('ucimlrepo', method='pip3')"

RUN apt update
RUN apt install -y python3.12 python3-pip python3-venv

# To install python
COPY requirements.txt /requirements.txt

# Create and activate a virtual environment, then install packages
RUN python3 -m venv /venv && \
    . /venv/bin/activate && \
    /venv/bin/pip install --upgrade pip && \
    /venv/bin/pip install -r /requirements.txt
    # pip3 install --upgrade pip3 && \
    # pip3 install -r /requirements.txt

# Ensures the virtual environment has appropriate permissions for all users inside the container
RUN chmod -R 777 /venv

# Set RETICULATE_PYTHON so R and RStudio use the virtual environment's Python
ENV RETICULATE_PYTHON="/venv/bin/python"

# Ensure the system uses the virtual environment's Python
ENV PATH="/venv/bin:$PATH"

# Set working directory
WORKDIR /home/rstudio

# # Cannot install without conda
# RUN Rscript -e "reticulate::py_install('pandas', method = 'conda')"
# RUN Rscript -e "reticulate::py_install('ucimlrepo', method = 'conda')"
