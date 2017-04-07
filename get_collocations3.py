import string
from nltk.tokenize import word_tokenize
from nltk.collocations import BigramCollocationFinder
from nltk.collocations import BigramAssocMeasures
from nltk.corpus import stopwords

#This is the script Allison Hegel gave us to use in her Collocation Workshop on 2017-04-07. We ran this in 
#Anaconda Spyder (invoked by typing "spyder" at terminal if you have Anaconda installed.)
#GitHub repo with this and other related Python collocation scripts is https://github.com/ahegel/scripts

stops = []
for i in stopwords.words('english'):
    if i != "she" and i != "her":
        stops.append(i)


# find collocations for each word
def get_collocations(corpus, windowsize=10, numresults=25):
   #This function uses the Natural Language Toolkit to find the top collocations in a corpus.
    #It takes as an argument a string that contains the corpus you want to
    #find collocations from. It prints the top collocations it finds.
    
    # convert the corpus (a string) into  a list of words
    tokens = word_tokenize(corpus)
    # initialize the bigram association measures object to score each collocation
    bigram_measures = BigramAssocMeasures()
    # initialize the bigram collocation finder object to find and rank collocations
    finder = BigramCollocationFinder.from_words(tokens, window_size=windowsize)
    # apply a series of filters to narrow down the collocation results
    ignored_words = stops
    finder.apply_word_filter(lambda w: len(w) < 2 or w.lower() in ignored_words)
    #Use not() if you want to define a tight screen of certain kinds of words you want to keep, as in 
    #say, only look at words ending in "ed", etc.  
   #
    finder.apply_freq_filter(3)
    # calculate the top results by T-score
    # list of all possible measures: .raw_freq, .pmi, .likelihood_ratio, .chi_sq, .phi_sq, .fisher, .student_t, .mi_like, .poisson_stirling, .jaccard, .dice
   #Increase this frequency filter number if you're getting a lot of noise.
   
    results = finder.nbest(bigram_measures.student_t, numresults)
    # print the results
    print("Top ", str(numresults), " collocations:")
    for k, v in results:
        print(str(k), ", ", str(v))


def get_keyword_collocations(corpus, keyword, windowsize=10, numresults=25):
    #This function uses the Natural Language Toolkit to find collocations
    #for a specific keyword in a corpus. It takes as an argument a string that
    #contains the corpus you want to find collocations from. It prints the top
    #collocations it finds for each keyword.
    #windowsize = the number of words on either side that are collocated
   
    # convert the corpus (a string) into  a list of words
    tokens = word_tokenize(corpus)
    # initialize the bigram association measures object to score each collocation
    bigram_measures = BigramAssocMeasures()
    # initialize the bigram collocation finder object to find and rank collocations
    finder = BigramCollocationFinder.from_words(tokens, window_size=windowsize)
    # initialize a function that will narrow down collocates that don't contain the keyword
    keyword_filter = lambda *w: keyword not in w
    # apply a series of filters to narrow down the collocation results
    ignored_words = stops
    finder.apply_word_filter(lambda w: len(w) < 2 or w.lower() in ignored_words)
    finder.apply_freq_filter(1)
    finder.apply_ngram_filter(keyword_filter)
    # calculate the top results by T-score
    # list of all possible measures: .raw_freq, .pmi, .likelihood_ratio, .chi_sq, .phi_sq, .fisher, .student_t, .mi_like, .poisson_stirling, .jaccard, .dice
    results = finder.score_ngrams(bigram_measures.raw_freq)
    # print the results
    print("Top collocations for ", str(keyword), ":")
#    collocations = ''
#    for k, v in results:
#        if k != keyword:
#            collocations += k + ' '
#        else:
#            collocations += v + ' '
#    print(collocations, '\n')
    print(results)


# Replace this with your filename
infile = "southey_curse_of_kehama.txt"

# Read in the corpus you want to find collocations from
with open(infile) as tmpfile:  
    data = tmpfile.read()

# Clean the data
translator = str.maketrans('', '', string.punctuation)
data = data.translate(translator)  # remove punctuation
data = "".join(i for i in data if ord(i) < 128)  # remove non-ascii characters
data = data.lower()
# Get the top collocations for the entire corpus
get_collocations(data, windowsize=20)
print(' ')

# Replace this with a list of keywords you want to find collocations for
words_of_interest = ["she", "reason", "ill", "drunk", "sin", "counsel", "mad", "body", "soul", "poor", "love", "die", "faith", "intense", "revolutions", "power", "fear", "terror"]

# Get the top collocations for each keyword in the list above
for word in words_of_interest:
    get_keyword_collocations(data, word, windowsize=20, numresults=25)
