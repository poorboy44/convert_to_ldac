library(lda)
library(topicmodels)
setwd('/Users/snelson/workspace/turbotopics')
data<-unlist(read.table('sample_tweets.txt', stringsAsFactors=FALSE))
corpus<-lexicalize(data, lower=TRUE)

## convert to LDA-C format
test<-corpus$documents[1:2]
ldaformat<-function(dtm_row){
  concat_column<-function(x)
    return(paste0(x[1],":",x[2]))
  a<-paste(apply(dtm_row, 2, concat_column), collapse=" ")
  b<-ncol(dtm_row)
  return(paste(b,a))
}
ldaformat(test[[1]])
out<-lapply(test, ldaformat)
sapply(out, class)
lapply(out, cat, "\n", file="test.txt", append=TRUE)


