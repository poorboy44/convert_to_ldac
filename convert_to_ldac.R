library(lda)
library(topicmodels)
setwd('/Users/snelson/projects/convert_to_ldac')
data<-unlist(read.table('sample_tweets.txt', stringsAsFactors=FALSE))
corpus<-lexicalize(data, lower=TRUE)

## convert to LDA-C format
#test<-corpus$documents[1:2]
ldaformat<-function(dtm_row){
  concat_column<-function(x)
    return(paste0(x[1],":",x[2]))
  #concatentate term index / term count into a single string
  a<-paste(apply(dtm_row, 2, concat_column), collapse=" ")
  #number of words in this document
  b<-ncol(dtm_row)
  #return concatenation of words, and term_id/count
  return(paste(b,a))
}
#ldaformat(test[[1]])
out<-lapply(corpus$documents, ldaformat)
#check we dont have list of lists
#sapply(out, class)

#write out dtm
system("rm ./corpus.txt")
lapply(out, cat, "\n", file="corpus.txt", append=TRUE)

#write out vocab
system("rm vocab.dat")
(lapply(corpus$vocab, cat, "\n", file="vocab.dat", append=TRUE))



