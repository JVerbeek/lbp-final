setwd("~/lbp-thesis")
install.packages("tikzDevice", repos="http://R-Forge.R-project.org")
require(tikzDevice)
getwd()
analyze <- function(filename){
  
  View(loop)
 
  dev.off()
  hist(loop$d0)
  print(cor(loop$t0, loop$d0))
}

analyze("multiloop_data_1.csv")
analyze("csv_files/loop_med1.csv")
analyze("csv_files/loop_hi1.csv")
analyze("csv_files/loop_low1.csv")


iterations = data.frame(mock_row = NA)
lowiter = read.table("csv_files/loop_low1.csv", sep=",", header=TRUE)$iter
iterations = cbind(iterations, lowiter)
mediter = read.table("csv_files/loop_med1.csv", sep=",", header=TRUE)$iter
iterations = cbind(iterations, mediter)
highiter = read.table("csv_files/loop_hi1.csv", sep=",", header=TRUE)["iter"]
iterations = cbind(iterations, highiter)
iterations
?boxplot
View(highiter)
keeps <- c("lowiter", "mediter", "iter")
df = iterations[keeps]
boxplot(df)
?IQR
IQR(df$lowiter, na.rm = FALSE, type = 7)
IQR(df$mediter, na.rm = FALSE, type = 7)
IQR(df$iter, na.rm = FALSE, type = 7)
median(lowiter)
median(mediter)
median(df$iter)
require( tikzDevice )
tikz( 'myPlot.tex' )
boxplot(df, main="Number of iterations until convergence \n across multiple loopcount categories", ylab= "Number of iterations", names = c("Low loop count \n <5 loops", "Medium loop count \n 5-9 loops", "High loop count \n >10 loops"))
dev.off()


iterations = data.frame(mock_row = NA)
lowiter = read.table("csv_files/single_low.csv", sep=",", header=TRUE)$iter
iterations = cbind(iterations, lowiter)
iterations
mediter = read.table("csv_files/single_med.csv", sep=",", header=TRUE)$iter
iterations = cbind(iterations, mediter)
highiter = read.table("csv_files/single_hi.csv", sep=",", header=TRUE)$iter
length(highiter) = length(iterations$lowiter)
iterations <- cbind(iterations, highiter)
iterations
keeps <- c("lowiter", "mediter", "highiter")
df = iterations[keeps]
boxplot(df)
?IQR
IQR(df$iter, na.rm = TRUE, type = 7)
median(df$highiter)
IQR(df$mediter, na.rm = TRUE, type = 7)
median(df$mediter)
IQR(df$lowiter, na.rm = TRUE, type = 7)
median(df$lowiter)
require( tikzDevice )
tikz( 'singleloop.tex' )
boxplot(df, main="Number of iterations until convergence \n across multiple loop categories", ylab= "Number of iterations", names = c("Low loop length \n <18", "Medium loop length \n 18-33", "High loop length \n $>$34"))
dev.off()

