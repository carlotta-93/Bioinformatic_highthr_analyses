library(reshape)

part3_data <- load('part3.Rdata')

head(logRpkmDF)
logRpkmDF

logRpkmDF_melt <- melt(logRpkmDF)
logRpkmDF_melt$tool_label <- rep(NA, nrow(logRpkmDF_melt)) 
logRpkmDF_melt$replicate <- rep(NA, nrow(logRpkmDF_melt)) 

logRpkmDF_melt[grepl("K_", logRpkmDF_melt$variable),][,'tool_label'] <- 'K'
logRpkmDF_melt[grepl("S_", logRpkmDF_melt$variable),][,'tool_label'] <- 'S'
logRpkmDF_melt[grepl("_WT1_", logRpkmDF_melt$variable),][,'replicate'] <- 'WT1'
logRpkmDF_melt[grepl("_WT2_", logRpkmDF_melt$variable),][,'replicate'] <- 'WT2'
logRpkmDF_melt[grepl("_WT3_", logRpkmDF_melt$variable),][,'replicate'] <- 'WT3'

logRpkm_plot <- ggplot(data=logRpkmDF_melt, 
                aes(value, fill=tool_label)) + 
                geom_histogram(stat="bin", binwidth = 0.2, position=position_dodge()) +
                xlab("log10-transformed filtered RPKM") +
                ylab("Frequency") +
                ggtitle("Distribution of CHIP peaks in merged regions") +
                theme(plot.title = element_text(hjust = 0.5)) +
                scale_fill_manual(values = c('Kallisto' = "darkblue", 'Salmon' = "red"))+
                facet_wrap(~replicate)
logRpkm_plot

