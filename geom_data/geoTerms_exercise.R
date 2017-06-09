# Setting all the variables with some random numbers
N <- 10000 # The total number of genes
K <- 50 # The number of gene belonging to a gene family
n <- 942 # The list of interesting genes
k <- 3 # The number of gene family members in the interesting genes

# Using the hypergeometric distribution: 
phyper(q = k-1, # We want equal or bigger
  m = K,
  n = N-K,
  k = n,
  lower.tail=FALSE) # P[X > x]

Ks <- 1:50
upper_tail_probs <- phyper(q = k-1, m = K, n = N-K, k = n, lower.tail=FALSE) 


# Rearrange the data as a 2x2 table
m <- matrix(c(k, K - k, n - k, N - K - n + k),
            2, 2, dimnames = list(c("In List", "Rest"),
                                  c("In Family", "Rest")))
m


