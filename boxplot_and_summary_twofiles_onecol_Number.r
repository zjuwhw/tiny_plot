#Rscript boxplot_and_summary_twofiles_onecol_Number.r file1.txt file2.txt
Args<-commandArgs(TRUE)
file1=Args[1]
file2=Args[2]

data1 = read.table(file1, header=F, colClasses = c("numeric"))
data2 = read.table(file2, header=F, colClasses = c("numeric"))

data1.tmp = cbind(data1[,1], rep(paste(basename(file1),"(",nrow(data1),")", sep="")), nrow(data1))
data2.tmp = cbind(data2[,1], rep(paste(basename(file2),"(",nrow(data2),")", sep="")), nrow(data2))
data = rbind(data1.tmp, data2.tmp)


pdf(paste("boxplot_", basename(file1),"_vs_",basename(file2),".pdf", sep="") ,width=8, height=8)
layout(matrix(1:2,2,1),heights = c(2,1))
par(las='2')
boxplot(as.numeric(data[,1]) ~ data[,2])
pvalue = t.test(data1[,1], data2[,1])$p.value
text(1.5, max(as.numeric(data[,1])) * 0.8, labels = paste("p = ",round(pvalue,6), sep=""))

summary.table = cbind(summary(data1[,1]), summary(data2[,1]))
colnames(summary.table) = c(basename(file1), basename(file2))
library(plotrix)
frame()   
addtable2plot(0,0, summary.table, bty = "o", display.rownames = TRUE, hlines = TRUE, vlines = TRUE,)
dev.off()
