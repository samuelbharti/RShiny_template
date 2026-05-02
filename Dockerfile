FROM rocker/shiny

WORKDIR /srv/shiny-server/app

# Copy app code first so Docker layer cache is reused when possible.
COPY . /srv/shiny-server/app

# Restore dependencies from renv.lock when available.
RUN R -q -e "if (!requireNamespace('renv', quietly = TRUE)) install.packages('renv', repos = 'https://cloud.r-project.org'); if (file.exists('renv.lock')) {renv::restore(prompt = FALSE)} else {install.packages('shiny', repos = 'https://cloud.r-project.org')}"

EXPOSE 3838

CMD ["R", "-q", "-e", "shiny::runApp('/srv/shiny-server/app', host = '0.0.0.0', port = 3838)"]
