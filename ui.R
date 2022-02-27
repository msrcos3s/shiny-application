library(shiny)
library(plotly)


shinyUI(fluidPage(
        
        titlePanel("Taxas de Ocupacao Leitos UTI-Covid no Estado de SP"),
        h5 ("Criado em R"),
        h6 ("por Marcos S. Medeiros"),
        theme = shinythemes::shinytheme('superhero'),
        sidebarLayout(
                sidebarPanel(
                        helpText("Qual regiao deseja visualizar?"),
                        uiOutput("Region"),
                        hr(),
                        helpText("O grafico mostra a taxa de ocupacao de leitos.",
                                 hr(),
                                 img(src = "taxa.jpg", height = 30, width = 240),
                                 hr(),
                                 "Selecione uma area do grafico para ampliar em detalhes.",
                                 hr(),
                                 img(src = "msrcos3s.png", height = 120, width = 240))
                ),
                
                
                mainPanel(
                        h3("Estado de Sao Paulo por Regiao"),
                        h4("Grafico interativo em tempo real"),
                        h5 ("dados brutos disponiveis em https://github.com/seade-R/dados-covid-sp/raw/master/data/plano_sp_leitos_internacoes.csv"),
                        h3(textOutput("text1")),
                        plotlyOutput("distPlot")
                )
        )
)
)
