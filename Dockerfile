FROM rocker/shiny

ARG CRAN_MIRROR=https://cloud.r-project.org
ENV CRAN_MIRROR=${CRAN_MIRROR}
ENV RENV_CONFIG_PAK_ENABLED=TRUE
ENV RENV_CONFIG_AUTOLOADER_ENABLED=false

WORKDIR /home/app

RUN apt-get update && apt-get install -y --no-install-recommends \
		curl \
		perl \
		pkg-config \
		libssl-dev \
		libxml2-dev \
		libcurl4-openssl-dev \
	&& rm -rf /var/lib/apt/lists/*

# Restore the project library from the lockfile before copying the app source.
COPY renv.lock /home/app/renv.lock
COPY renv/activate.R /home/app/renv/activate.R
COPY renv/settings.json /home/app/renv/settings.json

RUN Rscript -e "if (!requireNamespace('renv', quietly = TRUE)) install.packages('renv', repos = Sys.getenv('CRAN_MIRROR', 'https://cloud.r-project.org')); options(renv.config.pak.enabled = TRUE); restore_res <- try(renv::restore(prompt = FALSE, lockfile = '/home/app/renv.lock'), silent = TRUE); if (inherits(restore_res, 'try-error')) { message('pak-enabled restore failed, retrying with standard renv restore.'); options(renv.config.pak.enabled = FALSE); renv::restore(prompt = FALSE, lockfile = '/home/app/renv.lock') }"

# Copy the Shiny app code
COPY . /home/app

EXPOSE 3838

# Run the app without site/user profiles to avoid renv autoloader re-bootstrap.
CMD ["R", "--no-save", "--no-site-file", "--no-init-file", "-e", "shiny::runApp('/home/app', port = 3838, host = '0.0.0.0')"]
