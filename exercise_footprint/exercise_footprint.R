data_input <- read.table("cpg_overlap_counts.bed", header = F)
head(data_input)
hist(data_input$V5, breaks=300, xlim=c(0, 30), ylim = c(0,14000), xlab = 'number of exons', ylab = 'frequency of CpG_islands')
