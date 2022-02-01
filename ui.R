
library(shiny)
library(miniUI)
library(lubridate)


# Use a fluid Bootstrap layout
fluidPage(    
        
        # Give the page a title
        titlePanel("ICU occupancy beds by region in State of Sao Paulo"),
        
        #Loading Dataset
        
        data_raw <- read.csv(url("https://github.com/seade-R/dados-covid-sp/raw/master/data/plano_sp_leitos_internacoes.csv"), sep=";", dec = ","),
        
        sub_data <- subset(data_raw,internacoes_ultimo_dia>0,select=c("datahora","nome_drs","ocupacao_leitos_ultimo_dia")),
        
        sub_data_SP <- sub_data[which(sub_data$datahora > today()-11), ],
        
        SP_10 <- sub_data_SP[1:10,],
        
        sub_data_SP$ocupacao_leitos_ultimo_dia_num <- as.numeric(sub_data_SP$ocupacao_leitos_ultimo_dia),
        
        SP_frame <- data.frame(name=c(sub_data_SP$datahora), nome_drs=c(sub_data_SP$nome_drs),
                               value=c(sub_data_SP$ocupacao_leitos_ultimo_dia_num)),
        SP_frame,
        
        
        # Generate a row with a sidebar
        sidebarLayout(      
                
                # Define the sidebar with one input
                sidebarPanel(
                        selectInput("nome_drs", "DRS", 
                                    choices= ls(SP_frame$nome_drs)),
                                    verbatimTextOutput("summary"),
                                    tableOutput("table"),
                        hr(),
                        helpText("Data from SEADE Foundation")
                ),
                
                # Create a spot for the barplot
                mainPanel(
                        plotOutput("icuplot")  
                )
                
        )
)