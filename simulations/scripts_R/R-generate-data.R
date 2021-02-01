args=commandArgs(trailingOnly = TRUE)
p=as.integer(args[1])
n=as.integer(args[2])
T=as.integer(args[3])
delta=as.double(args[4])

cat("p=",p,"\n")
cat("n=",n,"\n")
cat("T=",T,"\n")
cat("delta=",delta,"\n")

m=p+20
L=3
Gamma1<-Gamma2<-matrix(0,p,m*L)

k0=round(T/2)
w=0.2
for (i in 1:p)
 for (j in 1:p)
{
  dij=abs(i-j)
  if (dij<(p*w))
  {
   Gamma1[i,j]=0.6^dij
   Gamma2[i,j]=(0.6+delta)^dij
  } 
}


####### Generating Data for C code #############################

library(MASS)
delta<-format(delta, nsmall = 1)
for (num in 1:500)
{
  Y<-array(0,c(p,T,n))
  counts<-1
  reps<-1
  Yvec<-matrix(0,reps,p*n*T)
  repeat
  {
   temp<-NULL
   Z<-matrix(rnorm(m*(T+L-1)*n),m*(T+L-1),n)
   for (t in 1:k0)
   {
   Y[,t,]<-Gamma1%*%Z[((t-1)*m+1):((t+L-1)*m),]
   temp<-c(temp,matrix(Y[,t,],1,p*n,byrow=FALSE))
   }
   for (t in (k0+1):T)
   {
   Y[,t,]<-Gamma2%*%Z[((t-1)*m+1):((t+L-1)*m),]
   temp<-c(temp,matrix(Y[,t,],1,p*n,byrow=FALSE))
   }
   Yvec[counts,]<-temp
   counts<-counts+1
   if (counts>reps) break;
  }
  Yvec1<-round(Yvec,digits=8)
  fname=paste("testdata","p",p,"n",n,"T",T,"Delta",delta,"rep",num,".txt",sep="")
  write.table(Yvec1,file=fname, eol="\r\n", col.names=F, row.names=F)
}




