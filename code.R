if(!file.exists("./char_final.csv")) {
  fileUrl <- "https://raw.githubusercontent.com/benkahle/bayesianGameofThrones/master/char_final.csv"
  download.file(fileUrl, destfile = "./char_final.csv")
}
char<-read.csv("char_final.csv",sep=",",header=T)
char<-char[-c(1:3),]
rownames(char)<-row(matrix(char[,1]))
char$Gender<-as.factor(as.character(char$Gender))