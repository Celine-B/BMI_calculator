#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#

library(shiny)

# This code defines the user interface which is how the application will look. We will have to enter 2 values: the height in meter and the weight in kilogram. Those 2 inputs values will be used to calculate the BMI score and the associated health status. 
ui <- fluidPage(
        sidebarLayout(
            sidebarPanel(
                h4("Enter here your height and weight"),
                sliderInput('height', 'Your height (meters)', 1.3, 2.2, 1.6, 0.1),
                h6("note: 1 inch = 0.0254 meter"),
                h6(" "),
                sliderInput('weight', 'Your weight (Kilograms)', 45, 150, 60, 5),
                h6("note: 1 pound = 0.454 kilo")
            ),
            mainPanel(
                h2("BMI calculator"),
                textOutput("bmi"),
                textOutput("bmi_status")
            )
        )
    )
    

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

# Run the application 
shinyApp(ui = ui, server = server)