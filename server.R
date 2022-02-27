library(shiny)
library(plotly)
library(lubridate)


shinyServer(
        
        function(input, output) {
                
                data <- read.csv(url("https://github.com/seade-R/dados-covid-sp/raw/master/data/plano_sp_leitos_internacoes.csv"), sep=";", dec = ",")
                data$datahora <- as.Date(data$datahora, "%Y-%m-%d")
                
                output$Region <- renderUI({
                        selectInput("Region", "Escolha uma regiao:", as.list(unique(data$nome_drs)), 
                                    selected = levels(data$nome_drs)[23] ) 
                })
                
                output$text1 <- renderText({
                        paste("Voce selecionou: ", input$Region)
                })
                
                
                output$distPlot <- renderPlotly({
                        dt <- data[data$nome_drs == input$Region, ]
                        
                        p <- ggplot(data = dt, aes(x = datahora, y = ocupacao_leitos_ultimo_dia)) + theme_bw() + geom_line() + geom_hline(yintercept = 75, linetype="dashed", color="red")+
                                geom_hline(yintercept = 50, linetype="dashed", color="yellow") + geom_area(fill = "lightblue", alpha=0.2)
                        
                        p <- ggplotly(p)
                })
                
        })
