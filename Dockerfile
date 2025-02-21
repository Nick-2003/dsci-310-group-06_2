FROM rocker/rstudio:4.4.2

RUN Rscript -e "install.packages('remotes')" # Double quotes for command itself, single quotes for within command 
RUN Rscript -e "remotes::install_version('renv', version='1.0.11')" # Install renv; since install_version is the same as install.packages; renv starts over or use lock file to instlal everything with renv 

COPY analysis.qmd /home/rstudio/analysis.qmd
CMD ["quarto", "render", "/home/rstudio/analysis.qmd"] # May not work for .qmd