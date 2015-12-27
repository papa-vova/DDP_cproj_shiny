library(shiny)
source("helpers.R")
shinyUI(fluidPage(
  headerPanel("Linear Approximation Demo"),
  sidebarLayout(position="right",
    sidebarPanel(
      numericInput("intercept",
                   label="Intercept",
                   value = g_ic,
                   min = g_ic_min,
                   max = g_ic_max,
                   step = round((g_ic_max - g_ic_min)/10, 2)),
      numericInput("slope",
                   label="Slope",
                   value = g_slope,
                   min = 0,
                   max = 1,
                   step = 0.005),
      radioButtons("MSE_show", label = "Mean Squared Error (MSE)",
                   choices = list("Show" = 1, "Hide" = 2), selected = 1)
    ),
    mainPanel(
      plotOutput('myPlot'),
      p("The Galton's parent and child data are used as an illustration
        of the linear approximation and Shiny."),
      p("Try changing slope and intercept parameters and see how the 
        Mean Squared Error of the approximation is changed.
        The linear approximation of child's height versus parent's height
        is shown in green."),
      p("Should you get bored by the MSE, you could switch it off
        in the sidebar.")
    )
  )
))