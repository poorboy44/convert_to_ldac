# convert_to_ldac
Convert tweets to LDA-C form for using David Blei's LDA and turbotopics code

- Reads in a file into R
- Uses LDA package to convert to DTM 
- export to the specific format required by Blei as per his README: http://www.cs.princeton.edu/~blei/lda-c/readme.txt:

     [M] [term_1]:[count] [term_2]:[count] ...  [term_N]:[count]

where [M] is the number of unique terms in the document, and the
[count] associated with each term is how many times that term appeared
in the document.  Note that [term_1] is an integer which indexes the
term; it is not a string.
