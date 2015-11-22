cancerProb <- function(age, alc, tob){
  
  library(datasets)
  data(esoph)
  
  library(dplyr)
  esoph <- mutate(esoph, prob = ncases/ncontrols)
  
  fit <- lm(prob ~ agegp+alcgp+tobgp, data = esoph)
  
  age <- factor(age, levels = levels(esoph$agegp))
  alc <- factor(alc, levels = levels(esoph$alcgp))
  tob <- factor(tob, levels = levels(esoph$tobgp))
  x <- data.frame(agegp = age, alcgp = alc, tobgp = tob)
  
  y <- predict(fit,x)
  
  round(y*100,1)
}

shinyServer(
  function(input,output){
    output$inputAge <- renderPrint({input$agegp})
    output$inputAlc <- renderPrint({input$alcgp})
    output$inputTob <- renderPrint({input$tobgp})
    output$prediction <- renderPrint({cancerProb(input$agegp,input$alcgp,input$tobgp)})
  }
)