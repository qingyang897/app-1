shinyUI(pageWithSidebar(
  headerPanel("Book Recommendation"),
  sidebarPanel(
    selectInput("type","choose the type of book you want:",
                choices=c("互联网","理财","历史","情感沟通","认知",
                     "思维逻辑","文学小说","写作","心理学","哲学",
                     "政治","职场")),
    sliderInput("score","choose a range of score",
                min=0,max=10,step=0.1,value=c(6,9)),
    numericInput("number","Number of observations:",value=5),
    submitButton("Update"),
    checkboxInput("choice","if you want to see summary:",value=F)
    
  ),
  mainPanel(
    tabsetPanel(
      tabPanel("Cover",img(src="reading.jpg",height=400,width=500)),
      tabPanel("Summary",verbatimTextOutput("summary")),
      tabPanel("General",plotOutput("plot")),
      tabPanel("Table",DT::dataTableOutput("book"))
      
      
      
      
    )
    
  )
  
))
