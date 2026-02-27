library(tidyverse)
library(janitor)
library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  
  dashboardHeader(title="Age and Height of Elephants Based on Sex"),
  
  dashboardSidebar(
    
    selectInput("y",
                "Select Variable",
                choices=c("age", "height"),
                selected="age")
  ),
  
  dashboardBody(
    plotOutput("plot", width="550px", height="400px")
  )
  
)

server <- function(input, output, session) {
  
  output$plot <- renderPlot({
    
    elephants %>% 
      ggplot(aes(x=sex, y=.data[[input$y]], fill=sex))+
      geom_boxplot(color="black", alpha=0.6)+
      theme_classic()+
      labs(x="Sex", fill="Sex")
  })
}

shinyApp(ui, server)
