library(tidyr)
library(ggplot2)
folderld <-"./LD_estimation/"

#Clades US and COLPR 

#LD estimation in tassel using clone-corrected data 75 MLGs and all scaffolds
LD.us <- read.table(paste0(folderld,"LD_0222_US_cc75_76k_mp39_bial_50.txt"),
                    header=T, na.strings = "N/A")
LD.colpr <- read.table(paste0(folderld,"LD_0222_COLPR_cc75_76k_mp39_bial_50.txt"),
                       header=T, na.strings = "N/A")

#Same number of observations using clone-corrected or full dataset 

colnames(LD.us)
colnames(LD.colpr)


#Subset to only columns "Dist_bp" and "R.2"  
LD.us.distr <- LD.us[,13:14]
LD.colpr.distr <- LD.colpr[,13:14]

#Remove NAs
LD.us.distr = drop_na(LD.us.distr)
dim(LD.us.distr)

LD.colpr.distr = drop_na(LD.colpr.distr)
dim(LD.colpr.distr)



#Calculate mean LD by bins. LD was already calculated in 50 bp windows, so here will be bins of the windows R2
#Modified from eacooper github
#https://github.com/eacooper400/LDanalysis/blob/master/calcLDbins.R
#US
distance<-LD.us.distr$Dist_bp

LDdata<-LD.us.distr

### Find the bins
bins=seq(from=1, to=max(LDdata$Dist_bp), by=10)

### A function to get the subset of data
### and return mean(LD) for a given bin
binLD <- function(start, end, LDdata) {
  x = LDdata[which(LDdata$Dist_bp>=start & LDdata$Dist_bp<end),]
  y = mean(x[,2])
  return(y)
}

### Run the function on all bins
bin.results = data.frame(Start=bins, End=(bins+10), MeanRsq=rep(0, length(bins)))
for (i in 1:nrow(bin.results)) {
  bin.results$MeanRsq[i] = binLD(bin.results$Start[i], bin.results$End[i], LDdata)
}

#write.table(bin.results, "LD_estimation/LDdecay_outR/LDdecay_US_10bp_bins.txt", col.names=TRUE, row.names=FALSE, quote=FALSE, sep="\t")


#COLPR
distance<-LD.colpr.distr$Dist_bp
LDdata<-LD.colpr.distr

### Find the bins
bins=seq(from=1, to=max(LDdata$Dist_bp), by=10)

### A function to get the subset of data
### and return mean(LD) for a given bin
binLD <- function(start, end, LDdata) {
  x = LDdata[which(LDdata$Dist_bp>=start & LDdata$Dist_bp<end),]
  y = mean(x[,2])
  return(y)
}

### Run the function on all bins
bin.results = data.frame(Start=bins, End=(bins+10), MeanRsq=rep(0, length(bins)))
for (i in 1:nrow(bin.results)) {
  bin.results$MeanRsq[i] = binLD(bin.results$Start[i], bin.results$End[i], LDdata)
}

#write.table(bin.results, "LD_estimation/LDdecay_outR/LDdecay_COLPR_10bp_bins.txt", col.names=TRUE, row.names=FALSE, quote=FALSE, sep="\t")

#Plot the Decay with Distance

#Here is a simple R script for reading in multiple bin files (from multiple chromosomes), and plotting the decay with distance for each in a different color:
list.files()
bin.files = list.files("./LD_estimation/", pattern="*.10bp_bins.txt", include.dirs = T, full.names = T) #files using 10 bp bins
num.files = length(bin.files)
#install.packages("RColorBrewer")
#library(RColorBrewer)
US.col <- "#1F78B4CC"
COLPR.col <- "#F06C45CC"
plot.col = c(COLPR.col, US.col)

##US
USbindat <- read.table("./LD_estimation/LDdecay_US_10bp_bins.txt", header = T, na.strings = "NA")
USbindat <- na.omit(USbindat)

### Find the LD half life
LD.half.US = (USbindat$MeanRsq[1])/2  #using as max the first bind 1-101 bp 


##COLPR
COLPRbindat <- read.table("./LD_estimation/LDdecay_COLPR_10bp_bins.txt", header = T, na.strings = "NA")
COLPRbindat <- na.omit(COLPRbindat)

### Find the LD half life
LD.half.COLPR = (COLPRbindat$MeanRsq[1])/2  #using as max the first bind 1-101 bp 


#Save figure
tiff("LD_estimation/LD_figures/0222_LD_decay_10bpwbins5K_hline_4.tiff", width = 5, height = 4, units = 'in', res = 600)
for (i in seq_along(bin.files)) {
  dat <- read.table(bin.files[i], header=TRUE)
  if (i==1) {
    plot(dat$Start, dat$MeanRsq, xlim=c(0,5000), main="Linkage disequilibrium decay", xlab="Distance (bp)", ylab=(bquote('LD(' ~ r^2*')')), col=plot.col[i], pch=20)
  } else {
    points(dat$Start, dat$MeanRsq, col=plot.col[i], pch=20)
    #lines(dat$Start, dat$MeanRsq, col=plot.col[i], lwd=2) #connects points with a line
  }
}
abline(h=LD.half.US, col="black", lty=2) # add a horizontal line at half US
abline(h=LD.half.COLPR, col="black", lty=2)
#abline(v=US.LD.half.point, col=US.col, lty=2) # add a vertical line at the half life point
#abline(v=COLPR.LD.half.point, col=COLPR.col, lty=2) # add a vertical line at the half life point
#line until r2 0.5
#segments(x0=US.LD.half.point, y0=0, x1=US.LD.half.point, y1=LD.half.US, col=US.col, lty=2)#set vertical line until y 0.5
#segments(x0=COLPR.LD.half.point, y0=0, x1=COLPR.LD.half.point, y1=LD.half.COLPR, col=COLPR.col, lty=2)#set vertical line until y
segments(x0=4000, y0=0, x1=4000, y1=LD.half.US, col=US.col, lty=2)#set vertical line until y 0.5
segments(x0=800, y0=0, x1=800, y1=LD.half.COLPR, col=COLPR.col, lty=2)#set vertical line until y 0.5
dev.off()
#around half distribution US 3884.3912 and COLPR 751.2953 (visually with locator)



