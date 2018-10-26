library(shiny)
library(ggplot2)  

shinyUI(pageWithSidebar(
  headerPanel('Game of Thrones'),
  sidebarPanel(
    checkboxGroupInput('show_vars', 'Columns control in dataset tab', names(char),
                       selected = names(char)), 
    
    sliderInput("n", 
                "Polar plot control (Number of families with highest mortality rate)", 
                value = 10,
                min = 1, 
                max = 20),
    
    
    sidebarPanel(
      selectInput("variable", "Scatterplot control",
                  list("Family" = "Allegiances", 
                       "Intro.Chap." = "Book.Intro.Chapter" 
                       ))),
    
    br(),
    br(),
    br(),
    br(),
    
    helpText("Game of Thrones are plenty fascinating enough on their own, and have 
            infuriated viewers and readers alike for years now. The things is, no character, good or bad, 
            major or minor is safe from Martin’s pen. 
             The reputation is not unwarranted; of the 916 named characters that 
             populate Martin’s world, a third have died, alongside uncounted nameless 
             ones. The analysis is devided by three parts, the first tab is game of thrones
            dataset, including 916 different characters who either dead or still alive
            in the show; the second tab is all about those unlucky families with highest 
            mortality rates, you can choose number of families with that slider; the third
            tab is a scatterplot, you can choose different variable on y axis against death.chapter
            variable on x axis.
            This analysis is inspired by Allen Downey's Bayesian survival analysis for Game of Thrones,
             relevant data are available from this github repository: https://github.com/benkahle/bayesianGameofThrones"
)),
  
  mainPanel(
    tabsetPanel(
      tabPanel('dataset',
               dataTableOutput("mytable1")),
      tabPanel('polar plot',
               plotOutput("plot")),
      tabPanel('scatter plot',
               plotOutput("plot2"))
    )
  )
))