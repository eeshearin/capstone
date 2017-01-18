# server.R
library(tm)
load('ngram3.RData')

suggest <- function(input) {
      if(nchar(input) > 0)
      {
            ## Process input to the text box
            
            # clean input of special characters
            input <- gsub("[^A-Za-z ]","",input)
            input <- tolower(input)   
            
            # break up input in reverse order (prediction needs last words)
            input <- strsplit(input, " ")
            input <- unlist(input)
            input <- rev(input)
            
            # put back together last 2 words for trigram prediction
            input2 <- paste(input[2],input[1],sep = ' ')
            
            # choose last 1 word for bigram prediction
            input1   <- input[1]  
            
            ## Produce prediction
            fetch2      <-grepl(paste0("^",input1,"$"),gram2$input)
            fetch3      <-grepl(paste0("^",input2,"$"),gram3$input)
            
            if(sum(fetch3) > 0 )
            {
                  # Both trigram & bigram
                  suggest2    <-gram2[fetch2,]
                  suggest3    <-gram3[fetch3,] 
                  if((suggest2$s*0.4) > suggest3$s)
                  {
                        return(suggest2$output)
                  }
                  else
                  {
                        return(suggest3$output)
                  }    
            }
            else
            {
                  if(sum(fetch2) > 0)
                  {
                        # Since no trigram, return bigram
                        suggest2    <-gram2[fetch2,]
                        return(suggest2$output)
                  } 
                  else
                  {
                        # Since no trigram & bigram, return unigram
                        return(gram1[1]$unigram)
                  }
            }
      }
}


shinyServer(function(input, output) {
      output$text1 <- renderText({suggest(input$textsource)})
})
