library(shiny)
library(plotly)


fluidPage(
    
    # Application title
    titlePanel("Central Limit Theorem"),
    
    # Sidebar with a slider input for sample size adjustment
    sidebarLayout(
        sidebarPanel(
            # Input: Select the random distribution type ----
            radioButtons("dist", "Distribution type:",
                         c("Normal" = "norm",
                           "Uniform" = "unif",
                           "Log-normal" = "lnorm",
                           "Exponential" = "exp")),
            
            sliderInput("n",
                        "Sample Size",
                        min = 10,
                        max = 501,
                        value = 250)
        ),
        # Main panel for displaying outputs ----
        mainPanel(
            plotlyOutput("CLTPlot"))
        
    )
)


