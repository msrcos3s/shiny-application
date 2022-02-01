
library(shiny)
library(miniUI)
library(lubridate)

# Define a server for the Shiny app
function(input, output) {
        
       output$icuplot <- renderPlot({
              
               barplot(SP_frame$name, SP_frame$value, main = "SP")
                       
                       
                       
        })
}


# Run the application 
runGadget(ui, server)