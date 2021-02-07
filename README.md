# BMI calculator and weight categories

This README file provides supporting information for the shiny app “BMI calculator”.

## 1. Background
This project is part of an assignment for the course Developping data product on Coursera. 
The assignment has two parts. First, create a Shiny application and deploy it on Rstudio's servers. Second, use Slidify or Rstudio Presenter to prepare a reproducible pitch presentation about the application.

### Shiny Application
1.	Write a shiny application with associated supporting documentation. The documentation should be thought of as whatever a user will need to get started using your application.
2.	Deploy the application on Rstudio's shiny server
3.	Share the application link by pasting it into the provided text box
4.	Share your server.R and ui.R code on github
The application must include the following:
1.	Some form of input (widget: textbox, radio button, checkbox, ...)
2.	Some operation on the ui input in sever.R
3.	Some reactive output displayed as a result of server calculations
4.	You must also include enough documentation so that a novice user could use your application.
5.	The documentation should be at the Shiny website itself. Do not post to an external link.

### Reproducible Pitch Presentation
You get 5 slides (inclusive of the title slide) to pitch your app. You're going to create a web page using Slidify or Rstudio Presenter with an html5 slide deck.
Here's what you need
1.	5 slides to pitch our idea done in Slidify or Rstudio Presenter
2.	Your presentation pushed to github or Rpubs
3.	A link to your github or Rpubs presentation pasted into the provided text box

Your presentation must satisfy the following
1.	It must be done in Slidify or Rstudio Presenter
2.	It must be 5 pages
3.	It must be hosted on github or Rpubs
4.	It must contained some embedded R code that gets run when slidifying the document

## 2. A description of this Shiny app
This Shiny app is a simple calculator that provides the Body Mass Index (BMI) and the corresponding weight category for adults 20 years and older. 
On the left panel, the user is invited to use the sliders to enter his height (in meters) and weight (in kilograms). Note that the application uses the International system of units (meters and kilograms); 1 inch = 0.0254 meter; 1 pound = 0.454 kilograms.

The server will use the 2 input values to calculate:
-	The BMI score (“bmi”)
-	The weight category (“bmi_status”)
The BMI function takes two arguments, height and weight, and returns a numerical value based on a simple formula:
BMI = function(height,weight){
        return(weight/(height)^2)
}

The weight category (“bmi_status”) will use the calculated BMI score (“bmi”) to indicate the health status according to the following categories:
BMI Categories:
- Underweight = <18.5
- Normal weight = 18.5–24.9
- Overweight = 25–29.9
- Obesity = BMI of 30 or greater

The ui code (ui.R) defines the user interface which is how the application will look. We will have to enter 2 values: the height in meter and the weight in kilogram. Those 2 inputs values will be used to calculate the BMI score ("bmi") and the associated health status ("bmi_status") that will be displayed on the main panel

The server code (server.R) defines the server logic required to calculate the BMI score ("bmi") and the associated weight category ("bmi_status")

## 3. Directions on how to use this app in RStudio or on Shiny servers
Option 1: Direct link:  https://lineb4jhu.shinyapps.io/BMI_calculator/
Option 2: Download the server.R and ui.R files and place them in a directory named 'BMI_calculator'. Open an R session and set the working directory to the folder that contains the directory 'BMI_calculator'. Then run the following commands:
library(shiny)
runApp('my_first_shiny')
