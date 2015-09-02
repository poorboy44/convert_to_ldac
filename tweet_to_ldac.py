
# coding: utf-8

# In[116]:

## converts tweets to LDAC format
from collections import defaultdict
import codecs
fin='sample_tweets.txt'
fout=fin+'.ldac'



# In[117]:

#word count
token_set = defaultdict(int)
with codecs.open(fin, 'rb', encoding='utf-8') as f:
    for line in f:
        tokens=line.strip().lower().split(' ')
        for token in tokens:
            token_set[token]+=1


# In[118]:

#delete terms with only 1 occurence
token_set2={k: v for k, v in token_set.iteritems() if v>10 and len(k)>2}
print(len(token_set))
print(len(token_set2))


# In[119]:

#create the vocab
vocab={k:i for i, k in enumerate(token_set2.keys())}


# In[120]:

#create the DTM
line_num=0
vocab_set=set(vocab.keys())
with codecs.open(fin, 'r', encoding='utf-8') as f, open(fout, 'w') as out:
    for line in f:
        try:
            line_num+=1
            tokens=line.strip().lower().split(' ')
            term_intersect=set(tokens).intersection(vocab_set)
            if len(term_intersect) > 0:
                token_indices=[vocab[token] for token in term_intersect] 
                #print(token_indices)
                str1=":1 ".join(["{}".format(i) for i in token_indices])+':1'
                #print(str1)
                out.write("{} {}\n".format(len(token_indices), str1))
        except:
            print("error")
            continue
                


# In[121]:

with open(fin+'.vocab', 'wb') as vocab_out:
    for k, v in vocab.items():
        #print "{} {}\n".format(v,k)
        vocab_out.write("{} {}\n".format(v, k.encode('utf-8')))


# In[ ]:



