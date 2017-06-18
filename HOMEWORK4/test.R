part3_data <- load('part3.Rdata')

head(logRpkmDF)
# transposed<-data.frame(t(logRpkmDF))
# transposed[1:6,]
logRpkmDF

as.data.frame(cbind(logRpkmDF$K_WT1_RPKM, logRpkmDF$K_WT2_RPKM, logRpkmDF$K_WT3_RPKM, tool='K'))

newdat <- logRpkmDF[, c('K_WT1_RPKM', 'tool1', 'K_WT2_RPKM', 'tool1', 'K_WT3_RPKM', 'tool1', 'S_WT1_RPKM', 'tool2', 'S_WT2_RPKM','tool2', 'S_WT3_RPKM', 'tool2')]

logRpkmDF[,seq(1,6,3)][logRpkmDF$replica] <- 'WT1'

b<-cbind(logRpkmDF[,seq(2,6,3)],logRpkmDF$replica <- 'WT2')
c<-cbind(logRpkmDF[,seq(3,6,3)],logRpkmDF$replica <- 'WT3')
cbind(a,b,c)[1:6,1:ncol(logRpkmDF)]
logRpkmDF[1:6,1:ncol(logRpkmDF)]


newdat <- logRpkmDF[, c('K_WT1_RPKM', 'replica', 'K_WT2_RPKM', 'WT2_label', 'K_WT3_RPKM', 'WT3_label', 'k_label', 'S_WT1_RPKM', 'WT1_label', 'S_WT2_RPKM', 'WT2_label', 'S_WT3_RPKM', 'WT3_label', 's_label')]
newdat[1:6,1:13]

value <- melt(newdat, id=c('WT1_label', 'WT2_label', 'WT3_label', 'k_label', 's_label'))
value


transposed[1:3,][, "tool_label"] <- "K"
transposed[4:6,][, "tool_label"] <- "S"
transposed$replica <- rep(NA, nrow(transposed))
transposed[seq(1,6,3),][, 'replica'] <- 'WT1'
transposed[seq(2,6,3),][, 'replica'] <- 'WT2'
transposed[seq(3,6,3),][, 'replica'] <- 'WT3'


library('reshape')
value<-melt(transposed, id=c('tool_label', 'replica'))
value[1:3,1:3]

logRpkm_plot <- ggplot(data=transposed, 
                aes(value, fill=tool_label)) + 
                geom_histogram(stat="bin", binwidth = 0.2, position=position_dodge()) +
                xlab("log10-transformed filtered RPKM") +
                ylab("Frequency") +
                ggtitle("Distribution of CHIP peaks in merged regions") +
                theme(plot.title = element_text(hjust = 0.5)) +
                scale_fill_manual(values = c('K' = "darkblue", 'S' = "red"))+
                facet_wrap(~replica)
logRpkm_plot

