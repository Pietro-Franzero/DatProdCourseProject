
library(shiny)

shinyUI(
  pageWithSidebar(
    headerPanel("Probability of (o)esophageal cancer"),
    sidebarPanel(
      h3('Your Information'),
      h4('Please, enter the following information about you:'),
      selectInput("agegp", "Choose your age group:",
                         c("25-34" = "25-34",
                           "35-44" = "35-44",
                           "45-54" = "45-54",
                           "55-64" = "55-64",
                           "65-74" = "65-74",
                           "75+" = "75+")),
      selectInput("alcgp", "What is your average daily consumption of alcohol in g/day?",
                         c("0-39" = "0-39/day",
                           "40-79" = "40-79",
                           "80-119" = "80-119",
                           "120+" = "120+")),
      selectInput("tobgp", "What is your average daily consumption of tobacco in g/day?",
                         c("0-9" = "0-9/day",
                           "10-19" = "10-19",
                           "20-29" = "20-29",
                           "30+" = "30+")),
      submitButton('Submit')
    ),
    mainPanel(
      h3('Your Results'),
      h4('Your age group is:'),
      verbatimTextOutput("inputAge"),
      h4('Your average daily alcohol consumption is:'),
      verbatimTextOutput("inputAlc"),
      h4('Your average daily tobacco consumption is:'),
      verbatimTextOutput("inputTob"),
      h4('Which results in a predicted probability of esophageal cancer of (%):'),
      verbatimTextOutput("prediction")
    )
  )
)