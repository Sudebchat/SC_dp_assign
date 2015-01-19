library(shiny)

shinyUI(
    fluidPage(
    # Application title
    titlePanel("Metabolic Syndrome Risk Prediction"),
    # Brief description
    em("This application estimates the Metabolic Syndrome Risk for a person using the data for",
       span("body weight (in kg), height (in cm), systolic blood pressure (in mm Hg),",
            "and LDL cholesterol level (in mg/dl).", style = "color:red")),
    br(),
    em("Internally the program first calculates the BMI (body mass index) from the weight",
       "and height data and then assesses the obesity risk in three categories: low, medium",
       "and high. The corresponding risk figures assigned are 10%, 50% and 90%",
       "respectively."),
    em("Next based on the systolic blood pressure the hypertension risk is categorized",
       "into three levels of low, medium and high, with corresponding risk figures assigned",
       "being 10%, 50% and 90%."),
    em("Lastly, based on LDL cholesterol level the blood circulation (artery clogging)",
       "risk is categorized into three levels of low, medium and high, with corresponding",
       "risk figures assigned being 10%, 50% and 90%."),
    em("The metabolic syndrome risk figure is then calculated by taking the average of ",
       "the three risk factors."),
    br(),br(),
    sidebarPanel(
      h5('Please provide your input data in the following textboxes and then press the "Submit" button.'),
      numericInput('Weight', 'Body Weight in Kg', 75, min = 50, max = 250, step = 1),
      numericInput('Height', 'Height in cm', 180, min = 150, max = 210, step = 1),
      numericInput('Bld_p_sys', 'Blood Pressure (SYS) in mm Hg', 120, min = 90, max = 160, step = 1),
      numericInput('Cho_ldl', 'Cholesterol (LDL) in mg/dL', 90, min = 65, max = 170, step = 1),
      submitButton('Submit')
    ),
    mainPanel(
      h3('Results of prediction'),
      h5('Given Weight (Kg)'), verbatimTextOutput("inputValue1"),
      h5('Given Height (cm)'), verbatimTextOutput("inputValue2"),
      h5('Given Blood Pressure (SYS) (mm Hg)'), verbatimTextOutput("inputValue3"),
      h5('Given Cholesterol (LDL) (mg/dL)'), verbatimTextOutput("inputValue4"),
      h4('Predicted Risk (%)'), verbatimTextOutput("prediction")
    )
  )
)
