library(shiny)

shinyServer(function(input, output) {
  

  
  # a large table, reative to input$show_vars
  output$mytable1 = renderDataTable({
    library(ggplot2)
    char[, input$show_vars, drop = FALSE]
  })
  
  # plot
  output$plot <- renderPlot({
    library(ggplot2)
    library(dplyr)
    n <- input$n
    Alle<- subset(char,!Allegiances=="None")
    by_Alle<-group_by(Alle,Allegiances)
    Allemost<-summarize(by_Alle,death=sum(Death.Year,na.rm=T))
    Alle_most<-arrange(Allemost,desc(death))[1:n,]
    ggplot(aes(Allegiances,death),data=Alle_most)+geom_bar(stat="identity")+coord_polar()
  })
  
  # plot2
  output$plot2 <- renderPlot({
    library(ggplot2)
    library(dplyr) 
    Alle<- subset(char,!Allegiances=="None")   
    ggplot(aes_string(x="Death.Chapter",y=input$variable,color="Gender"),data=Alle)+facet_grid(.~Gender)+geom_point()
  })
})