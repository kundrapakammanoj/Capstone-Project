
#Load the n-gram databases 

load=("bigram.Rds")
load=("trigram.Rds")
load=("quadgram.Rds")

#Load the necessary libraries
library(stringr)
library(dplyr)
library(tm)
library(stylo)

proc1 <- function(sentence){
  
  a <- unigramlist$unigram
  
  return(as.String(a[10]))
}
proc <- function(sentence){
  value = "And the prediction is..."
  sen = unlist(strsplit(sentence,' '))
  if(length(sen)>=3){
    value = quadgram(sen[(length(sen)-2):length(sen)])
  }
  
  if(is.null(value)||length(sen)==2){
    value = trigram(sen[(length(sen)-1):length(sen)])
    
  }
  if(is.null(value)||length(sen)==1){
    value = bigram(sen)
    
  }
  if(is.null(value)){
    value = "No value found in the sample please try different word"
  }
  
  return(value)
}







bigram<-function(twog){
  two <- paste(twog,collapse = ' ')
  for(i in 1:nrow(bigramlist)){
    if(unlist(strsplit(as.character(bigramlist[i,1]),' '))[1]==two){
      sen <- unlist(strsplit(as.String(bigramlist[i,1]),' '))
      return (paste(twog,"",sen[length(sen)]))
      
      }
  }
}


trigram<-function(threeg){
  three <- unlist(strsplit(as.character(threeg),' '))
  for(i in 1:nrow(trigramlist)){
    if(unlist(strsplit(as.character(trigramlist[i,1]),' '))[1]==three[1] && unlist(strsplit(as.character(trigramlist[i,1]),' '))[2]==three[2] ){
      sen <- unlist(strsplit(as.String(trigramlist[i,1]),' '))
      return (sen)
      
    }
  }
}


quadgram<-function(fourg){
  four <- unlist(strsplit(as.character(fourg),' '))
  for(i in 1:nrow(quadgramlist)){
    if(unlist(strsplit(as.character(quadgramlist[i,1]),' '))[1]==four[1] && unlist(strsplit(as.character(quadgramlist[i,1]),' '))[2]==four[2] && unlist(strsplit(as.character(quadgramlist[i,1]),' '))[3]==four[3]    ){
      sen <- unlist(strsplit(as.String(quadgramlist[i,1]),' '))
      return (sen)
    }
  }
}
