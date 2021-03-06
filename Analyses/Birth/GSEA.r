#GSEA (gene set enrichment analysis)
#source("https://bioconductor.org/biocLite.R")
#biocLite("missMethyl")
#biocLite("IlluminaHumanMethylation450kanno.ilmn12.hg19")
#biocLite("GO.db")
#install.packages("BiasedUrn")

library(limma)
library(minfi)
library(missMethyl)
library(IlluminaHumanMethylation450kanno.ilmn12.hg19)

allcpgs <- list.of.results.het.removed$covs.pat$MarkerName

#patmat (all)
mylist<-list.of.results.het.removed$covs.patmat[which(list.of.results.het.removed$covs.patmat$Pvalue<1e-3),"MarkerName"]#649
go.res <- gometh(sig.cpg=mylist, all.cpg=allcpgs, collection="GO")
write.csv(go.res[which(go.res$P.DE<1e-3),],"GO.patmat.birth.csv")
kegg.res <- gometh(sig.cpg=mylist, all.cpg=allcpgs, collection="KEGG")
write.csv(kegg.res[which(kegg.res$P.DE<1e-3),],"KEGG.patmat.birth.csv")

#females
mylist<-list.of.results.het.removed$girls.patmat[which(list.of.results.het.removed$girls.patmat$Pvalue<1e-3),"MarkerName"]#649
go.res <- gometh(sig.cpg=mylist, all.cpg=allcpgs, collection="GO")
write.csv(go.res[which(go.res$P.DE<1e-3),],"GO.patmat.female.birth.csv")
kegg.res <- gometh(sig.cpg=mylist, all.cpg=allcpgs, collection="KEGG")
write.csv(kegg.res[which(kegg.res$P.DE<1e-3),],"KEGG.patmat.female.birth.csv")

#males
mylist<-list.of.results.het.removed$boys.patmat[which(list.of.results.het.removed$boys.patmat$Pvalue<1e-3),"MarkerName"]#649
go.res <- gometh(sig.cpg=mylist, all.cpg=allcpgs, collection="GO")
write.csv(go.res[which(go.res$P.DE<1e-3),],"GO.patmat.male.birth.csv")
kegg.res <- gometh(sig.cpg=mylist, all.cpg=allcpgs, collection="KEGG")
write.csv(kegg.res[which(kegg.res$P.DE<1e-3),],"KEGG.patmat.male.birth.csv")
