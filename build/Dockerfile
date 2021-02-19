FROM rocker/shiny:4.0.3

ENV RENV_VERSION 0.12.5-2

RUN \
    # Ensure shiny-server is run as the shiny user:
    sed -i 's/exec/exec s6-setuidgid shiny/g' /etc/services.d/shiny-server/run && \
    # Remove all the examples:
    rm -r /srv/shiny-server && \
    # Install Renv:
    R -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))" && \
    R -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')" && \
    R -e "renv::consent(provided = TRUE)"

WORKDIR /srv/shiny-server/app/

COPY renv.lock .
RUN R -e "renv::restore()"

COPY app.R .

CMD ["R", "-e", "shiny::runApp(port = 3838, host = '0.0.0.0')"]
