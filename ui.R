library(shiny)
library(plotly)


shinyUI(fluidPage(
        
        titlePanel("ICU Occupancy Rate"),
        
        sidebarLayout(
                sidebarPanel(
                        uiOutput("Region")
                ),
                
                
                mainPanel(
                        h1("State of Sao Paulo by Region"),
                        h2("Real Time Interactive Plot"),
                        h6 ("linked to https://github.com/seade-R/dados-covid-sp/raw/master/data/plano_sp_leitos_internacoes.csv"),
                        h3(textOutput("text1")),
                        plotlyOutput("distPlot")
                )
        )
)
)
