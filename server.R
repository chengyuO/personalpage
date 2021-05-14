library(memisc) 
library(shiny)
library(ggplot2)
library(r2d3)
library(htmltools)
library(spotifyr)
library(dplyr)
library(highcharter)
library(shinyWidgets)
library(RColorBrewer)

server =
    function(input, output) {
      
    # Danceability plot ----
      
    output$danceabilityPlot = 
      renderHighchart({
        hchart(density(top_tracks_audio_features$danceability),type = "area", name = 'Danceability',color ="#1DB954",tooltip = list(pointFormat = "")) %>% 
          hc_xAxis(title = list(text = '') , min=0,max=1) %>%
          hc_yAxis(title = list(text = 'Density')) %>% 
          hc_title(text = 'Danceability Distribution of My Top 50 Favourite Songs') %>% 
          hc_tooltip(
            crosshairs = F
          )
         })
      
    # Loudness plot ----
    
    output$loudnessPlot = 
      renderHighchart({
        hchart(density(top_tracks_audio_features$loudness),type = "area", name = 'Loudness',color ="#1DB954",tooltip = list(pointFormat = "")) %>% 
          hc_xAxis(title = list(text = '') , min=-60,max=0) %>%
          hc_yAxis(title = list(text = 'Density')) %>% 
          hc_title(text = 'Loudness Distribution of My Top 50 Favourite Songs') 
      })
    
    # Energy vs valence  plot ----
    output$energyValencePlot = 
      renderHighchart(
        {
          top_tracks_audio_features %>% 
            mutate(tooltip=
                     paste0('<a style = "margin-right:150px">','<img src=',album.images,
                            ' height="50" style="float:left;margin-right:5px">',
                            '<b>Album :</b> ',album.name,'</a>',
                            '<br><b>Track :</b> ', name,'</a>')) %>% 
            hchart(type = 'scatter', hcaes(y = energy , x = valence),color ="#c8a2c8") %>% 
            hc_tooltip(formatter = JS(paste0("function() {return this.point.tooltip;}")), useHTML = T) %>% 
            hc_xAxis(title = list(text = 'Valence') ,min = 0, max =1,
                     plotLines = 
                       list(list(
                         value = 0.5,
                         color = '#000000',
                         width = 2,
                         zIndex = 5,
                         label = list(text = "Fast/Noisy",
                                      style = list( color = '#000000', fontWeight = 'bold'))
                       )
                       )) %>%
            hc_yAxis(title = list(text = 'Energy'),min = 0, max =1,
                     plotLines = 
                       list(list(
                         value = 0.5,
                         color = '#000000',
                         width = 2,
                         zIndex = 5,
                         label = list(text = "Sad/Depressing",
                                      style = list( color = '#000000', fontWeight = 'bold'))
                       )
                       )
            ) %>% 
            hc_title(text = 'Mood Distribution of My Top 50 Favourite Songs') 
        }
      )

    output$genreWordcloud =
      renderHighchart({
        top_artists$genres %>% 
          unlist() %>% 
          table() %>% 
          as.data.frame() %>% 
          dplyr::rename(word=".",
                 n="Freq") %>% 
          dplyr::arrange(n) %>% 
          hchart("wordcloud", hcaes(name = word, weight = n),
                 tooltip = list(pointFormat = "Count {point.n}")) %>% 
          hc_title(text = 'Genres of My Top 50 Favourite Artists') 
      })
    
    output$popularityPlot =
      renderHighchart({
        top_artists %>% 
          dplyr::select(name,popularity,images_160) %>%
          mutate(rank=50:1) %>% 
          as.data.frame() %>% 
          mutate(tooltip=
                   paste0('<a style = "margin-right:50px">','<img src=',images_160,
                          ' height="30" style="float:left;margin-right:5px">',name,'</a>')) %>% 
          hchart(type = 'scatter', hcaes(y = popularity , x = rank),color ="#c8a2c8") %>% 
          hc_tooltip(formatter = JS(paste0("function() {return this.point.tooltip;}")), useHTML = T) %>% 
          hc_xAxis(title = list(text = 'Rank (least to most favourite)') ,min = 1, max =50) %>%
          hc_yAxis(title = list(text = 'Popularity'),min = 0, max =100,
                   plotLines = 
                     list(list(
                       value = 50,
                       color = '#000000',
                       width = 2,
                       zIndex = 5,
                       label = list(text = "",
                                    style = list( color = '#000000', fontWeight = 'bold'))
                     )
                     )) %>% 
          hc_title(text = 'Popularity Distribution of My Top 50 Favourite Artists') 
        
      })
  }
