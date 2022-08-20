#Load 'rtweet' library for hashtag, keyword or Twitter users activity retrieval on Twitter.
library('rtweet')
library('tidyverse')


# Below chunk of code searches and retrieve tweets on "smartgrid" OR "sustainability", 
#keywords from Twitter platform.

target_tweets<-search_tweets(
  q="smartgrid OR sustainability",
  n=17900,
  include_rts = FALSE,
  lang="en",
  retryonratelimit = TRUE )

#save the retrieved data 'target_tweets' in the current directory.
target_tweets %>% write_csv("raw_target_tweets20Aug2022.csv")


#Converting the data set into a short and cleaner data set as required. 
manipulated_tweets20Aug2022<-target_tweets%>%
  select(user_id, screen_name, created_at, text, favorite_count, 
         quoted_location, favorite_count, hashtags, mentions_user_id, 
         mentions_screen_name, quoted_followers_count)

#save the manipulated data set 'mtarget_tweets20Aug2022' in the current directory.
manipulated_tweets20Aug2022 %>% write_csv("manipulated_tweets20Aug2022.csv")
