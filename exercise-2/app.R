# Exercise 1: Shiny basics

# Install and load the `shiny` package
library(shiny)

# Define a new `ui` variable. This variable should be assigned a `fluidPage()` layout
# The `fluidPage()` layout should be passed the following:
ui <- fluidPage(
  
  
  # A `titlePanel()` layout with the text "Cost Calculator"
titlePanel("Cost Calculator"),
  
  # A `numericInput()` widget with the label "Price (in dollars)"
  # It should have a default value of 0 and a minimum value of 0
  # Hint: look up the function's arguments in the documentation!
numericInput("price", "Price (in dollars)", 0, min = 0),
  
  # A second `numericInput()` widget with the label "Quantity"
  # It should have a default value of 1 and a minimum value of 1  
numericInput("quantity", "Quantity", 1, min = 1),
  
  # The word "Cost", strongly bolded
strong("Cost"),
  
  # A `textOutput()` output of a calculated value labeled `cost`
textOutput("cost")
)


# Define a `server` function (with appropriate arguments)
# This function should perform the following:
server <- function(inputs, outputs) {
  
  # Assign a reactive `renderText()` function to the output's `cost` value
  # The reactive expression should return the input `price` times the `quantity`
  # So it looks nice, paste a "$" in front of it!
outputs$cost <- renderText({
  x <- inputs$price * inputs$quantity
})
}
# Create a new `shinyApp()` using the above ui and server
shinyApp(ui = ui, server = server)