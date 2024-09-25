# Base R Shiny image
FROM rocker/shiny
 
# Install R dependencies
RUN R -e 'install.packages()'
 
RUN mkdir home/my_app
 
# Copy the Shiny app code
COPY *.R /home/my_app
 
# Expose the application port
EXPOSE 3838
 
# Run the R Shiny app
CMD R -e 'shiny::runApp(`/home/my_app`,port = 3838, host = `0.0.0.0`)'
