Args<-commandArgs(TRUE)
inputfile=Args[1]

data = read.table(inputfile, header=F, sep="\t", colClasses=c("character","numeric"))

pdf(paste(basename(inputfile),"_barplot.pdf",sep=""), width = 6, height=6)
barplot(beside=T,
        data[,2],
        names.arg=data[,1],
        main = paste("bar plot of ", basename(inputfile), sep=""))
dev.off()
