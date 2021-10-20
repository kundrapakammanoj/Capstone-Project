library(shiny)

ui <- fluidPage(
    

    
    sidebarLayout(
        
        sidebarPanel(
            h4("Use below instrcutions for predictions", style="color:black"),
            p("1.Enter some correct words in the entry"),
            p("2.The algorithm will predict the next word based on your entry")
        ),
        
        mainPanel(
            h3("Word Prediction APP" ,style ="color:blue"),
            textInput("Tcir",label=h3("Enter your text here:")),
            submitButton('Submit'),
            h4('You entered : '),
            verbatimTextOutput("inputValue"),
            h4('Predicted word :'),
            verbatimTextOutput("prediction")
            
        )
    ))