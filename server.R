library(shiny)
library(DT)
data=read.csv("g:\\book.csv",header = T)
shinyServer(function(input,output){
  inputdata<-reactive({
      index1=which(data$type==input$type)
      index2=which(input$score[1]<=data$score & data$score<=input$score[2])
      index=intersect(index1,index2)
      data[index,]
      
  })
  output$book<-DT::renderDataTable({
    bookdata=inputdata()
   
    head(bookdata,n=input$number)
  })
  
  output$plot<-renderPlot({
    
    plot(data$type,data$score,axis.cex=0.1,col="red")
    
  })
  output$summary<-renderPrint({
    if (!input$choice) return(cat("数据被隐藏了"))
    dataset<-inputdata()
    table(data$type)
  })

})
