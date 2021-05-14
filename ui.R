library(shiny)
library(shiny)
library(shiny.router)
library(shinyBS)
library(bslib)
library(shinyLP)
library(shinythemes)
library(flexdashboard)
library(shinydashboard)

ui =
    navbarPage(
        theme = bs_theme(version = 4, bootswatch = "lux"),
        # Application title
        title = tags$b("Chengyu Ouyang"),
        
        # Body
        # 1 Home Page -----
        tabPanel(
            "Home",
            
            br(),

            fluidRow(column(1),
                     column(
                         10,
                         align = "center",
                         jumbotron(
                             "Hello World",
                             tags$h6("I am Chengyu and Welcome to my data science portfolio!"),
                             button = F
                         )
                     ),
                     column(1)),
            
            br(),
            
            fluidRow(
                align = "center",
                column(3),
                column(2, align = "center", img(
                    src = "mepix1.png",
                    height = 200,
                    width = 200
                )),
                column(2, align = "center", img(
                    src = "mepix2.png",
                    height = 200,
                    width = 200
                )),
                column(2, align = "center", img(
                    src = "mepix3.png",
                    height = 200,
                    width = 200
                )),
                column(3)
            ),
            
            br(),
            ##  About me and this dashboard-----
            fluidRow(align = "center",
                     column(2),
                     column(4,
                            tags$h4("About me")),
                     column(4,tags$h4("About this dashboard")),
                     column(2)),
            
            fluidRow(align = "center",
                     column(2),
                     column(
                         4,
                         tags$p(
                             "In case you are wondering - your connection is not broken.
                             Yes, you are seeing my pixel portraits here.
                             It's the internet, I'd like to be as mysterious as a pixel person.
                             Besides being a pixel person - I am also a data scientist and a passionate R user.
                             If you want to find me - please feel free to use one of the contact methods below.
                             "
                         )
                     ),
                     column(4,   tags$p(
                         "I have built this R shiny web app as my portfolio and a platform to share my thoughts on data science topics. 
                          On My Spotify Dashboard page, you can find the analysis about my music tastes (spoilers: I prefer happy songs). 
                          All data are exported from Spotify open API.
                          More contents to come soon and stay tuned!"
                     )),
                     column(2)),
            
            br(),
            
            ##  Contact -----
            fluidRow(align = "center",
                     column(2),
                     column(8,
                            tags$h4("Contact")),
                     column(2)),
            
            br(),
            
            
            fluidRow(
                align = "center",
                column(4),
                infoBox(
                    tags$h6("GitHub"),
                    "",
                    width = 1,
                    icon = icon("github fa-3x"),
                    href = "https://github.com/chengyuO"
                ),
                infoBox(
                    tags$h6("LinkedIn"),
                    "",
                    width = 1,
                    icon = icon("linkedin fa-3x"),
                    href = "https://uk.linkedin.com/in/chengyuouyang"
                ),
                infoBox(
                    tags$h6("Twitter"),
                    "",
                    width = 1,
                    icon = icon("twitter fa-3x"),
                    href = "https://twitter.com/Chengyu11048215"
                ),
                infoBox(
                    tags$h6("Email"),
                    "",
                    width = 1,
                    icon = icon("envelope fa-3x"),
                    href = "mailto:chengyu0uyangdata@outlook.com"
                ),
                column(4)
            ),
            br()
        ),
        
        # 2 My Spotify Dashboard ----
        navbarMenu(
            "My Spotify Dashboard",
            tags$head(
                tags$style(
                    ".myRow1{height:800px;width:2000px;}
                    .myRow2{height:400px;}")),
                
                ## My Favourite Songs ----
                tabPanel(
                    "My Favourite Songs",
                    br(),
                    fluidRow(class="myRow1", 
                             column(6,highchartOutput(width = 800,height = 800,"energyValencePlot")),
                             
                             column(6,highchartOutput(width = 800,height = 400,"danceabilityPlot"),
                                    highchartOutput(width = 800,height = 400,"loudnessPlot"))
                             )
                      ),
                
                ## My Favourite Artists ----
                tabPanel("My Favourite Artists",
                         br(),
                         fluidRow(class = "myRow1",
                                  column(6,highchartOutput(width = 800,height = 800,"genreWordcloud")),
                                  column(6,highchartOutput(width = 800,height = 800,"popularityPlot"))
                                  )
                         )
            ),
            
            # 3 Blog ----
            # navbarMenu(
            #     "My Data Science Blog",
            #     
            #     ## Blog 1 ----
            #     tabPanel(
            #         "Blog 1",
            #         br(),
            #         br(),
            #         column(4),
            #         column(
            #             8,
            #             align = "left",
            #             tags$h1("Blog 1 title"),
            #             br(),
            #             tags$p("This is a simple blog about how to do this or this - testing contents")
            #         )
            #     ),
            #     
            #     ## Blog 2 ----
            #     tabPanel("Blog 2")
            # ),
            
            # 4 More about me page -----
            tabPanel("More",
                     br(),
                     br(),
                     fluidRow(align ="center",
                              column(2),
                              column(8,
                                     tags$iframe(width="800", height="500", 
                                     src="https://www.youtube.com/embed/F5WWyyYG018?controls=0", title="Frank Ocean",
                                     frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", 
                                     allowfullscreen=NA)),
                              column(2)
                         ),
                     br(),
                     br(),
                     fluidRow(align = "center",
                              column(4),
                              column(
                                  4,
                                  tags$h4("Special Thanks To"),
                                  
                                  tags$h6("Charlie Thompson"),
                                  tags$h6("Bo Plantinga"),
                                  tags$h6("My friends and family")
                              ),
                              column(4))
                     ,
                     fluidRow(align = "center",
                              column(4),
                              column(4,
                                     tags$h4("Useful Links"),
                                     
                                     tags$h6(tags$a(href="https://www.rcharlie.com/spotifyr/","Spotifyr")),
                                     tags$h6(tags$a(href="http://www.rcharlie.net/sentify/",
                                                    "Sentify")),
                                     tags$h6(tags$a(href="https://www.rcharlie.com/blog/fitter-happier/",
                                                    "FITTER HAPPIER")),
                                     tags$h6(tags$a(href="https://medium.com/@boplantinga",
                                                    "Bo Plantinga")),
                                     tags$h6(tags$a(href="https://developer.spotify.com/documentation/web-api/reference/#objects-index","Spotify API Index"))
                                     ),
                              column(4)
                              ),
                     
                     br(),
                     br()
                     
                     
                     
                    
                     )
            
        )
        