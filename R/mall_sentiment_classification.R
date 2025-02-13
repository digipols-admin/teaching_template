# Load libraries
library(tidyverse)
library(ollamar)
library(ellmer)
library(mall)

# Load dataframe
tw <- read_csv("data/tw.csv")

# Load LLM
ollamar::test_connection() # test connection
list_models() # get a list of locally installed models
ollamar::pull('llama3.1:latest') # pull a model

### Define Meta's llama
llm_use(
    backend = "ollama",
    model = "llama3.1:latest",
    .silent = TRUE,
    seed = 123,
    temperature = 0
)

# Perform sentiment analysis
tw_sentiment_llama <- tw |>
    llm_sentiment(col = text,
                  pred_name = "llama_sentiment")

# Save dataframe
tw_sentiment_llama %>%
    write_csv("data/tw_sentiment_llama.csv")


# Perform a classification analysis
# Technically, this is similar to one-shot classification. Define some frames.
frame_values <- c("justice","democracy","finances or resources","problems")

# Perform classification analysis
# The results are not good, which point to limitations in the
# classification function
tw_classification_llama <- tw |>
    llm_classify(
        col = text,
        labels = frame_values,
        pred_name = "llama_classification")

# Save dataframe
tw_classification_llama %>%
    write_csv("data/tw_classification_llama.csv")



