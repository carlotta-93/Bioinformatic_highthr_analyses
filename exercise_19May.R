seq(from=20, to=200, length.out = 20)
seq(0,100,by=4)

val<-rnorm(60*100)
val[seq(0, length(val), by = 60)] # want to use one measurement  per minute, for 10 minutes

n <- c(2,3,5)
s <- c("aa","bb", "cc", "dd", "ee")
b <- c(TRUE,FALSE,TRUE,FALSE,FALSE)
x <- list(n,s,b,3) # now contains n,s,b
# How do we then access the parts?
x
x[2]
class(x[2])
x[[2]]
class(x[[2]])


a<-rnorm(100)
b<-rnorm(100, mean=10)
t.test(a, b)
t_test_object <-t.test(a, b)
class(t_test_object)
summary(t_test_object)
t_test_object$p.value

# Writing files

a<-1:10
b<-11:20
c<-21:30
my.data.frame<-as.data.frame( cbind(a,b,c))
write.table(my.data.frame, file='new_data.txt', quote = F, row.names = F )


# summarize tables

d<-read.table('cells1.txt', h=T)
head(d)
attach(d)
my_table<-table(activity_exp_1, activity_exp_2)
fisher.test(my_table) # null hyp: there is a relation between rows and column
# the p_value cannot tell that the null hyp is rejected



