proteins <- read.csv('CDC23_proteingroups_silac.txt', header = T, stringsAsFactors=F, sep='\t')
filteredproteins <- proteins[proteins$Contaminant != "+", ]
filteredproteins <- filteredproteins[filteredproteins$Reverse != "+", ]

filteredproteins <- filteredproteins[which(filteredproteins$Peptides..seq.>2), ]
filteredproteins <- filteredproteins[which(filteredproteins$Unique.Peptides..seq.>=2), ]

filteredproteins
