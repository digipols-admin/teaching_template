########################################################################
# 1. Load Required Packages
########################################################################

# Uncomment to install packages if needed:
# install.packages(c("tidyverse", "tidytext", "kableExtra"))

library(tidyverse)
library(tidytext)
library(kableExtra)
library(here) # for easy directory paths, defines your root directory 

########################################################################
# 2. Example Dataset of Participatory Budgeting (mostly campaigns)
########################################################################
df <- read_csv(here("data/tw.csv")) # load data with here()
# df <- read_csv("data/tw.csv") # use this code if you prefer without here()

########################################################################
# 3. View Data Using kableExtra
########################################################################

df %>%
  head(5) %>%
  kable() %>%
  kable_styling(full_width = FALSE, 
                bootstrap_options = c("striped", "hover"))

########################################################################
# 4. Tokenize and Clean Text
########################################################################

# 4.1. Tokenization
df_tokens <- df %>%
  mutate(tweet_id = row_number()) %>%  # Create a simple ID for each tweet
  unnest_tokens(word, text)           # Break tweets into individual words

# 4.2. Remove Stop Words
data("stop_words")  # Provided by tidytext
df_tokens_clean <- df_tokens %>%
  anti_join(stop_words, by = "word")

########################################################################
# 5. Perform Sentiment Analysis Using AFINN
########################################################################

# The AFINN lexicon assigns an integer score to each word (range: -5 to 5).
afinn <- get_sentiments("afinn")

# 5.1 Join tokenized tweets with AFINN to get word-level scores
df_afinn <- df_tokens_clean %>%
  inner_join(afinn, by = "word")

# 5.2 Summarize the sentiment score for each tweet
tweet_scores <- df_afinn %>%
  group_by(tweet_id) %>%
  summarise(sentiment_score = sum(value), .groups = "drop")

# 5.3 Merge scores back with the original tweets if you want
df_scored <- df %>%
  mutate(tweet_id = row_number()) %>%
  left_join(tweet_scores, by = "tweet_id") %>%
  # Replace NA scores with 0 for tweets that had no matched words
  mutate(sentiment_score = if_else(is.na(sentiment_score), 0, sentiment_score))

########################################################################
# 6. Convert Numeric Scores to Positive, Neutral, Negative
########################################################################

# Define categories based on the numeric AFINN score:
df_scored <- df_scored %>%
  mutate(
    sentiment_category = case_when(
      sentiment_score > 0  ~ "Positive",
      sentiment_score < 0  ~ "Negative",
      TRUE                 ~ "Neutral"  # Covers sentiment_score == 0
    )
  )


########################################################################
# 7. Save sentiment dataframe
########################################################################

df_scored %>% 
  write_csv("data/tw_sentiment_afinn.csv")

