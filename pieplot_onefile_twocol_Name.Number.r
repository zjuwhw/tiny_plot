Args<-commandArgs(TRUE)
inputfile=Args[1]

library(RColorBrewer)

data = read.table(inputfile, header=F, sep="\t", colClasses=c("character","numeric"))
pdf(paste(basename(inputfile),"_pie.pdf",sep=""), width = 6, height=6)
pie(data[,2], 
    labels=paste(data[,1],"(",sprintf("%.2f%%",  round(data[,2]/sum(data[,2]),4) * 100),")",sep=""),  
    col = brewer.pal(nrow(data),"Set1"), 
    main=paste("pie plot of ", basename(inputfile), sep=""))
dev.off()

