# Madison, Wisconsin Bike Trail Traffic Visualization for 2016

Madison, Wisconsin is a city that I lived in for five years. I especially like the scenic bike trails that the city features. Fortunately, the city installed two bike counters and recorded the bike traffic in 15-mintute intervals. I am interested to visualize the bike traffic at these two locations and get a sense of how these trails are used by citizens.  
This application includes the following features:

1. An interactive map of Philadelphia including:
  - Clustered Bike Count locations
  - Popup text for traffic at each count location
2. Widgets that provides summaries of bike traffic pattern.
3. A calendar that allows the user to filter bike count data by date. This calendar
is consistent throughout the app.
4. Visualizations of bike counts aggregated to municipalities.

The following R Packages were used to prepare the data for this app:

- dplyr
- lubridate
- readr
- magrittr
- stringr
- purrr

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
shiny::runGitHub("kristenzhao/Philadelphia-Bike-Count")
```


