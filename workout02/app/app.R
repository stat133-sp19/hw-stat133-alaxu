

library(shiny)
library(reshape)
library(ggplot2)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Future Value of Different Investment Modes"),
   
   fluidRow(
     column(4,
            sliderInput("initial",
                        "Initial Amount",
                        min = 1,
                        max = 100000,
                        value = 1000)
     ),
     column(4,
            sliderInput("return",
                        "Return Rate (in %)",
                        min = 1,
                        max = 20,
                        value = 5)
     ),
     column(4,
            sliderInput("years",
                        "Years",
                        min = 0,
                        max = 50,
                        value = 10)
     )
   ),
   fluidRow(
     column(4,
            sliderInput("annual",
                        "Annual Contribution",
                        min = 0,
                        max = 50000,
                        value = 2000)
     ),
     column(4,
            sliderInput("growth",
                        "Growth Rate (in %)",
                        min = 0,
                        max = 20,
                        value = 2)
     ),
     column(4,
            selectInput("facet",
                        "Facet?",
                        c("No",
                          c("Yes")))
     )
   ),
   mainPanel(
     h3("Timelines"),
     plotOutput("plot"),
     h3("Balances"),
     verbatimTextOutput("tbl")
   )
   
   # Sidebar with a slider input for number of bins 
  
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  future_value <- function(amount, rate, years) {
    fv <-  amount * ((1 + rate) ^ years)
    return(fv)
  }
  annuity <- function(contrib, rate, years) {
    fva <- contrib * ((1+rate)^years - 1)/rate
    return(fva)
  }
  growing_annuity <- function(contrib, rate, growth, years) {
    fvga <- contrib * (((1+rate) ^ years - (1 + growth) ^ years)) / (rate - growth)
    return(fvga)
  }
  
  output$tbl <- renderPrint({
    amount <- input$initial
    contrib <- input$annual
    rate <- input$return/100
    growth <- input$growth/100
    year <- c()
    years <- input$years
    no_contrib <- c()
    fixed_contrib <- c()
    growing_contrib <- c()
    for(i in 0:years) {
      year[i+1] <- i
      no_contrib[i+1] <- future_value(amount, rate, i)
      fixed_contrib[i+1] <- no_contrib[i+1] + annuity(contrib, rate, i)
      growing_contrib[i+1] <- no_contrib[i+1] + growing_annuity(contrib, rate, growth, i)
    }
    modalities <- data.frame(year, no_contrib, fixed_contrib, growing_contrib)
    print(modalities)
  })
   
   output$plot <- renderPlot({
     amount <- input$initial
     contrib <- input$annual
     rate <- input$return/100
     growth <- input$growth/100
     year <- c()
     years <- input$years
     no_contrib <- c()
     fixed_contrib <- c()
     growing_contrib <- c()
     for(i in 0:years) {
       year[i+1] <- i
       no_contrib[i+1] <- future_value(amount, rate, i)
       fixed_contrib[i+1] <- no_contrib[i+1] + annuity(contrib, rate, i)
       growing_contrib[i+1] <- no_contrib[i+1] + growing_annuity(contrib, rate, growth, i)
     }
     modalities <- data.frame(year, no_contrib, fixed_contrib, growing_contrib)
     nonfacet <- ggplot(data = modalities) +
       geom_line((aes(x = year, y = no_contrib, color = "no_contrib"))) +
       geom_line((aes(x = year, y = fixed_contrib, color = "fixed_contrib"))) +
       geom_line((aes(x = year, y = growing_contrib, color = "growing_contrib"))) +
       xlab("Year") + ylab("Future Value ($)") + ggtitle("Future Value of Different Investment Modes")

     faceted_list <- melt(modalities,id=c("year"))
     facet <- ggplot(data = faceted_list,aes(x = year, y = value, color = variable,fill = variable,group=variable) ) +
       geom_area(alpha = 0.5) +
       facet_wrap(~ variable) + xlab("year") + ylab("balance") + ggtitle("Future Value of Different Investment Modes (Separated)")
     
     if (input$facet=="No") {
       nonfacet
     } else {
       facet
     }
      
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

