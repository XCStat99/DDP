
library(shiny)
library(plotly)

function(input, output, session) {
    
    
    output$CLTPlot <- renderPlotly({
        set.seed(145)
        dist <- switch(input$dist,
                       norm = rnorm,
                       unif = runif,
                       lnorm = rlnorm,
                       exp = rexp)
        
        
        # After the user has defined which population distribution to use, randomly sample
        # 10000 times from this distribution to create our population. 
        pop_sam <- dist(1e5)
        #Using the sample size inputted by the user the population distribution generated above
        # is sampled 10000 times
        sample_set <- c()
        for (i in 1:10000){
            sample_set[i] <- mean(sample(pop_sam,input$n,replace = TRUE))
        }
        plot_ly(x=~sample_set, type = "histogram") %>% 
            layout(title = "Means of Samples", annotations = list(text = paste("Mean = ", 
                                                                               round(mean(sample_set),2), sep="\n", "Std Error = ", round(sd(sample_set)/sqrt(input$n),5)),
                                                                  yref = 'paper', xref = 'paper', y = 0.5, x = 0.5, bgcolor = "white", showarrow=FALSE ),
                   bargap=0.02, xaxis = list(title = "Mean Value"))
        
    })
    
    
}
