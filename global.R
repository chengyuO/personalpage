# 1 Set up ----
library(dplyr)
library(lubridate)
library(yaml)
library(knitr)
library(config)
library(jsonlite)
library(tidyverse)
library(spotifyr)
library(devtool)
library(spotifyr)

# 2 Data ----

## Spotify streaming history, following artists and inference labels
StreamingHistory1 =
  read_json("Data/Spotify/StreamingHistory1.json") %>%
  bind_rows()

StreamingHistory2 =
  read_json("Data/Spotify/StreamingHistory2.json") %>%
  bind_rows()

Inferences =
  read_json("Data/Spotify/Inferences.json") %>%
  unlist()

Follow =
  read_json("Data/Spotify/Follow.json")

FollowingArtists =
  Follow$followingArtists %>%
  unlist()

StreamingHistory =
  StreamingHistory1 %>%
  bind_rows(StreamingHistory2)

## Instagram
ins_topics =
  fromJSON("Data/Instagram_topics/your_topics.json", flatten = T)

ins_topics =
  ins_topics$topics_your_topics

ins_reels_topics =
  fromJSON("Data/Instagram_topics/your_reels_topics.json", flatten = T)

ins_reels_topics =
  ins_reels_topics$topics_your_reels_topics

ins_reels_sentiments =
  fromJSON("Data/Instagram_topics/your_reels_sentiments.json",
           flatten = T)

ins_reels_sentiments =
  ins_reels_sentiments$topics_your_reels_emotions

## Spotify API Authentication

### set the active configuration globally via Renviron.site or Rprofile.site
Sys.setenv(R_CONFIG_ACTIVE = "default")
config = config::get()
Sys.setenv(SPOTIFY_CLIENT_ID = config$client_id)
Sys.setenv(SPOTIFY_CLIENT_SECRET = config$client_secret)
access_token = get_spotify_access_token()

get_my_top_artists_or_tracks(type = 'artists', time_range = 'long_term', limit = 10) %>% 
  select(name, genres) %>% 
  rowwise %>% 
  mutate(genres = paste(genres, collapse = ', ')) %>% 
  ungroup %>% 
  kable()

get_my_top_artists_or_tracks(type = 'tracks', time_range = 'long_term', limit = 10) %>% 
  mutate(artist.name = map_chr(artists, function(x) x$name[1])) %>% 
  select(name, artist.name, album.name) %>% 
  kable()


 
