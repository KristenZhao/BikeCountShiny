#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
# ----- Shiny App -----
# Jianting Zhao
# May 9th, 2017

library(shiny)
library(dplyr)
library(leaflet)
library(ggplot2)
library(plotly)
library(lubridate)
library(scales)

#checkboxgroupinput()
#plotOutput()
# server: need a render object, e.g. renderPlot()

# read rds files
# capital_hourly <- readRDS('capital_hourly.rds')
# capital_groupByHour <- readRDS("capital_groupByHour.rds")
# monroe_hourly <- readRDS('monroe_hourly.rds')
count_hourly_tall <- readRDS('count_tall.rds')

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  bikeCount <- reactive({
    count_hourly_tall %>%
      subset(hour(hour) %in% as.numeric(input$hourOfDay)) %>%
      subset(wday(hour, label=TRUE) %in% input$dayOfWeek) %>%
      subset(month(hour, label=TRUE) %in% input$monthOfYear)
  })
  observe({
    print((as.numeric(input$hourOfDay)))
    print(input$dayOfWeek)
    input$hourOfDay
    input$dayOfWeek
    input$monthOfYear
    # updateCheckboxGroupInput(session,'hourOfDay')
  })

  output$bike_count_map <- renderLeaflet({
      leaflet() %>%
      setView(lng = "-89.402436", lat = "43.068874", zoom = 14) %>%
      addTiles() %>%
      addCircleMarkers(lng=-89.387366, lat=43.066828, popup='North Shore Drive Bike Counter, total traffic: 577,274', 
                       radius = sum(subset(count_hourly_tall, count_hourly_tall$location %in% 'capital')$count*0.00003)) %>%
      addCircleMarkers(lng=-89.412087, lat=43.068021, popup='Monroe Street Bike Counter, total traffic: 394,690',
                       radius = sum(subset(count_hourly_tall,count_hourly_tall$location %in% 'monroe')$count*0.00003))
  })

  output$dailyCount <- renderPlotly({
    plot1 <- ggplot(count_hourly_tall, aes(x=date(hour),y=count)) + geom_bar(stat='identity') + 
      facet_grid(location~.) + labs(title = 'Madison 2016 Daily Bike Traffic Pattern', 
                                    x="",y="Bike Counts") + scale_x_date(labels = date_format("%m/%d"),
                                                                         breaks = date_breaks("4 weeks")) + theme_gray() 
    ggplotly(plot1) 
  })
  
  output$graph <- renderPlotly({
    # use plotly to plot.
    plot2 <- ggplot(bikeCount(), aes(x=date(hour), y=count)) + geom_bar(stat='identity') + facet_grid(location~.) +
      labs(title = 'Traffic Count for Selected Time Ranges', x="",y="Bike Counts") + theme_gray()
    ggplotly(plot2)
  })
})

