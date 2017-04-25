# LECTURE 1 
my_data<-read.table("flowers.txt", header=T)
names(my_data)
head(my_data)
my_data
my_data$Sepal.Width
attach(my_data)
Sepal.Width
Petal.Width
hist(Sepal.Length)
plot(Sepal.Length, Sepal.Width)
mean(Sepal.Length)
mean(Sepal.Width)
Sepal.Length
help("mean")
mean(Sepal.Length, na.rm = T)
dat2<-rnorm(10)
dat2<-c(dat2, 10, 10.5, 30)
mean(dat2)
median(dat2)
hist(dat2)
summary(dat)
summary(dat2)
plot(ecdf(dat2))
boxplot(dat)
rug(dat, side=2)
boxplot(my_data)
boxplot(Sepal.Width~Species)
head(my_data)

hist(Sepal.Length[Species=="setosa"])
hist(Sepal.Length[Species=="versicolor"])
hist(Sepal.Length[Species=="virginica"])

setosa<-Sepal.Length[Species=="setosa"]
versicolor <- Sepal.Length[Species=="versicolor"]
t.test(setosa, versicolor)

# test with real data

era <-read.table("ERA_widths.txt", header=T)
erb<-read.table("ERB_widths.txt", header=T)
names(era)
t.test(era$ERA_width,erb$ERB_width)
hist(era$ERA_width)
hist(erb$ERB_width)
# they are not normally distributed
wilcox.test(era$ERA_width, erb$ERB_width)

# LECTURE 2

# anova test
oneway.test(Sepal.Width~Species)
oneway.test(Sepal.Length~Species)

# Larger exercise
gene_l <- read.table("gene_lengths.txt", header=T)
attach(gene_l)
# check for distribution
hist(gene_length[chr=="chr1"])
hist(gene_length[chr=="chr2"])
hist(gene_length[chr=="chr3"])
# check is there is correlation
kruskal.test(gene_length~chr)
# check for different significance
wilcox.test(gene_length[chr=="chr1"], gene_length[chr=="chr2"])
wilcox.test(gene_length[chr=="chr1"], gene_length[chr=="chr3"])
wilcox.test(gene_length[chr=="chr2"], gene_length[chr=="chr3"])
# pairwise wilcox test - do the same as above but smarter
pairwise.wilcox.test(gene_length, g=chr) # g stands for group - value that breaks up the length

# CORRELATIONS
height_data <- read.table("height.txt", header = T)
names(height_data)
attach(height_data)
plot(mean_weight, Year)
plot(mean_height, Year)
hist(Year[Gender=="M"], col = rgb(1,0,0,0.5))
hist(Year[Gender=="F"], col = rgb(0,0,1,0.5))
# split the data set for gender
plot (mean_weight, Year)
lines(mean_weight[Gender=="F"], Year[Gender=="F"], col="red")
lines(mean_weight[Gender=="M"], Year[Gender=="M"], col="blue")
# split the correlation between genders - they are very correlated
cor(mean_weight[Gender=="F"], Year[Gender=="F"])
cor(mean_weight[Gender=="M"], Year[Gender=="M"])
cor.test(mean_weight, Year)
cor.test(mean_weight[Gender=="F"], Year[Gender=="F"])
cor.test(mean_weight[Gender=="M"], Year[Gender=="M"])

# LINEAR REGRESSION
lm(Year[Gender=="F"]~mean_weight[Gender=="F"])
# first, plot the actual data: 
plot(mean_weight[Gender=="F"], Year[Gender=="F"] , col="red")
#      x                                  y
# then make the fit - note the switch of year and mean_weight! 
my_model<-lm(Year[Gender=="F"]~mean_weight[Gender=="F"])
#               y                           x
abline(my_model, col="blue")

plot (mean_weight, Year)
lines(mean_weight[Gender=="F"], Year[Gender=="F"], col="red")
my_model_f<-lm(Year[Gender=="F"]~mean_weight[Gender=="F"])
abline(my_model_f, col="orange", lwd = 2)

lines(mean_weight[Gender=="M"], Year[Gender=="M"], col="blue")
my_model_m<-lm(Year[Gender=="M"]~mean_weight[Gender=="M"])
abline(my_model_m, col="lightblue", lwd = 2)

# COUNT STATISTICS
m<-matrix(c(2,10, 5, 8,7,4), nrow=2, byrow = T)
# cbind: coloumn bind
m2<-cbind(m, c(9,7)) # m2 is m with the extra column
m3<-rbind(m2, c(2,1,4,5))
rbind(m3, 1)
rbind(m3, 1:4)

# Fischer test
my_matrix<-matrix(c(40, 60, 6, 4), nrow=2, byrow=T)
fisher.test(my_matrix)

my_matrix2<-matrix(c(40, 60, 60, 40), nrow=2, byrow=T)
fisher.test(my_matrix2)

my_matrix3<-matrix(c(5100, 4900, 4900, 5900), nrow=2, byrow=T)
fisher.test(my_matrix3)

# using ggplot2
qplot(y=Sepal.Length, x=Species, data=my_data, col=Species, geom=c("boxplot", "jitter"))
