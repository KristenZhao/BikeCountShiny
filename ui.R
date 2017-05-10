#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(leaflet)
library(shinythemes)
library(shinytoastr)
library(plotly)

# Define UI for application that draws a histogram
dashboardPage(
  skin = 'blue',
  dashboardHeader(title = "Madison Bike Count", titleWidth = 230),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Map of Madison", tabName = "map", icon = icon("map")),
      menuItem("Graphs", tabName = "graphs", icon = icon("signal", lib = "glyphicon")),
      menuItem("About", tabName = "about", icon = icon("question-circle")),
      menuItem("Source Code", href = "https://github.com/KristenZhao/MadisonBikeCount/", icon = icon("github-alt"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "map",
              fluidRow(
                column(width = 12,
                       box(width = NULL, title = 'Bike counter locations as shown in blue circles',
                           footer = 'Circle sizes are in proportion to the ratio between total traffic counts at two locations.',
                           leafletOutput("bike_count_map", height = 200))
                )
              ),
              fluidRow(
                column(width= 12,
                       box(width = NULL,
                           plotlyOutput('dailyCount')))
              ),
              fluidRow(
                column(width=12,
                       box(width = NULL, footer = 'retrieved from http://www.aos.wisc.edu/~sco/clim-history/stations/msn/msn-tts-2016.gif',
                           tags$img(src='2016MadisonWeather.gif',width = 700)))
              )
      ),
      tabItem(tabName = "graphs",
              fluidRow(
                column(width = 12,
                       box(width = NULL,
                           plotlyOutput("graph")))
              ),
              fluidRow(
                column(width = 4,
                       box(width = NULL,
                           checkboxGroupInput('hourOfDay', 'Select the hours of day you are interested', 
                                              choices = c(0:23), selected = 8, inline = TRUE)
                           )
                       ),
                column(width = 4,
                       box(width = NULL,
                           checkboxGroupInput('dayOfWeek', 'Select the days of week you are interested',
                                              choices = c('Sun','Mon','Tues','Wed','Thurs','Fri','Sat'),
                                              selected = 'Sun', 
                                                           inline = FALSE)
                           )
                       ),
                column(width = 4,
                        box(width = NULL,
                            checkboxGroupInput('monthOfYear', 'Select the months of year you are interested',
                                               choices = c('Jan','Feb','Mar','Apr','May','Jun','Jul','Aug',
                                                           'Sep','Oct','Nov','Dec'), inline = TRUE, selected = 'Jan')
                            )
                       )
                   )
              ),
      tabItem(tabName = "about",
              fluidRow(
                column(width = 12,
                       box(width = NULL,
                           includeMarkdown("about.md")))
              )
      )
      )
)
)

