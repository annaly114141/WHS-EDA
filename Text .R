###################### EDA ##################################

library(tm) 
library(SnowballC)
library(dplyr)

#Read file
corpus <- VCorpus(DirSource('./docs1'))

#Build Corpus
corpus <- Corpus(VectorSource(corpus))
#inspect(corpus[1]) #inspect first 1 col

#Create term document matrix
tdm <- TermDocumentMatrix(corpus,
                          control = list(minWordLength=c(1,Inf))) #terms: 191660 in 3 documents 
t <- removeSparseTerms(tdm, sparse = 0.98)
m <- as.matrix(t)

#Check details of documents
print(corpus)
class(corpus)
#Examine contents
corpus[1]
class(corpus[1])

class(corpus[[1]])
corpus[[1]]$meta
corpus[[1]]$content

# Clean text
corpus <- tm_map(corpus, tolower)
corpus[[1]]$content

corpus <- tm_map(corpus, removePunctuation)
corpus[[1]]$content

corpus <- tm_map(corpus, removeNumbers)
corpus[[1]]$content

corpus <- tm_map(corpus, removeWords, stopwords('english'))
corpus[[1]]$content

#corpus <- tm_map(corpus, removeWords, c('and', 'the', 'just', 'thats'))

tdm <- TermDocumentMatrix(corpus) #documents: 3, sparsity 67% 
tdm
tdm <- as.matrix(tdm)
tdm[1:10, 1:1] #first 10 words, 1 column