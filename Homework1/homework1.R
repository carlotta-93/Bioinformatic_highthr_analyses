gene_lengths<-read.table("gene_lengths_v2.txt", header=T)
names(gene_lengths)
head(gene_lengths)
summary()
gene_lengths$intron_length<-gene_lengths$genome_length-gene_lengths$mrna_length

library(gridExtra)
p1<-qplot(gene_lengths$mrna_length, geom="histogram", breaks=seq(20, 50, by =2), color=I("red"))
p2<-qplot(gene_lengths$intron_length, geom="histogram", binwidth=100, col = I("blue"))
grid.arrange(p1, p2, ncol=2)

longest_mrna_l<-max(gene_lengths$mrna_length)
mrna_l <- gene_lengths$mrna_length

count_genes <- function(vector_l, x1, x2){
  count <- sum(vector_l > x1 & vector_l <= x2)
  total_mrna_count <- length(vector_l)
  return(count/total_mrna_count)
}
count_genes(mrna_l, x1=0, x2=longest_mrna_l)
count_genes(mrna_l, x1=10000, x2=longest_mrna_l)
count_genes(mrna_l, x1=1000, x2=10000)
count_genes(mrna_l, x1=100, x2=1000)
count_genes(mrna_l, x1=0, x2=100)
