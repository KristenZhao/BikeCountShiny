# Madison, Wisconsin Bike Trail Traffic Visualization for 2016

This application includes the following features:

1. A map that shows where the bike counters are located
2. Visualizations of bike counts aggregated to municipalities.
3. A daily temperature chart for Madison, WI in 2016 as a reference to compare the traffic pattern to temperature

The following R Packages were used to prepare the data for this app:

- dplyr
- lubridate
- readr
- magrittr
- stringr
- purrr
- tidyr

The following R Packages are used to render this app:

- shiny
- shinydashboard
- dplyr
- leaflet
- ggplot2
- lubridate
- plotly

To run this app locally make sure you've installed the R packages mentioned above, then
run:

```
shiny::runGitHub("kristenzhao/BikeCountShiny")
```


