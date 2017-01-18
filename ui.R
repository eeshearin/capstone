# ui.R

shinyUI(fluidPage(
      h3("Coursera Data Science Swiftkey Capstone - Word Prediction"),
      tags$head(tags$style("#text1, #text2{color: red;
                           font-size: 20px;
                           }"
  )),
  br(),
  br(),
  
  sidebarLayout(
        sidebarPanel(
              h5("Please enter a phrase for a prediction:"),
              textInput("textsource", label = ""),
              hr(),
              p("This prediction app uses an integrated Stupid Backoff Model to predict the next word. The model is based on Twitter, news and blogs databases from the Swiftkey team. The code for this algorithm can be found on GitHub."),
              br(),
              h6("Full source code can be found at https://www.github.com/eeshearin/capstone")
        ),
        
        
        
        mainPanel(
              h3("Stupid Backoff Predictive Model Suggestion:"),
              hr(),
              h2(textOutput("text1")),
              hr(),
              h5("This word is predicted to be the next in the sentence. Please enter another phrase to produce the next prediction."),
              br(),
              br(),
              br(),
              br(),
              br(),
              br(),
              h5("Please note the phrase must be four words or fewer to produce a prediction, as the n-gram model uses unigrams, bigrams, and trigrams."),
              br(),
              h5("Thank you for using the app!")
        )
  )
      ))
