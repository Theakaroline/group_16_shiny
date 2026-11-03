library("shiny")
library("bslib")
# Define the Server (Backend)
server <- function(input, output) {
  

  
  dna_sequence <- reactive({
    
    probabilities <- c(
      input$prob_A,
      input$prob_T,
      input$prob_C,
      input$prob_G
    )
  
  gene_dna(length = input$n_bases,
             base_probs = probabilities)
  })
  
  #Translate to rna
  rna_sequence <- reactive({
    transcribe_dna(dna_sequence())
  })
  
  #display dna
  output$dna <- renderText({
    dna_sequence()
  })
  
  #display rna
  output$rna <- renderText({
    rna_sequence()
  })
  
  output$Protein <- renderText({
    translate_rna(rna_sequence())
  })
}