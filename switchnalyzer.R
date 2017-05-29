exampleSwitchList <- isoformSwitchAnalysisPart1(
  input=exampleSwitchList, 
  genomeObject = Hsapiens, 
  dIFcutoff = 0.5,         # Set high for short runtime in example data
  outputSequences = FALSE, # keeps the function from outputting the fasta files from this example
  calibratePvalues = FALSE
) 


switchPlot(exampleSwitchList, gene='LDLRAD2')


pdf(file = '<my_plot>.pdf', onefile = FALSE, height=5, width = 8)
switchPlot(exampleSwitchList, gene='LDLRAD2', condition1='Ctrl', condition2='KD1')
dev.off()
