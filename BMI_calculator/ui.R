#
# This is the user-interface definition of the Shiny web application "BMI_calculator". You can
# run the application by clicking 'Run App' above.
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