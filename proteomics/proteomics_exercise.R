proteins <- read.csv('CDC23_proteingroups_silac.txt', header = T, stringsAsFactors=F, sep='\t')
filteredproteins <- proteins[proteins$Contaminant != "+", ]
filteredproteins <- filteredproteins[filteredproteins$Reverse != "+", ]

filteredproteins <- filteredproteins[which(filteredproteins$Peptides..seq.>2), ]
filteredproteins <- filteredproteins[which(filteredproteins$Unique.Peptides..seq.>=2), ]

hist(log(filteredproteins$Ratio.H.L.Normalized.CDCH), breaks=50)
hist(log(filteredproteins$Ratio.H.L.Normalized.CDCL))

plot(log(filteredproteins$Ratio.H.L.Normalized.CDCH), log(filteredproteins$Ratio.H.L.Normalized.CDCL))

filteredproteins$Gene.Names[filteredproteins$Ratio.H.L.Significance.A..CDCH < 0.0001 & !is.na(filteredproteins$Ratio.H.L.Significance.A..CDCH)]
c <- filteredproteins$Gene.Names[filteredproteins$Ratio.H.L.Significance.A..CDCL < 0.0001 & !is.na(filteredproteins$Ratio.H.L.Significance.A..CDCL)]
c
