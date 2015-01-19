# Program to calculate the Metabolic Syndrome Risk
# 

library(shiny)

MetabolicSyndromeRisk <- function(Weight, Height, Bld_p_sys, Cho_ldl) {
  # Obesity risk calculated in three categories (low, medium, high) 
  # based on body mass index value 
  bmi <- Weight / (Height/100)^2
  if(bmi < 23) obr <- 0.1         # low
    else {
      if (bmi < 26.99) obr <- 0.5 # medium
        else obr <- 0.9           # high
    }
  
  # Hypertension risk calculated in three categories (low, medium, high)
  # based on the systolic blood pressure
  if(Bld_p_sys < 139) htr <- 0.1    # low
  else {
    if (Bld_p_sys < 159) htr <- 0.5 # medium
    else htr <- 0.9                 # high
  }
 
  # Bad Cholesterol Risk in three categories (low, medium, high)
  # based on LDL level 
  if(Cho_ldl < 100) bcr <- 0.1    # low
  else {
    if (Cho_ldl < 130) bcr <- 0.5 # medium
    else bcr <- 0.9               # high
  }
  
  # The overall average risk (%)
  msr <- ((obr + htr + bcr)/3.0)*100
  as.integer(msr)
}

# Server logic to render the web page

shinyServer(
  function(input, output) {
    output$inputValue1 <- renderPrint({input$Weight})
    output$inputValue2 <- renderPrint({input$Height})
    output$inputValue3 <- renderPrint({input$Bld_p_sys})
    output$inputValue4 <- renderPrint({input$Cho_ldl})
    output$prediction <- renderPrint({MetabolicSyndromeRisk(input$Weight, input$Height,
                                                            input$Bld_p_sys, input$Cho_ldl)})
  }
)
