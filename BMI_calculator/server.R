#
# This is the server logic of the Shiny web application "BMI_calculator". You can run the
# application by clicking 'Run App' above.
#

library(shiny)

# This code defines the server logic required to calculate the BMI score and the associated health status
server <- function(input, output) {
    r_bmi <- reactive({
        input$weight/(input$height^2)
    })
    r_bmi_status <- reactive({
        cut(r_bmi(), 
            breaks = c(0, 18.5, 24.9, 29.9, 70),
            labels = c('underweight', 'healthy', 'overweight', 'obese')
        )
    })
    output$bmi <- renderText({
        bmi <- r_bmi()
        paste("Your BMI score is", round(bmi, 1))
    })
    output$bmi_status <- renderText({
        bmi_status <- r_bmi_status()
        paste("You are", bmi_status)
    })
}