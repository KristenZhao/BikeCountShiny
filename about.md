# Madison, Wisconsin Bike Trail Traffic Visualization for 2016

Madison, Wisconsin is a city that I lived in for five years. I especially like the scenic bike trails that the city features. On the other hand, Madison is known for its chilly weather for 3/4 times of the year. So I often wonder, when would people choose to bike throughout the year? Fortunately, City of Madison now has two bike counters that collects data every 15 minutes. Therefore, I would like to create an interactive map to visualize their traffic count. The bike counters are located at North Shore Drive and Monroe Street respectively, and the data is available for the entire 2016. 
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


