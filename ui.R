# ui.R

shinyUI(fluidPage(
      h3("Coursera Data Science Swiftkey Capstone - Word Prediction"),
      tags$head(tags$style("#text1, #text2{color: blue;
                           font-size: 20px;
                           }"
  )),
  br(),
  br(),
  
  sidebarLayout(
        sidebarPanel(
              h5("Enter a phrase for a prediction:"),
              textInput("textsource", label = "")
              hr(),
              p("This prediction app uses an integrated Stupid Backoff Model to predict the next word. The model is based off of twitter, news and blogs databases from the Swiftkey team. The code for this algorithm can be found on GitHub."),
              br(),
              p("The app also draws from Google's Autosuggest for comparison purposes. This shows you what Google's algorithm would predict for the same phrase."),
              hr(),
              h6("Full source code can be found on GitHub")
        ),
        
        
        
        mainPanel(
              h5("Stupid Backoff Predictive Model Suggestion:"),
              hr(),
              h4(textOutput("text1")),
              hr(),
              h5("Google's AutoComplete Suggestion (for comparison purposes only):"),
              hr(),
              h4(textOutput("text2")),
              hr()
        )
  )
      ))
