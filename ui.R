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
        theme = bs_theme(bootswatch ="lux"),
        # Application title
        title = tags$b("Chengyu Ouyang"),
        
        # Body
        # 1 Home Page -----
        tabPanel("Home", 
                 
                 br(),
                 br(),
                 br(),
                 
                 fluidRow(
                     column(1),
                     column(10,
                            align="center",
                            jumbotron(
                                "Hello World",
                                tags$h6("Let's view the world through the lense of data science!"),
                                button = F)
                     ),
                     column(1)
                 ),
                 
                 br(),
                 br(),
                 br(),
                 
                 fluidRow(align="center",
                          column(4),
                          column(4,align="center",img(src="mepix2.png",height = 200, width = 200)),
                          column(4)
                          ),
                 
                 br(),
                 
                 fluidRow(align="center",
                          column(2),
                          column(8, 
                                 tags$h4("About me")),
                          column(2)),
                
                 
                 fluidRow(align="center",
                          column(2),
                          column(8, 
                                 tags$p("In case you are wondering - your internet is not broken. 
                                         I am Chengyu and you are seeing my pixel selfie here. 
                                         It's the internet, I like to be as mysterious as a pixel selfie. 
                                         But still, I am an experienced and aspiring data scientist. 
                                         I like to dig around the internet and find interesting data. 
                                         My favourite language of analysis is R, I even call myself Rtist as a joke.")),
                          column(2)),
                 
                 br(),
                 br(),
                 
                 fluidRow(align="center",
                          column(4),
                          infoBox(tags$h6("GitHub"), "", width = 1, icon = icon("github fa-4x"), href = "https://github.com/chengyuO"),
                          infoBox(tags$h6("LinkedIn"), "", width = 1, icon = icon("linkedin fa-4x"), href = "https://uk.linkedin.com/in/chengyuouyang"),
                          infoBox(tags$h6("Twitter"), "",  width = 1, icon = icon("twitter fa-4x"), href = "https://twitter.com/Chengyu11048215"),
                          infoBox(tags$h6("Email"), "", width = 1, icon = icon("envelope fa-4x"), href = "mailto:chengyu0uyangdata@outlook.com"),
                          column(4)
                 )
        ),
        
        # 2 Blog ----
        navbarMenu("My Data Science Blog", 
                   
                   ## Blog 1 ----
                   tabPanel("Blog 1"),
                   
                   ## Blog 2 ----
                   tabPanel("Blog 2")
                   ),
        
        # 3 Analysis dashboard page ----
        navbarMenu("My Analysis Dashboard",
                 
                 ## Dashboard 1 ----
                 tabPanel("My Spotify"),
                 
                 ## Dashboard 2 ----
                 tabPanel("Covid Tweets")
                 ),
        
        
        # Other project ---
        
        # 4 More about me page -----
        tabPanel("More")
        
    )
