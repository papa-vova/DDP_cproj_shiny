library(shiny)
source("helpers.R")
shinyServer(
  function(input, output) {
    
    dataInput <- reactive({
      intercept <<- input$intercept
      slope <<- input$slope
      MSE_show <<- input$MSE_show
      if(MSE_show == 1) {
        mu <<- slope*galton$parent + intercept
        mse <<- round(mean((galton$child - mu)^2), 2)
      }
    })
    
    output$myPlot <- renderPlot({
      dataInput()
      plot(galton, xlim=c(xmin, xmax), ylim = c(ymin, ymax), asp=1,
           main="Modelling Galton's Data",
           xlab="Parent", ylab="Child",
           type="p", cex=0.8, col="maroon", pch=3,
           cex.axis=1.2, cex.lab=1.5, cex.main=2)
      abline(g_lm, col=3)
      abline(a = intercept, b = slope, col="red")
      if(MSE_show == 1) { text(78, 62, paste("MSE = ", mse), cex=1.5) }
    })
  }
)