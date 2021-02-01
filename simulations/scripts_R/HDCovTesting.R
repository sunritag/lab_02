require(HDCovMatTest)

args=commandArgs(trailingOnly = TRUE)
p=as.integer(args[1])
n=as.integer(args[2])
time=as.integer(args[3])
delta=as.double(args[4])
num=as.character(args[5])

cat("p=",p,"\n")
cat("n=",n,"\n")
cat("time=",time,"\n")
cat("delta",delta,"\n")
cat("num=",num,"\n")

delta=format(delta, nsmall = 1)
fname=paste("testdata","p",p,"n",n,"T",time,"Delta",delta,"rep",num,".txt",sep="")
yvec=read.table(file=fname)
yarray=array(matrix(yvec),c(p,n,time))
cat("dim y", dim(yarray),"\n")

results=CovMatTest(yarray,n,p,time,alpha=0.05)

rname=paste("testresult","p",p,"n",n,"T",time,"Delta",delta,"rep",num,".txt",sep="")
write.table(t(as.matrix(unlist(results))), file=rname, eol="\r\n", col.names=F, row.names=F)












